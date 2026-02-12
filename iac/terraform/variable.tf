variable "vpc_id" {
  description = "VPC ID to create resources in"
  type        = string
}


variable "key_name" {
  description = "Name of the AWS key pair for EC2 instances"
  type        = string
}
