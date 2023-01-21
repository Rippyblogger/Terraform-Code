resource "aws_security_group" "instance_security_group" {
  name        = "allow_ssh"
  description = "Allows SSH connectivity"
  vpc_id      = element(data.aws_vpcs.my_vpcs.ids, 1)

  ingress {
    description = "SSH from anywhere"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


resource "aws_security_group" "allows_mysql" {
  name        = "allows_mysql"
  description = "Allows mysql connectivity"
  vpc_id      = element(data.aws_vpcs.my_vpcs.ids, 1)

  ingress {
    description = "rds connection anywhere"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.instance_security_group.id] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_rds"
  }
}
