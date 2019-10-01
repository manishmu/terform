provider "aws" {
  profile = "default"
  shared_credentials_file = "/Storage/terraform-work/.aws/credentials"
  region  = "us-east-1"
  }
resource "aws_iam_user" "test" {
  name = "Sarish"
}
resource "aws_iam_group_membership" "test" {
  name = "tf-testing-group-membership"
  users = [ "Sarish" ]
  group = "Eng"
  depends_on = ["aws_iam_user.test"]
  }
resource "aws_security_group" "webserver" {
  name = "webserver"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
    }  
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }
resource "aws_instance" "Web" {
ami = "ami-0ff8a91507f77f867"
instance_type = "t2.micro"
key_name = "EC2_tf_test"
user_data = "${file("/Storage/terraform-work/install.sh")}"
vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
count = "1"
  tags {
    Name = "Webserver"
  } 
  }
