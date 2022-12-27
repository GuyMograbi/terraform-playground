provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "my_redis" {
    source = "./elasticache-module"
    cluster_name = "guy-demo"
}

output "redis_endpoint" {
  value = module.my_redis.redis_host
}

output "redis_port" {
  value = module.my_redis.redis_port
}