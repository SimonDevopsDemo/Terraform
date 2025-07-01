variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}
