resource "aws_cloudwatch_event_rule" "terraform_test" {
    name = "terraform-test"
    description = "Fires every ten minutes"
    schedule_expression = "rate(10 minutes)"
    state = "ENABLED"
    tags = {
        "Name" = "terraform-test"
    }
  
}
