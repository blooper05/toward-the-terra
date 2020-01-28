resource "aws_iam_account_alias" "alias" {
  account_alias = "blooper"
}

resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_iam_access_key" "terraform" {
  user    = aws_iam_user.terraform.name
  pgp_key = filebase64("./files/gpg.public.key")
}

resource "aws_iam_user_policy_attachment" "terraform" {
  user       = aws_iam_user.terraform.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "aws_iam_access_key-terraform-id" {
  value     = aws_iam_access_key.terraform.id
  sensitive = true
}

output "aws_iam_access_key-terraform-encrypted_secret" {
  value     = aws_iam_access_key.terraform.encrypted_secret
  sensitive = true
}
