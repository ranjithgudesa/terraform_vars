s3bucket_name = "my_bucket"
s3_key        = "lambda_code/lambdafunctiondeploymentcode.zip"
tags          = "test"
AccountID     = "<accountID>"
function_name = [
  "test_function_terraform",
"dev_function_terraform"]
role_name = [
  "test-url-function",
"dev-function-role"]
runtime        = ["python3.10", "java21", "nodejs18.x"]
subnetID       = ["<youraccount_subnet_ID>", "<youraccount_subnet_ID>"]
security_group = ["<security_group_ID>", "<security_group_ID>"]
vpcID          = "<your_account_vpcID>"
