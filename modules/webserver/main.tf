# Create EC2 instance
resource "aws_instance" "webserver_instance" {
  ami = "${var.ec2_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  key_name = "${var.ec2_key_name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  subnet_id = "${var.ec2_subnet_id}"
  monitoring = true

  tags = {
    Terraform = "true"
    Environment = "${var.env}"
    Name = "${var.env}-webserver"
  }
}

# Generate random password for the DB
resource "random_password" "rds_password" {
  length = 16
  special = false
}

# Create DB
resource "aws_db_instance" "webserver_db" {
  identifier = "${var.env}-db"

  engine = "mysql"
  engine_version = "5.6"
  instance_class = "db.t2.micro"
  allocated_storage = 5

  name = "${var.env}_db"
  username = "admin"
  password = random_password.rds_password.result
  port = "3306"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  publicly_accessible = true
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"
  skip_final_snapshot = true
  tags = {
    Name = "${var.env}-db"
    Environment = "${var.env}"
  }

  # Database Deletion Protection
  deletion_protection = false
}