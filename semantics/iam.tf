resource "aws_iam_user" "myuser" {
    name = var.iam_user
    # path = "/system"
}