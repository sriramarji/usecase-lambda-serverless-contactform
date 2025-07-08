
resource "aws_api_gateway_rest_api" "contact_api" {
   name = var.api_name
   description = "API for contact form"
}


resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.http_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.integration_uri_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

