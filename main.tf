module "lambda" {
  source                = "./modules/lambda"

  function_name  =  var.my-function_name
  handler =  var.my-handler
  runtime =  var.my-runtime
  environment_vars = var.my-environment_variables
  #aws_apigatewayv2_arn = var.my-lambda_role_name
  lambda_zip_path = var.my-lambda_zip_path

}