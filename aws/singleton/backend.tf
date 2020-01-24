# terraform {
#   backend "s3" {
#     bucket         = "blooper-terraform-state"
#     key            = "terraform.singleton.tfstate"
#     dynamodb_table = "terraform-state-lock"
#
#     profile = "blooper"
#     region  = "ap-northeast-1"
#   }
# }

resource "aws_s3_bucket" "terraform-state" {
  bucket = "blooper-terraform-state"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform-state" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  write_capacity = 1
  read_capacity  = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}
