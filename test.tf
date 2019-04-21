provider "aws" {
  profile = "default"
  shared_credentials_file = "/home/manish/.aws/credentials"
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
resource "aws_instance" "Web" {
ami = "ami-0ff8a91507f77f867"
instance_type = "t2.micro"
key_name = "EC2_tf_test"
user_data = "${file("/Storage/terraform-work/install.sh")}"
vpc_security_group_id = "default"
count = "1"
  tags {
    Name = "Webserver"
  } 
  }
