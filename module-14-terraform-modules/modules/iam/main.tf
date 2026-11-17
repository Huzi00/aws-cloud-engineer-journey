# 1. Trust Policy allowing EC2 service to assume this role
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# 2. IAM Role for EC2 Instances
resource "aws_iam_role" "ec2_role" {
  name               = "${var.environment}-${var.role_name_prefix}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name        = "${var.environment}-${var.role_name_prefix}-role"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 3. Attach AWS Managed Policy for Keyless SSM Session Manager Access
resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 4. Custom Least-Privilege Policy (Read-Only access to a specific S3 bucket)
data "aws_iam_policy_document" "s3_read_only" {
  statement {
    sid    = "AllowScopedS3ReadAccess"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      var.allowed_s3_bucket_arn,
      "${var.allowed_s3_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.environment}-${var.role_name_prefix}-s3-read"
  description = "Least-privilege read-only access to application assets bucket"
  policy      = data.aws_iam_policy_document.s3_read_only.json
}

resource "aws_iam_role_policy_attachment" "attach_s3_read" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

# 5. EC2 Instance Profile (Container passed to Launch Template)
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.environment}-${var.role_name_prefix}-profile"
  role = aws_iam_role.ec2_role.name

  tags = {
    Name        = "${var.environment}-${var.role_name_prefix}-profile"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
