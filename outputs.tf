output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}

output "instance_name" {
  description = "EC2 Name"
  value       = "web-${random_string.name_suffix.result}"
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "random_port" {
  description = "Randomly generated port"
  value       = random_integer.random_port.result
}

output "unique_id" {
  description = "Unique random ID"
  value       = random_id.unique_id.hex
}
