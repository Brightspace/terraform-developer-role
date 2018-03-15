variable "role_name" {}
variable "role_description" {}

variable "assuming_principal_arns" {
	type = "list"
}

variable "dynamodb_backend_state_table_arns" {
	type = "list"
}

variable "s3_backend_state_object_arns" {
	type = "list"
}
