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

resource "aws_iam_role_policy" "glue_policy" {
	name = "GlueReadOnly"
	role = "${aws_iam_role.role.name}"
	policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "glue:GetConnections",
        "glue:GetCrawler",
        "glue:GetCrawlers",
        "glue:GetDataCatalogEncryptionSettings",
        "glue:GetClassifiers",
        "glue:GetTableVersions",
        "glue:GetPartitions",
        "glue:GetDevEndpoint",
        "glue:GetSecurityConfiguration",
        "glue:GetCatalogImportStatus",
        "glue:GetResourcePolicy",
        "glue:GetConnection",
        "glue:GetTrigger",
        "glue:GetUserDefinedFunction",
        "glue:GetJobRun",
        "glue:GetUserDefinedFunctions",
        "glue:GetClassifier",
        "glue:GetJobs",
        "glue:GetTables",
        "glue:GetTriggers",
        "glue:BatchGetPartition",
        "glue:GetSecurityConfigurations",
        "glue:GetDatabases",
        "glue:GetTable",
        "glue:GetDatabase",
        "glue:GetPartition",
        "glue:GetDevEndpoints",
        "glue:GetDataflowGraph",
        "glue:GetPlan",
        "glue:GetCrawlerMetrics",
        "glue:GetJob",
        "glue:GetJobRuns"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
