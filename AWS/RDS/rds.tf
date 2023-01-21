resource "aws_db_parameter_group" "default" {
  name   = "rds-mysql"
  family = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_subnet_group" "mysql_sb_group" {
  name       = "main"
  subnet_ids = [aws_subnet.private_subnet-1.id]

  tags = {
    Name = "MySQL DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.default.name
  skip_final_snapshot  = true
  vpc_security_group_ids  = [aws_security_group.allows_mysql.id]
  db_subnet_group_name = aws_db_subnet_group.mysql_sb_group.name
  multi_az = false
  storage_type            = "gp2"
  backup_retention_period = 1                                         
  availability_zone       = aws_subnet.private_subnet-1.availability_zone  
  
  tags = {
    Name = "mysql-instance"
  }
}