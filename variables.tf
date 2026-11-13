variable "region" {
  description = "AWS deployment region."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short prefix for resource names; use a unique value for each deployment."
  type        = string
  default     = "webapp"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,14}$", var.project_name))
    error_message = "project_name must start with a lowercase letter and contain at most 15 lowercase letters, digits, or hyphens."
  }
}

variable "environment" {
  description = "Environment tag."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Two public subnet CIDRs, in distinct Availability Zones."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

  validation {
    condition     = length(var.public_subnets) == 2
    error_message = "Exactly two public subnet CIDRs are required."
  }
}

variable "private_app_subnets" {
  description = "Two private application subnet CIDRs."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]

  validation {
    condition     = length(var.private_app_subnets) == 2
    error_message = "Exactly two private application subnet CIDRs are required."
  }
}

variable "private_db_subnets" {
  description = "Two isolated database subnet CIDRs."
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]

  validation {
    condition     = length(var.private_db_subnets) == 2
    error_message = "Exactly two private database subnet CIDRs are required."
  }
}

variable "instance_type" {
  description = "EC2 web instance type (x86_64 for the AL2023 AMI below)."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS MySQL 8.4 instance class."
  type        = string
  default     = "db.t4g.micro"
}

variable "db_username" {
  description = "RDS master username; RDS generates and manages the password."
  type        = string
  default     = "appadmin"
}

variable "certificate_arn" {
  description = "Optional issued ACM certificate ARN in this region. When set, enable HTTPS and redirect HTTP."
  type        = string
  default     = null
  nullable    = true
}
