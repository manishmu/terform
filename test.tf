provider "aws" {
  profile = "default"
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
resource "aws_vpc" "main" {
  cidr_block = "190.160.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "Main"
    Location = "pune"
  }
 }
resource "aws_subnet" "subnet1" {
   vpc_id = "${aws_vpc.main.id}"
   cidr_block = "190.160.1.0/24"
   tags {
     Name = "subnet1"
   }
 }
resource "aws_instance" "Web" {
ami = "ami-0ff8a91507f77f867"
instance_type = "t2.micro"
key_name = "id_rsa"
count = "2"
  tags {
    Name = "Webserver"
  } 
  }
