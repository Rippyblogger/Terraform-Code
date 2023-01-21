variable "REGION" {
    type = string
}

variable "SECRET_KEY" {
  type = string
}

variable "ACCESS_KEY" {
  type = string
}

variable "public_subnets" {
  type = map
}

variable "private_subnets" {
  type = map
}