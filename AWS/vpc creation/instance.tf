  data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  security_groups  = [aws_security_group.allow_traffic.id]

  tags = {
    Name = "HelloWorld"
  }

  depends_on = [
    aws_subnet.public_subnet_1
  ]
}


resource "aws_security_group" "allow_traffic" {
  name        = "allow_traffic"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description      = "Traffic from public internet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_traffic"
  }
}