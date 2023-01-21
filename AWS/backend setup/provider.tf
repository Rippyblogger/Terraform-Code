terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
  access_key = "${var.ACCESS_KEY}"
  secret_key = "${var.SECRET_KEY}"
}

# terraform {
#   backend "s3" {
#   bucket = "my-tf-test-bucket-52343"
#   key = "test_key"
#   region = "eu-west-1"
# }
# }
