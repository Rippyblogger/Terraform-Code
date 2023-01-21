variable "ACCESS_KEY" {
  type=string
}

variable "SECRET_KEY" {
  type=string
}

variable "PUBLIC_KEY_PATH" {
  type=string
}

variable "REGION" {
  type = string
}

variable "vpc_block" {
  type = string
}

variable "subnets"{
    type = map
}

variable "subnet_names" {
  type=list
  default = ["subnet1", "subnet2", "subnet1"]
}