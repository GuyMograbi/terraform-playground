
resource "aws_iam_role_policy" "lambda_policy" {
   name = "lambda_policy"
   role = "${aws_iam_role.lambda_role.id}"

   policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Action": [
                "logs:*"
            ],
            "Effect": "Allow",
            "Resource": "*"

        }
    ]
}
   EOF
}


resource "aws_iam_role" "lambda_role" {
  name = "lambda_assume_role"


# alternatively assume_role_policy = "${file("path/to/file")}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

locals {
    lambda_zip_location = "output/welcome.zip"
}

data "archive_file" "welcome" {
    type = "zip"
    source_file = "welcome.js"
    output_path = "${local.lambda_zip_location}"
}

resource "aws_lambda_function" "test_lambda" {
    filename = "${local.lambda_zip_location}"
    function_name = "welcome"
    role = aws_iam_role.lambda_role.arn
    handler = "welcome.hello"

    # This is used to identify changes in the code - which will trigger terraform to redeploy
    source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"

    runtime = "nodejs18.x"

    environment {
        variables = {
            "mograbious": "wonderful"
        }
    }
}


output "terraform_aws_role_output" {
    value = aws_iam_role.lambda_role.name
}