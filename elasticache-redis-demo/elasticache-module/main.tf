# https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html

resource "aws_elasticache_cluster" "redis_instance" {
  cluster_id           = "${var.cluster_name}-redis"
  engine               = "redis"
  node_type            = "cache.t4g.micro" # https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html
  num_cache_nodes      = 1
#   https://us-east-1.console.aws.amazon.com/elasticache/home?region=us-east-1#/parameter-groups
# https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.Redis.html
  parameter_group_name = "default.redis7" 
  engine_version       = "7.0"
  port                 = 6379
}