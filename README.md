
# Terraform AWS VPC and EC2

## Overview
This project uses Terraform to provision basic AWS infrastructure.

## Resources
- AWS VPC
- AWS Subnet
- Amazon EC2 instance
- Amazon Linux 2023 AMI lookup using SSM Parameter Store

## Prerequisites
- Terraform installed
- AWS CLI configured
- AWS credentials with the required permissions

## Deployment

Initialize Terraform:

    terraform init

Validate the configuration:

    terraform validate

Preview infrastructure changes:

    terraform plan

Deploy infrastructure:

    terraform apply

Remove resources when finished:

    terraform destroy
