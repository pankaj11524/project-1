variable "ami" {
  type = string
  default = "ami-010aff33ed5991201"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  default = "aws-new"
}

variable "additional_tags" {
  description = "Additional resource tags"
    type = object({
    Name = string
    Environment = string
      Project   = string
      TechTeam = string
  })
}
variable "instance_count" {
  default = "1"
}
variable "subnet_id" {}
#variable "environment" {}
variable "vpc_security_group_ids" {
  description = "A List of security group IDs to associate"
  type = list(string)
  default = null
}
variable "associate_public_ip_address" {
  type = bool
  default = false
}
variable "disable_api_termination" {
  type = bool
  default = false
}
variable "security_groups" {
  type = list(string)
}
variable "cpu_core_count" {}
variable "cpu_threads_per_core" {}
variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default = null
  type = string
}
variable "volume_size" {
  type = number
}
/*
variable "private_ip" {
  default = {}
  type = map(string)
}
variable "iam_instance_profile" {
  type = string
  default = ""
}
*/
#Here Adding EBS volume variables
