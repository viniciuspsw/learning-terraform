provider "aws" {
  region = terraform.workspace == "production" ? "us-east-2" : "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "vinicius-terraform-learning"
    key    = "terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-state-lock"
  }
}
