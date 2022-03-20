variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "your vpc id"
  default = "vpc-05c6ee9d5235528e7"
}

variable "subnet_id" {
  description = "your subnet id"
  default = "subnet-082589fc138622a34"
}

variable "cidr_block" {
  description = "CIDR Block to allow Jenkins Access"
  default = "0.0.0.0/0"
}

variable "my_cidr_block" {
  description = "CIDR Block to allow Jenkins Access"
  default = "176.63.13.239/32"
}

variable "key_name" {
  description = "Name of keypair to ssh"
  default = "demo"
}