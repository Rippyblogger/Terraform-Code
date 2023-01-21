resource "aws_ebs_volume" "example" {
  availability_zone = var.public_subnets.public_subnet_1["az_name"]
  size              = 2
  type = "standard"

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.hello_yiu.id
}

