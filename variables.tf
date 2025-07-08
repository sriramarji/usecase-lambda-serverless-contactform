variable "my-function_name" {
    description = ""
    type = string
    default = "demo-lambda"
}

variable "my-handler" {
    description = ""
    type = string
    default = "lambda_function.lambda_handler"
}

variable "my-runtime" {
    description = ""
    type = string
    default = "python3.9"
}

variable "my-environment_variables" {
    description = ""
    type    = map(string)
    default = {}
}

variable "my-lambda_role_name" {
    description = ""
    type = string
    default = "lambda-role"
}

variable "my-lambda_zip_path" {
    description = ""
    type = string
    default = "./lambda/my-lambdafunction.zip"
}