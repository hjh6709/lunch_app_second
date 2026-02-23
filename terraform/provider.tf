# AWS 및 키 페어 설정
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

# ★ 기존 AWS에 등록된 키 페어를 참조 (새로 생성하지 않음)
# key_name = "Hello_kt" → variables.tf의 var.key_name으로 EC2에서 사용
# pem 파일은 GitHub Secrets(SSH_PRIVATE_KEY)에 한 번만 등록하면 됨
