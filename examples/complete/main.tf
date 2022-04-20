terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "ecr" {
  source               = "../../"
  name                 = "example-inflab-ecr"
  encryption_type      = "AES256"
  scan_on_push         = "false"
  expire_count         = 10
  image_tag_mutability = "MUTABLE"

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}
