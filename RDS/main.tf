provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "postgres" {
  identifier         = "my-postgres-db"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  storage_type       = var.storage_type
  username           = var.db_username
  password           = var.db_password
  db_name            = var.db_name
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = true
}