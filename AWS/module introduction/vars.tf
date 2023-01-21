variable "ACCESS_KEY" {
  type = string
}

variable "SECRET_KEY" {
  type = string
}

variable "PUBLIC_KEY_PATH" {
  type = string
}

variable "PRIVATE_KEY_PATH" {
  type = string
}

variable "REGION" {
  type = string
}

variable "vpc_block" {
  type = string
}

variable "subnets" {
  type = map(any)
}

variable "subnet_names" {
  type    = list(any)
  default = ["0", "1", "2"]
}