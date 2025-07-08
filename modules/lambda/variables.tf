variable "handler" {
  type        = string
  description = "Lambda handler"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime"
}

variable "lambda_zip_path" {
  type        = string
  description = "Lambda runtime"
}

variable "lambda_function_name" {
  type        = string
  description = "lambda function name"
}

variable "email_recipient" {}

variable "dynamodb_table_arn" {}

variable "dynamodb_table_name" {}

# variable "environment_vars" {
#   type        = map(string)
#   description = "Environment variables for Lambda"
#   default     = {}
# }