resource "aws_cloudwatch_event_rule" "weather_trigger" {
  name                = "weather_trigger_rule"
  schedule_expression = var.weather_trigger
}

resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule      = aws_cloudwatch_event_rule.weather_trigger.name
  target_id = "invoke_lambda"

  arn = module.lambda.lambda_function_arn
}