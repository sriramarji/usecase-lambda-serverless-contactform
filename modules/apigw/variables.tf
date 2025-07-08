variable "api_name" {
  description = "api-name"
  type        = string
}

variable "integration_uri_arn" {
  description = "lambda_integration_URI"
  type        = string
}

variable "lambda_function_name" {
  description = "Name to be used on lambda name"
  type        = string
}

variable "aws_apigatewayv2_arn" {
  description = "apigatewayv2_arn"
  type        = string
}