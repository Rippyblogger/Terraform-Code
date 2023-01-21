variable "instance_name" {
  type=string
  default="testvm"
}

variable "ACCESS_KEY" {
  type=string
}

variable "SECRET_KEY" {
  type=string
}

variable "PUBLIC_KEY_PATH" {
  type=string
}

variable "PRIVATE_KEY_PATH" {
  type=string
}

variable "environment" {
  type=map(string)
}

variable "INSTANCE_USERNAME" {
  type = string
}