variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_account_id" {
  type    = string
  default = "222634361832"
  validation {
    condition     = length(var.aws_account_id) == 12 && can(regex("^\\d{12}$", var.aws_account_id))
    error_message = "Invalid AWS account ID"
  }
}

variable "vpc_name" {
  type    = string
  default = "sonarqube"
}

variable "vpc_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-0a34f18368f434465"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}