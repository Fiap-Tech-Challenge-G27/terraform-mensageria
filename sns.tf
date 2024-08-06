resource "aws_sns_topic" "checkout-topic" {
  name = "checkout-topic"
}

resource "aws_sns_topic" "payment-approved-topic" {
  name = "payment-approved-topic"
}

resource "aws_sns_topic_subscription" "payment-approved-customer-subscription" {
  topic_arn = aws_sns_topic.payment-approved-topic.arn
  protocol  = "http"
  endpoint  = "http://k8s-default-ingressb-97436f9206-648559237.us-east-1.elb.amazonaws.com/"
}

resource "aws_sns_topic_subscription" "payment-approved-production-subscription" {
  topic_arn = aws_sns_topic.payment-approved-topic.arn
  protocol  = "http"
  endpoint  = "http://k8s-default-ingressb-97436f9206-648559237.us-east-1.elb.amazonaws.com/orders/payment-confirmation"
}

resource "aws_sns_topic_subscription" "checkout-subscription" {
  topic_arn = aws_sns_topic.checkout-topic.arn
  protocol  = "http"
  endpoint  = "http://k8s-default-ingressb-97436f9206-648559237.us-east-1.elb.amazonaws.com/payment/initiate"
}
