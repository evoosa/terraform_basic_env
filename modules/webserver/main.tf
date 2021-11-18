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

//# Generate random password to the DB
//resource "random_password" "rds_password" {
//  length = 16
//  special = false
//}
//
//
//resource "aws_db_instance" "webserver_db" {
//  identifier = "${var.env}-db"
//
//  engine = "mysql"
//  engine_version = "5.6"
//  instance_class = "db.t2.micro"
//  allocated_storage = 5
//
//  name = "${var.env}-db"
//  username = "admin"
//  password = random_password.rds_password.result
//  port = "3306"
//
//  iam_database_authentication_enabled = true
//
//  vpc_security_group_ids = [
//    "sg-12345678"]
//
//  maintenance_window = "Mon:00:00-Mon:03:00"
//  backup_window = "03:00-06:00"
//
//  # Enhanced Monitoring - see example for details on how to create the role
//  # by yourself, in case you don't want to create it automatically
//  monitoring_interval = "30"
//  monitoring_role_name = "MyRDSMonitoringRole"
//  create_monitoring_role = true
//
//  tags = {
//    Owner = "user"
//    Environment = "dev"
//  }
//
//  # DB subnet group
//  subnet_ids = [
//    "subnet-12345678",
//    "subnet-87654321"]
//
//  # DB parameter group
//  family = "mysql5.7"
//
//  # DB option group
//  major_engine_version = "5.7"
//
//  # Database Deletion Protection
//  deletion_protection = true
//
//  parameters = [
//    {
//      name = "character_set_client"
//      value = "utf8mb4"
//    },
//    {
//      name = "character_set_server"
//      value = "utf8mb4"
//    }
//  ]
//
//  options = [
//    {
//      option_name = "MARIADB_AUDIT_PLUGIN"
//
//      option_settings = [
//        {
//          name = "SERVER_AUDIT_EVENTS"
//          value = "CONNECT"
//        },
//        {
//          name = "SERVER_AUDIT_FILE_ROTATIONS"
//          value = "37"
//        },
//      ]
//    },
//  ]
//}