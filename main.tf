data "archive_file" "test_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_application/lambda_function.py"
  output_path = "${path.module}/lambda_application/lambda_function.zip"
}

module "lambda" {
  source = "./modules/lambda"

  lambda_function_name = var.my_function_name
  email_recipient      = var.email_recipient
  handler              = var.my_handler
  runtime              = var.my_runtime
  lambda_zip_path      = data.archive_file.test_zip.output_path
  dynamodb_table_arn   = module.dynamodb.dynamodb_table_arn
  dynamodb_table_name  = module.dynamodb.dynamodb_table_name

}

module "apigw" {
  source = "./modules/apigw"

  api_name             = "http-api"
  integration_uri_arn  = module.lambda.lambda_function_arn
  lambda_function_name = module.lambda.lambda_function_name
  aws_apigatewayv2_arn = module.apigw.aws_apigatewayv2_arn
}

module "dynamodb" {
  source = "./modules/dynamodb"

  table_name = var.table_name
}


module "ses" {
  source = "./modules/ses"

  email_recipient = var.email_recipient
}