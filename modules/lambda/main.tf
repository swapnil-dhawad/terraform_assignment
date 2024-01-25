resource "aws_lambda_function" "weather_lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  environment {
    variables = {
      foo = "bar"
    }
  }

  depends_on = [aws_iam_role.lambda_execution_role]
}

resource "aws_iam_role" "lambda_execution_role" {

  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" # Basic Lambda execution policy

  role = aws_iam_role.lambda_execution_role.name
}

