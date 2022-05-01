#Resource vpc

resource "aws_vpc" "vpc-us-west-1" {
  cidr_block = "10.0.0.0/16"
  #meta argument
  provider = aws.aws-west-1
  tags = {
    "Name" = "del-vpc-us-west-1"
  }
}