terraform {
  required_version = ">= 1.0"

  # 把 state 存到 S3，讓 CI/CD 和本地共用
  backend "s3" {
    bucket = "sre-pretest-tfstate-use1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}