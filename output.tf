output "ins_id" {
  description = "ins of ID"
  value       = resource.aws_instance.welcome.id
}
output "sg_id" {
  description = "security of ID"
  value       = module.security-group.security_group_id
}
