terraform {
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

# Get the current Amazon Linux 2023 AMI for this region
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-subnet"
  }
}

# Create EC2 instance
resource "aws_instance" "main" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "${var.project_name}-ec2"
  }
}
