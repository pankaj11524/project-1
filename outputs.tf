#We can print multiple instance info using below because count attribute is a list:
output "instance_info" {
  value = aws_instance.web-application-server[*]
  #value = aws_instance.web-application-server[*].public_ip  #To print public IP of all hosts
  }
output "ebs_volume" {
  value = aws_ebs_volume.dev-volume
}