terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.65.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "webserver" {
  source = "../../modules/webserver"
  env = ""
  ec2_instance_type = "t2.nano"
  ec2_key_name = "test_key_pair"
  ec2_subnet_id = "subnet-a29bd2cb"
  vpc_security_group_ids = [
    "sg-00f3022df199eb747"]
  ec2_ami_id = "ami-0fc15d50d39e4503c"
}