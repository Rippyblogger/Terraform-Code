variable "ACCESS_KEY" {
  type = string
}

variable "SECRET_KEY" {
  type = string
}

variable "REGION" {
  type = string
}

variable "subnets" {
  type = map(any)
}

variable "subnet_names" {
  type    = list(any)
  default = ["0", "1", "2"]
}