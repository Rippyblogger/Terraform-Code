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

resource "aws_instance" "hello_yiu" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.allow_traffic.id]
  key_name = aws_key_pair.mykeypair.key_name

  tags = {
    Name = "Hello_you"
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "my_key_pair"
  public_key = file(var.public_key_path)
}



resource "aws_security_group" "allow_traffic" {
  name        = "allow_traffic"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_Ssh"
  }
}
