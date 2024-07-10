resource "aws_sns_topic" "checkout-topic" {
  name = "checkout-topic"
}

resource "aws_sns_topic_subscription" "checkout-subscription" {
  topic_arn = aws_sns_topic.checkout-topic.arn
  protocol  = "https"
  endpoint  = ""
}