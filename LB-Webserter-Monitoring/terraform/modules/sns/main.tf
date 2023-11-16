resource "aws_sns_topic" "alertingnotes" {
  name = "alertingnotes"
}

resource "aws_sns_topic_subscription" "triggered_alarm" {
  topic_arn = aws_sns_topic.alertingnotes.arn
  protocol  = "email"
  endpoint  = var.email
}
