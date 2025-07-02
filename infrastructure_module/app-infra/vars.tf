variable "aws_region" {
  type        = string
  description = "AWS region where resources will be provisioned."
}

variable "vpc_config" {
  type = object({
    cidr_block         = string
    subnet_cidr_block  = string
  })
  description = "VPC configuration including CIDR block and subnet range."
}

variable "ec2_config" {
  type = object({
    ami_id        = string
    instance_type = string
    instance_name = string
  })
  description = "EC2 instance settings."
}