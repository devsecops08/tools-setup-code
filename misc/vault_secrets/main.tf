terraform {
  backend "s3" {
    bucket = "terraform-dsecops81"
    key    = "vault_secrets/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "vault" {
  address         = "http://vault-internal.adevsecops08.online:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}
  
