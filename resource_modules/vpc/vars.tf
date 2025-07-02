variable "aws_region" {
  type        = string
  description = "AWS region (used for availability zone suffix)."
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block for the public subnet."
}