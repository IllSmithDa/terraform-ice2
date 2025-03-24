terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  } 
}

provider "aws" {
  region = "us-east-1"
}

// don't use quotes inside quotes for tag values
resource "aws_s3_bucket" "tf_state" {
  bucket = "sam-304-bucket"
  force_destroy = true

  tags = {
    Name = "Sams Bucket"
    Environment = "dev"
  }
  lifecycle {
    prevent_destroy = false
  }
}