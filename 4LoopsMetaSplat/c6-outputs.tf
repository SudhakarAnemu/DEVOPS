# Terraform output values


# EC2 instance public ip
/*
output "instance_publicip" {
  description = "EC2 instance public ip"
  value       = aws_instance.myec2vm.public_dns
}
*/
# EC2 instance public DNS 
/*
output "instance_publicdns" {
  description = "EC2 instance public dns"
  value       = aws_instance.myec2vm.public_dns
}
*/
# Output - For loop with list
output "for_output_list" {
  description = "For loop with list"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

# Output - For loop with map
output "for_output_map1" {
  description = "For loop with Map"
  value       = { for instance in aws_instance.myec2vm : instance.id => instance.public_ip }
}

# Output - for loop with Map advanced

output "for_output_map2" {
  description = "For loop with Map - Advanced"
  value       = { for c, instance in aws_instance.myec2vm : c => instance.public_dns }
}

# Output legacey Splat operator (legacy) - retruns the list

output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value       = aws_instance.myec2vm.*.public_ip
}

#Output latest Generalized splat Operator - Retruns the list
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat operator"
  value       = aws_instance.myec2vm[*].public_dns
}