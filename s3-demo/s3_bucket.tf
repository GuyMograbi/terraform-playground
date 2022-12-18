resource "aws_s3_bucket" "example" {
  bucket = "test-s3-bucket-67851234"
  acl = "private"
  versioning {
    enabled = true
  }
tags = {
    Environment = "test"
     Project = "IA" 
  }
}