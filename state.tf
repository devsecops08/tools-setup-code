terraform {
  backend "s3" {
    bucket = "terraform-secops09"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}