# Resource block : Create random pet name
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

# Resource block: create AWS s3 bucket
resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id
  #bucket = random_pet.petname.id
  acl    = "public-read" #== deprecated
  #aws_s3_bucket_acl "public-read"
  #region = "us-east-1"  # This was not required in the latest aws providers.
  
}