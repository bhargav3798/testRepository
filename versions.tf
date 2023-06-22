#terraform block

terraform {
  required_version = "~>0.14" #means any version equal and above 0.14
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
  #Adding Backend as S3 for remote state storage
  backend "S3" {
    bucket = "terraform-gdtc"
    key    = "dev/terraform.tfstate" #it will store terraform.tfstate file in S3 bucket
    region = "us-east-1"
  }

}

provider "aws" {
  region = var.aws_region
  profile = "default"
}