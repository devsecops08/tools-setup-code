terraform {
  backend "s3" {
    bucket = "terraform-dsecops81"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}