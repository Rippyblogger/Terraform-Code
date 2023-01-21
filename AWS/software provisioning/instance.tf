# Instance SSH key pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file("${var.PUBLIC_KEY_PATH}")}"
#   tags = lookup(var.environment, "production")
}


#Grab ami id from data source
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

# Create instance

resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"

    connection {
    type = "ssh"
    host = coalesce(self.public_ip, self.private_ip)
    user = var.INSTANCE_USERNAME
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/script.sh",
        "sudo /tmp/script.sh"
    ]

    connection {
    type = "ssh"
    host = coalesce(self.public_ip, self.private_ip)
    user = var.INSTANCE_USERNAME
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }
  }
  

  tags = {
    Name = "HelloWorld"
  }
}

