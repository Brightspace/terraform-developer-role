resource "aws_iam_role" "role" {
	name = "${var.role_name}"
	description = "${var.role_description}"
	assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

data "aws_iam_policy_document" "assume_role_policy" {
	statement {

		effect = "Allow"

		actions = [
			"sts:AssumeRole"
		]

		principals {
			type = "AWS"
			identifiers = [ "${var.assuming_principal_arns}" ]
		}
	}
}

resource "aws_iam_role_policy_attachment" "read_only" {
	role = "${aws_iam_role.role.name}"
	policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
