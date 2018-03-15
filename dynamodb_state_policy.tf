resource "aws_iam_role_policy" "dynamodb_terraform_state" {
	name = "DynamoDB"
	role = "${aws_iam_role.role.name}"
	policy = "${data.aws_iam_policy_document.dynamodb_terraform_state.json}"
}

data "aws_iam_policy_document" "dynamodb_terraform_state" {
	statement {

		effect = "Allow"

		actions = [
			"dynamodb:DeleteItem",
			"dynamodb:GetItem",
			"dynamodb:PutItem",
			"dynamodb:Query",
			"dynamodb:UpdateItem"
		]

		resources = [ "${var.dynamodb_backend_state_table_arns}" ]
	}
}
