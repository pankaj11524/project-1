resource "aws_instance" "web-application-server" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.instance_count
  key_name = var.key_name
  tags = {
    Name = "${var.additional_tags.Name}-${count.index + 1}"
    Environment = var.additional_tags.Environment
    Project = var.additional_tags.Project
    TechTeam = var.additional_tags.TechTeam
      }
  volume_tags = {
    Name = var.additional_tags.Environment
  }
  subnet_id = var.subnet_id
  #vpc_security_group_ids = var.vpc_security_group_ids      #List of associated security groups of instances, if running in non-default VPC
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination = var.disable_api_termination
  monitoring = true
  security_groups = var.security_groups
#  cpu_core_count = var.cpu_core_count #If you want to configure cpu count
#  cpu_threads_per_core = var.cpu_threads_per_core ##If you want to configure cpu treads per core
  user_data = var.user_data
  root_block_device {
    delete_on_termination = true
    encrypted = false
    iops = 100
    kms_key_id = "" #(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
  }
}
#below resources values to be declared in variable files
resource "aws_ebs_volume" "dev-volume" {
  availability_zone = aws_instance.web-application-server[count.index].availability_zone
  count = 1
  #count = var.instance_count #If want to create volume for all instances
  size = var.volume_size
  tags = {
    Name = "dev-volume"
  }
  }
resource "aws_volume_attachment" "dev-volume-attachment" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.web-application-server[count.index].id
  volume_id = aws_ebs_volume.dev-volume[count.index].id
  count = 1
}
