# Storing parameters in AWS SSM PARAMETER STORE 

resource "aws_ssm_parameter" "project_name" {
  type  = "String"
  name  = "/project_name/${var.project_name}"
  value = var.project_name
  overwrite = true
}

resource "aws_ssm_parameter" "region" {
  type  = "String"
  name  = "/${var.project_name}/region/${var.region}"
  value = var.region
  overwrite = true
}

resource "aws_ssm_parameter" "env" {
  type  = "String"
  name  = "/${var.project_name}/env/${var.env}"
  value = var.env
  overwrite = true
}

resource "aws_ssm_parameter" "tfstate_bucket" {
  type  = "String"
  name  = "/tfstate_bucket/${var.s3_bucket_name}"
  value = aws_s3_bucket.tfstate_bucket.id
  overwrite = true
}
