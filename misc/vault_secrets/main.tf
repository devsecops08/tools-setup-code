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

resource "vault_mount" "roboshop-dev" {
  path        = "roboshop-dev"
  type        = "kv"
  options     = { version = "2" }
  description = "RoboShop Dev Secrets"
}


resource "vault_generic_secret" "catalogue" {
  path = "${vault_mount.roboshop-dev.path}/catalogue"

  data_json = <<EOT
{
 MONGO: "true"
"MONGO_URL" : "mongodb://mongodb-dev.adevsecops08.online:27017/catalogue"
   
}
EOT
}

resource "vault_generic_secret" "user" {
  path = "${vault_mount.roboshop-dev.path}/user"

  data_json = <<EOT
{
  "MONGO": "true",
  "MONGO_URL" : "mongodb://mongodb-dev.adevsecops08.online:27017/users",
  "REDIS_URL" : "redis://redis-dev.adevsecops08.online:6379"
}
EOT
}

resource "vault_generic_secret" "cart" {
  path = "${vault_mount.roboshop-dev.path}/cart"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.adevsecops08.online",
  "CATALOGUE_HOST" : "catalogue-dev.adevsecops08.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "shipping" {
  path = "${vault_mount.roboshop-dev.path}/shipping"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.adevsecops08.online",
  "CATALOGUE_HOST" : "catalogue-dev.adevsecops08.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "payment" {
  path = "${vault_mount.roboshop-dev.path}/payment"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.adevsecops08.online",
  "CATALOGUE_HOST" : "catalogue-dev.adevsecops08.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "mysql" {
  path = "${vault_mount.roboshop-dev.path}/mysql"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.adevsecops08.online",
  "CATALOGUE_HOST" : "catalogue-dev.adevsecops08.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "rabbitmq" {
  path = "${vault_mount.roboshop-dev.path}/rabbitmq"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.adevsecops08.online",
  "CATALOGUE_HOST" : "catalogue-dev.adevsecops08.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

