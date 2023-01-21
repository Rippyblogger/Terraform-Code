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
  instance_type = "t2.micro"
  subnet_id = "subnet-0031bbd25cbb12a82"

  tags = {
    Name = "HelloWorld"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.test_instance.public_ip} > ips.txt"
  }

}


output "public_ip" {
  value = aws_instance.test_instance.public_ip
}
