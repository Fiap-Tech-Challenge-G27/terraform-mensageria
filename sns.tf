resource "aws_sns_topic" "checkout-topic" {
  name = "checkout-topic"
}

resource "aws_sns_topic_subscription" "checkout-subscription" {
  topic_arn = aws_sns_topic.checkout-topic.arn
  protocol  = "http"
  endpoint  = "http://k8s-default-ingressb-97436f9206-1044475668.us-east-1.elb.amazonaws.com/payment"
}
