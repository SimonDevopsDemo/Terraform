variable "aws_region" {
  default = "ap-south-1"
}

variable "db_username" {
  description = "Master DB username"
  type        = string
}

variable "db_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "storage_type" {
    description = "Default storage"
    type = string
}

variable "publicly_accessible" {
    description = "Public access"
    type = string
    default = true
}