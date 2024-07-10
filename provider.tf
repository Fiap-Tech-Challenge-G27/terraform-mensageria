variable "aws-region" {
  type        = string  
  description = "Região da AWS"
  default     = "us-east-1"
}

terraform {

  backend "s3" {
    bucket         = "techchallengestate-g27"
    key            = "terraform-mensageria/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    
    random = {
      version = "~> 3.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
