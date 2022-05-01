#Terraform block

terraform {
  #required_version = "~> 1.1.7"    #working 
  required_version = "~> 1.1" #working
  //required_version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.20.0"
    }

    /*
    random = {
      source = "hashicorp/random"
      #version = "~> 3.0.1"
      version = "< 3.0"
    }
    */
  }
}

# Provider-1 block for us-east-1

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Provider-2 block for us-west-1
# alias is using for multi provider concept

provider "aws" {
  region  = "us-west-1"
  profile = "default"
  alias   = "aws-west-1"
}