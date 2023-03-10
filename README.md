# Important Notes

Change the name of the bucket. Buckets are globally unique.

# Preconditions

1. Install awscli
2. Configure aws (`aws configure`)

## Commands Used

```
aws configure
aws plan -out s3plan
aws apply s3plan

## Change made

aws plan -out s3plan
aws apply s3plan

## End Demo
terraform destroy

```

**Run Lambda function from cli**
```
aws lambda invoke --region=eu-west-1 --function-name=welcome output.txt --profile=tf-demo
```

# Things I Learned

## Documentation

### The Hashicorp Regsitry 

Everything I need to know is in the [hashicorp registery](https://registry.terraform.io/)   
The registry also includes reusable modules (that take care of multiple things) 

For example, the aws-lambda-module - automatically picks up on package.json changes and installs the desired dependencies.   
There is no need to persist node_modules

### Documentation is not at latest standard

If you follow the documentation, you will get warnings and deprecation notices. 
I can only assume this means terraform is rapidly changing and all the plugins and their documentation cannot always keep up

For example - one huge different is between quoted references. You should not use `"${module.some_module.some_resource}"` syntax, but instead simply 
refer to the resource `module.some_module.some_resource`. The latter also supports autocomplete better.

## Persisting State

1. DO NOT manage the statefile yourself. (For example: DO NOT keep the statefile in git)
2. DO let terraform manage the statefile (using `backend` resource [link](https://developer.hashicorp.com/terraform/language/settings/backends/configuration))

## Structure

```
resource "[TYPE]" "[NAME]" {
    [ATTRIBUTE] = "[VALUE]"
}
```


```
variable "[variable name]" {
    default     = "[optional]"
    description = "[optional]"
    type        = "string|int|list|map"
}
```

```
data "[TYPE]" "[NAME]" {}
```


**variables values**
Terraform loads all files that match terraform.tfvars or *.auto.tfvars present in the current directory.

The format of this is simply

```
[key] = [value]
```

# Resources

1. https://medium.com/mlearning-ai/terraform-to-provision-aws-resource-s3-bucket-beginner-level-5dde3a8afdc4
1. https://aws.amazon.com/blogs/database/managing-amazon-elasticache-with-terraform/ 
1. https://www.youtube.com/watch?v=Lkm3v7UDlD8
1. https://awspolicygen.s3.amazonaws.com/policygen.html
1. https://registry.terraform.io/providers/hashicorp/aws/2.34.0/docs/guides/serverless-with-aws-lambda-and-api-gateway
1. **Lambda Module**
    1. https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest
    1. https://www.youtube.com/watch?v=mUO5k_B5bJ4
    1. https://registry.terraform.io/providers/hashicorp/aws/2.34.0/docs/guides/serverless-with-aws-lambda-and-api-gateway
    1. Add Redis - https://github.com/udaysharma/terraform-aws-redis-lambda