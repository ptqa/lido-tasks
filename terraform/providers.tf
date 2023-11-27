provider "github" {
  owner = "lidofinance"
  token = var.github_token
}

terraform {
  required_providers {
    github = {
      version = "~> 1.0.0"
      source  = "terraform-example.com/exampleprovider/example"
    }
  }
}
