variable "env" {
  description = "This is the environment for my infrastructure"
  type = string
}


variable "bucket_name" {
  description = "This is the bucket name for my infra"
  type = string
}

variable "instance_count" {
  description = "This is the number of EC2 instances to create"
  type = number
}

variable "instance_type" {
  description = "This is the EC2 instance type"
  type = string
}

variable "ec2_ami_id" {
  description = "This is the AMI ID for the EC2 instance"
  type = string
}

variable "hash_key" {
  description = "This is the hash key for the DynamoDB table"
  type = string
}