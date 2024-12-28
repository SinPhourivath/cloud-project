data "aws_kms_secrets" "creds"{
    secret {
        name = "db"
        payload = file("${path.module}/db-creds.yml.encrypted")
    }
}
locals {
  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["db"])
}

resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  db_name              = "todo_app_db"
  username             = local.db_creds.username
  password             = local.db_creds.password
  publicly_accessible  = true
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true

  tags = {
    Name = "TodoAppDB"
  }
}