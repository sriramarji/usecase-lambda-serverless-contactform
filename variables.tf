variable "my_function_name" {
    description = ""
    type = string
    default = "demo-lambda"
}

variable "my_handler" {
    description = ""
    type = string
    default = "lambda_function.lambda_handler"
}

variable "my_runtime" {
    description = ""
    type = string
    default = "python3.9"
}

variable "email_recipient" {
  description = "Email to receive contact form submissions"
  type        = string
  default     = "bhaskarsaisri.arji@hcltech.com"
}

variable "table_name" {
  type        = string
  description = "Name of the DynamoDB table"
  default = "contact-form-lambda-apigw"
}

# variable "my_lambda_zip_path" {
#     description = ""
#     type = string
# }