provider "aws" {
  version = "3.7.0"
  region = "eu-west-2"
}

resource "aws_s3_bucket" "jenkins_backup_bucket" {
  bucket = var.bucket_name
  acl = "private"
}