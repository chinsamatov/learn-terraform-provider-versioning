#This file uses the AWS and random providers to deploy a randomly named S3 bucket to the us-west-2 region.
provider "aws" {
  region = "us-west-2"
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

#  acl    = "public-read"
#  region = "us-west-2"

  tags = {
    public_bucket = true
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.sample.id
  acl    = "public-read"
}
