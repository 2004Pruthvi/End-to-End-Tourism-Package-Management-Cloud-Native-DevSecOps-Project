variable "project_name" {
  description = "Project name used for AWS resource nameing"
  type        = string
  default     = "wild-tour"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the Wild Tour VPC"
  type        = string
  default     = "10.0.0.0/16"
}
