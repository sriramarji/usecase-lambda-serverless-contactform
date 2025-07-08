resource "aws_iam_role" "lambda_exec" {
  name = "${var.function_name}-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


resource "aws_iam_policy" "dynamodb_policy" {
  name = "contact-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["dynamodb:PutItem"],
        Effect = "Allow",
        Resource = var.aws_dynamodb_table_arn
      },
      {
        Action = ["ses:SendEmail"],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_lambda_function" "contact_handler" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.lambda_zip_path
  timeout       = 10
  environment {
    variables = var.environment_vars
  }
}

resource "aws_lambda_permission" "apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.contact_handler.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.aws_apigatewayv2_arn
}