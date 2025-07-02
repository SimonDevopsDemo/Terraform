variable "ami_id" {
  type        = string
  description = "AMI ID used to launch the EC2 instance."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (e.g., t2.micro)."
}

variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance."
}

variable "subnet_id" {
  type        = string
  description = "subnet id for instance."
}