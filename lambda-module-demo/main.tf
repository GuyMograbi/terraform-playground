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
  environment_variables = {
    "REDIS_HOST" = "guy-demo-redis.3lslfi.0001.euw1.cache.amazonaws.com"
    "REDIS_PORT" = "6379"
    "REDIS_DEMO" = "true"
  }

  # must define both to work
  vpc_subnet_ids = ["subnet-48d59412", "subnet-e2baadaa", "subnet-e3000785"] # Manually copied from redis temporarily
  vpc_security_group_ids = [ "sg-5b070e1d" ] # default SG
  attach_network_policy = true # gives lambda permission EC2:CreateNetworkInterface
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

output "base_url" {
  value = "${aws_api_gateway_deployment.example.invoke_url}"
}