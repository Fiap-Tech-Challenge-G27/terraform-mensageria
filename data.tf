data "terraform_remote_state" "api-gateway" {
  backend = "s3"
  config = {
    bucket = "techchallengestate-g27"
    key    = "terraform-apigateway/terraform.tfstate"
    region = var.aws-region
  }
}
