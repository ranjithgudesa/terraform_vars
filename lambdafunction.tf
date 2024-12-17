data "aws_subnets" "subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [var.vpcID]
  }
}

resource "aws_lambda_function" "test_function" {
  function_name = var.function_name[0]
  #role          = join("", ["arn:aws:iam::", var.AccountID, ":role/", var.role_name[1]])
  #role = "arn:aws:iam::${var.AccountID}:role/${var.role_name[0]}"
  role = aws_iam_role.test_role.arn

  handler = "app.lambda_handler"
  #runtime = var.runtime
  runtime = var.runtime[1]
  timeout = 300
  # deploymet package should be in s3 bucket
  s3_bucket = var.s3bucket_name
  s3_key    = var.s3_key
  ephemeral_storage {
    size = 10240
  }
  memory_size = 10240
  environment {
    variables = {
      environment = terraform.workspace
    }
  }
  vpc_config {
    #subnet_ids         = [var.subnetID[0]]
    subnet_ids         = var.subnetID
    security_group_ids = var.security_group
  }
  tags = {
    Environment       = terraform.workspace == "default" ? "dev" : terraform.workspace
    workspace         = terraform.workspace
  }
}

resource "aws_lambda_permission" "event_rule" {
  statement_id  = "AllowExecutionFromEventRule"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:eu-west-1:<accountID>:rule/<event_rule_name>"
}

