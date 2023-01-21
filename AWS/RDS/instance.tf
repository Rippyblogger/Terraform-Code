data "aws_subnets" "aws_subnets" {
  filter {
    name   = "vpc-id"
    values = [element(data.aws_vpcs.my_vpcs.ids, 1)]
  }
}

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

resource "aws_instance" "test_vm" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = element(data.aws_subnets.aws_subnets.ids, 1)
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_keys.key_name
  security_groups = [aws_security_group.instance_security_group.id]
  instance_type = "t3.micro"
}


