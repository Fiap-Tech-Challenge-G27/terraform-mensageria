resource "aws_sns_topic" "checkout-topic" {
  name = "checkout-topic"
}

resource "aws_sns_topic" "payment-status-topic" {
  name = "payment-status-topic"
}

resource "aws_sns_topic_subscription" "payment-status-customer-subscription" {
  topic_arn = aws_sns_topic.payment-status-topic.arn
  protocol  = "https"
  endpoint  = "https://i8z10k6wma.execute-api.us-east-1.amazonaws.com/lanchonete/customers/notification"
}

resource "aws_sns_topic_subscription" "payment-status-production-subscription" {
  topic_arn = aws_sns_topic.payment-status-topic.arn
  protocol  = "https"
  endpoint  = "https://i8z10k6wma.execute-api.us-east-1.amazonaws.com/lanchonete/orders/payment-confirmation"
}

resource "aws_sns_topic_subscription" "checkout-subscription" {
  topic_arn = aws_sns_topic.checkout-topic.arn
  protocol  = "https"
  endpoint  = "https://i8z10k6wma.execute-api.us-east-1.amazonaws.com/lanchonete/payment/initiate"
}
