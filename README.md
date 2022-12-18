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

# Things I Learned

## Documentation

Everything I need to know is in the [hashicorp registery](https://registry.terraform.io/)

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
2. https://aws.amazon.com/blogs/database/managing-amazon-elasticache-with-terraform/ 
3. https://www.youtube.com/watch?v=Lkm3v7UDlD8
4. https://awspolicygen.s3.amazonaws.com/policygen.html
5. https://registry.terraform.io/providers/hashicorp/aws/2.34.0/docs/guides/serverless-with-aws-lambda-and-api-gateway