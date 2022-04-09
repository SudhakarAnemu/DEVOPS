# Teraform block

terraform {
    #required_version = "~> 0.14"
    required_providers {
       aws = {
           source = "hashicorp/aws"
           version = "~> 3.0"
       }
    }
}

# Provider block

provider "aws" {
    region = "us-east-1"
    #access_key = "path.cwd"
    #profile =""
}
