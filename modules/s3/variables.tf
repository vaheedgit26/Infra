variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region to deploy backend (e.g., us-west-2)"
  type        = string
  default     = "ap-south-1"
}
