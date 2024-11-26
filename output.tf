output "ins_id" {
  description = "ins of ID"
  value       = resource.aws_instance.my_ec2.id
}
output "sg_id" {
  description = "security of ID"
  value       = resource.aws_security_group.my-sg.id
}
