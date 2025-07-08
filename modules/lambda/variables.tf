variable "function_name" {
  type        = string
  description = "Lambda function name"
}

variable "handler" {
  type        = string
  description = "Lambda handler"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime"
}

variable "environment_vars" {
  type        = map(string)
  description = "Environment variables for Lambda"
  default     = {}
}

variable "lambda_zip_path" {
  type        = string
  description = "Lambda runtime"
}

variable "aws_dynamodb_table_arn" {
  type        = string
  description = "dynamo-table arn"
}