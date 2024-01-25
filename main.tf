
module "eventbridge" {
  source          = "./modules/event_bridge"
  weather_trigger = "cron(0 5 ? * MON-FRI *)" # Every weekday at 5am
}

module "lambda" {
  source        = "./modules/lambda"
  function_name = "weather_retrieve"
  trigger_rule  = module.eventbridge.rule_name
}

module "s3_landing" {
  source        = "./modules/s3_bucket"
  bucket_name   = "weather-landing-bucket"
  event_trigger = module.lambda.lambda_function_arn
}

module "s3_transformed" {
  source      = "./modules/s3_bucket"
  bucket_name = "weather-transformed-bucket"
  event_trigger = module.etl_lambda.lambda_function_arn
}

module "etl_lambda" {
  source        = "./modules/lambda"
  function_name = "weather_etl"
  trigger_rule  = module.s3_landing.lambda_function_arn
}