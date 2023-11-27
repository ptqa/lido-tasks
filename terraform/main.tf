#resource "github_repository" "lido" {
#  name          = "infra-tf-github-test"
#  visibility    = "private"
#  has_downloads = true
#  has_issues    = true
#  has_projects  = true
#  has_wiki      = true
#}

data "github_repository" "lido" {
  full_name = "lidofinance/infra-tf-github-test"
}

resource "github_branch_protection_v3" "main" {
  repository                      = data.github_repository.lido.name
  branch                          = "main"
  enforce_admins                  = false
  require_conversation_resolution = true
  required_status_checks {
    strict = true
  }
  required_pull_request_reviews {
    dismiss_stale_reviews           = false
    required_approving_review_count = 1
    require_code_owner_reviews      = false
    require_last_push_approval      = true
  }
  restrictions {
    users = ["ptqa"]
  }
}

#resource "github_branch_protection" "main" {
#  repository_id    = data.github_repository.lido.node_id
#  pattern          = "main"
#  enforce_admins   = true
#  blocks_creations = false
#  required_status_checks {
#    strict = true
#  }
#  push_restrictions = [
#    "/br3d",
#  ]
#
#}

output "lido_id" {
  value = data.github_repository.lido.repo_id
}
