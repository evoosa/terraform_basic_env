variable "env" {
  description = "environment name"
  type        = string
}

variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "ec2_key_name" {
  description = "key pair name"
  type        = string
}

variable "ec2_subnet_id" {
  description = "subnet id"
  type        = string
}

variable "ec2_ami_id" {
  description = "subnet id"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type        = list(string)
}
