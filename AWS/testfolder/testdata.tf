# Get Avaialability zone data

data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "region-name"
    values = [var.REGION]
  }
}

output "name" {
  value = data.aws_availability_zones.available.names
}
