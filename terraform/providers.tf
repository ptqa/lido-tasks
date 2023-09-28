provider "github" {
  owner = "ptqa"
  token = var.github_token
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}
