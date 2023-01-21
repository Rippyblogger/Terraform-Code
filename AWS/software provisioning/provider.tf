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

