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

# Resources

https://medium.com/mlearning-ai/terraform-to-provision-aws-resource-s3-bucket-beginner-level-5dde3a8afdc4