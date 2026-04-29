terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }

backend "s3" {
  bucket = "tai-tf-s3-bucket"
  key    = "terraform.tfstate"
  region = "eu-west-1"  
  #dynamodb_table = "tai-tf-dynamodb-table"
  use_lockfile = true
  }

}