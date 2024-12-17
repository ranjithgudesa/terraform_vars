variable "s3bucket_name" {
  type        = string
  description = "The s3 bucekt name."
}
variable "s3_key" {
  type        = string
  description = "The s3 key name."
}
variable "tags" {
  type        = string
  description = "The s3 bucekt name."
}
variable "AccountID" {
  type        = string
  description = "The Account ID"
}
variable "function_name" {
  type = list(string)
  #default = [ "test_function", "dev_function" ]
  description = "The function name."
}
variable "vpcID" {
  type = string
}
variable "subnetID" {
  type        = list(string)
  description = "The function subnet."
}
variable "security_group" {
  type        = list(string)
  description = "security group id"

}

variable "role_name" {
  type        = list(string)
  description = "The function role."
}

variable "runtime" {
  type        = list(string)
  description = "The function runtime."
}
