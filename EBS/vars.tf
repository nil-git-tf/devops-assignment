variable "elasticapp" {
  default = "swapnil-app"
}
variable "beanstalkappenv" {
  default = "swapnil-env"
}
variable "solution_stack_name" {
  type = string
}
variable "tier" {
  type = string
}
 
variable "vpc_id" {}
variable "subnets" {}
#variable "elb_public_subnets" {}
variable "alb_cidr_block" {}