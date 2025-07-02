provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "../../resource_modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_config.cidr_block
  public_subnet_cidr = var.vpc_config.subnet_cidr_block
}

module "ec2_instance" {
  source         = "../../resource_modules/ec2"
  subnet_id      = module.vpc.public_subnet_id
  instance_type  = var.ec2_config.instance_type
  ami_id         = var.ec2_config.ami_id
  instance_name  = var.ec2_config.instance_name
}