variable "lambda_function_name" {
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

variable "aws_apigatewayv2_arn" {
  type        = string
  description = "Lambda runtime"
}

variable "lambda_zip_path" {
  type        = string
  description = "Lambda runtime"
}