provider "aws" {
  version = "= 2.61.0"

  profile = "blooper"
  region  = "ap-northeast-1"
}

provider "aws" {
  alias = "global"

  profile = "blooper"
  region  = "us-east-1"
}
