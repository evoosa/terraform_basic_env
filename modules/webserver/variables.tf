variable "env" {
  description = "environment name"
  type        = string
}

variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "key_name" {
  description = "key pair name"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type        = list(string)
}
