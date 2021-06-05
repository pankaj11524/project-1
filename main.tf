module "web-server-launch" {
  source = "../TerraformProject/modules/ec2"
  ami = "ami-010aff33ed5991201"
  #instance_type = "c4.xlarge" #If we are configuring cpu the type needs to increase
  instance_type = "t2.micro"
  instance_count = "1"
  #key_name = ""  #If you are adding any param here then value needs to define else left if. default value to be pick from variable.tf
  additional_tags = {
    Name = "Web-Host"
    Environment = "Dev"
    Project = "Banking"
    TechTeam = "Java-Development"
  }
  subnet_id = "subnet-37b5cc7b"
  #vpc_security_group_ids = ["sg-08426877d0959bf8c"]
  associate_public_ip_address = true
  disable_api_termination = false
  security_groups = ["sg-08426877d0959bf8c"]
  #cpu_core_count = "2"
  #cpu_threads_per_core = "1"
  cpu_core_count = ""
  cpu_threads_per_core = ""
  user_data = <<EOF
echo "This is the test string..."
yum install httpd
  EOF
  volume_size = 50  #This value means 50GiB
}
