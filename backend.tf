terraform {
  backend "s3" {
    bucket         = "shashank-s3-demo-abc-1"
    key            = "terraform-simple/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}