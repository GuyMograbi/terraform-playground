output "redis_host" {
    description = "The host for Redis instance"
    value = aws_elasticache_cluster.redis_instance.cache_nodes[0].address
}

output "redis_port" {
    description = "The port for Redis instance"
    value = aws_elasticache_cluster.redis_instance.port
}