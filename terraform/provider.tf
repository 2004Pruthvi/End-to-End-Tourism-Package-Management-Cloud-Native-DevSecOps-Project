terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }

  required_version = ">=1.16.0"
}

provider "aws" {
  region = "ap-south-1"
}
