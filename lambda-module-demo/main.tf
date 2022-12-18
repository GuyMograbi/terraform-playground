module "my_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "echo_event"
  description   = "returns event"
  handler       = "main.handler"
  runtime       = "nodejs18.x"

  source_path = "./src"

  tags = {
    Name = "my-lambda1"
  }
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}