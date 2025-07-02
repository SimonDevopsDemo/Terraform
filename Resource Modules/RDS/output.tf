output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.postgres.id
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.postgres.arn
}

output "db_instance_status" {
  description = "The current status of the RDS instance"
  value       = aws_db_instance.postgres.status
}

output "db_engine_version" {
  description = "The actual engine version in use"
  value       = aws_db_instance.postgres.engine_version_actual
}

output "db_subnet_group" {
  description = "The name of the DB subnet group"
  value       = aws_db_instance.postgres.db_subnet_group_name
}

output "db_parameter_group" {
  description = "The name of the DB parameter group"
  value       = aws_db_instance.postgres.parameter_group_name
}

output "db_resource_id" {
  description = "The unique RDS resource ID"
  value       = aws_db_instance.postgres.resource_id
}

output "db_hosted_zone_id" {
  description = "The canonical hosted zone ID (useful for Route 53)"
  value       = aws_db_instance.postgres.hosted_zone_id
}