terraform {
  required_version = "~>1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    region         = "us-east-1"
    bucket         = "terraform-backend20241106155244479400000001"
    key            = "exercise/sonarqube/default.tfstate"
    dynamodb_table = "terraform_state"
    encrypt        = true
  }
}