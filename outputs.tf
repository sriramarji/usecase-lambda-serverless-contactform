output "api_endpoint" {
  value = module.apigw.api_endpoint_url
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}
