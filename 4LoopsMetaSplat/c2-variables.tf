#Input variables. 

#AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

#AWS EC2 Instance type
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

#AWS EC2 instance key pair
variable "instance_keypair" {
  description = "AWS EC2 key pair that needs to be pair with EC2 instance"
  type        = string
  default     = "terraform-key"
}

#AWS EC2 Instance type - list
variable "instace_type_list" {
  description = "Ec2 Instance list type"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.large"]
}

#AWS EC2 Instance type - map
variable "instance_type_map" {
  description = "EC2 Instance map type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro",
    "qa"   = "t3.small",
    "prod" = "t3.large"
  }
}



