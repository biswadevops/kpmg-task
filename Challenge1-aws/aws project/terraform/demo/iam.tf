## IAM role for Lifecycle ##

resource "aws_iam_role" "dlm_lifecycle_role" {
  name                 = "dlm-lifecycle-role"
  permissions_boundary = var.permission_boundary

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dlm_lifecycle" {
  name = "dlm-lifecycle-policy"
  role = aws_iam_role.dlm_lifecycle_role.id

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      },
              {
            "Effect": "Allow",
            "Action": [
                "events:PutRule",
                "events:DeleteRule",
                "events:DescribeRule",
                "events:EnableRule",
                "events:DisableRule",
                "events:ListTargetsByRule",
                "events:PutTargets",
                "events:RemoveTargets"
            ],
            "Resource": "arn:aws:events:*:*:rule/AwsDataLifecycleRule.managed-cwe.*"
        }
   ]
}
EOF
}

## IAM role for Storage Gateway for File Share ##

resource "aws_iam_role" "fgw" {
  name                 = "storage-gateway-role"
  assume_role_policy   = data.aws_iam_policy_document.service_role.json
  permissions_boundary = var.permission_boundary
}

resource "aws_iam_policy" "fgw_policy" {
  policy = data.aws_iam_policy_document.bucket_access.json
}

resource "aws_iam_role_policy_attachment" "fgw_attachment" {
  role       = aws_iam_role.fgw.name
  policy_arn = aws_iam_policy.fgw_policy.arn
}

data "aws_iam_policy_document" "service_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["storagegateway.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "bucket_access" {
  statement {
    sid    = "AllowStorageGatewayBucketTopLevelAccess"
    effect = "Allow"
    resources = [
      data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-shared-folders")].arn,
      data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-manifests")].arn
    ]
    actions = [
      "s3:GetAccelerateConfiguration",
      "s3:GetBucketLocation",
      "s3:GetBucketVersioning",
      "s3:ListBucket",
      "s3:ListBucketVersions",
      "s3:ListBucketMultipartUploads"
    ]
  }

  statement {
    sid    = "AllowStorageGatewayBucketObjectLevelAccess"
    effect = "Allow"
    resources = [
      data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-shared-folders")].arn,
      data.aws_s3_bucket.s3_all_buckets[format("%s-%s", var.account_id, "sectra-manifests")].arn
    ]
    actions = [
      "s3:AbortMultipartUpload",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectVersion",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
  }
}
