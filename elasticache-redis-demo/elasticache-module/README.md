# Performance

It takes ~7 minutes to get Redis ready

# Running redis locally

can be done with docker by running 


```
sudo docker run -p 6379:6379 -d redis
```

# Userful Redis Commands

```
set foo bar 
=> OK

get foo
=> bar
```


# Resources

1. https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d
1. https://stackoverflow.com/questions/27759026/connect-to-elasticache-cluster-from-aws-lambda-function
1. Network Definitions - https://docs.amazonaws.cn/en_us/vpc/latest/userguide/what-is-amazon-vpc.html`
1. Connect Lambda with Redis - https://docs.aws.amazon.com/lambda/latest/dg/configuration-database.html



https://www.alexdebrie.com/posts/aws-lambda-vpc/
>When building an application with AWS Lambda, you may need to host your Lambda function in a VPC. The most common reason for this is because your Lambda function will use other resources which aren’t accessible from the public internet, such as a relational database or **Redis instance.**   
>...   
> There are two types of VPC endpoints: interface endpoints and gateway endpoints. Gateway endpoints are simply a route in your subnet’s route table that directs traffic directly to the given service. Gateway endpoints are great because they don’t cost you anything to run. Unfortunately, gateway endpoints are only supported for Amazon S3 and DynamoDB. If you want other services, you’re out of luck.

