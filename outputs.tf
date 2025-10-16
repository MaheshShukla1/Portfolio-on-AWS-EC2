###########################################
# Output Section
###########################################

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_eip.ip.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "ssh_command" {
  description = "SSH command to connect to EC2"
  value       = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_eip.ip.public_ip}"
}
