

#resourc block
/*
resource "aws_instance" "delec2demo" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  tags = {
    "Name" = "delec2demo"
  }
}

*/

#Resource vpc

resource "aws_vpc" "vpc-us-east-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "del-vpc-us-east-1"
  }
}