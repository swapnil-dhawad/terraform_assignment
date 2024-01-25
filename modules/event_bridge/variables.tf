variable "weather_trigger" {
  description = "Cron expression for the weather trigger"
  type        = string
  default     = "cron(0 5 ? * MON-FRI *)"
}