resource "aws_iam_role_policy" "s3_terraform_state" {
	name = "S3"
	role = "${aws_iam_role.role.name}"
	policy = "${data.aws_iam_policy_document.s3_terraform_state.json}"
}

data "aws_iam_policy_document" "s3_terraform_state" {
	statement {

		effect = "Allow"

		actions = [
			"s3:GetObject",
			"s3:GetObjectVersion",
			"s3:PutObject"
		]

		resources = [ "${var.s3_backend_state_object_arns}" ]
	}
}
