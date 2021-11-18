resource "ec2_instance" "webserver_instance" {
  name = "${var.env}-webserver"

  ami                    = "ami-ebd02392"
  instance_type          = "${var.ec2_instance_type}"
  key_name               = "${var.key_name}"
  monitoring             = true
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  subnet_id              = module.subnet.webserver_subnet.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "${var.env}-webserver"
  }
}

resource "vpc" "ppp" {
  ni = 'ni'
}