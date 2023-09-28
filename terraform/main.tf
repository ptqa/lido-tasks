resource "github_repository" "lido" {
  name          = "lido-tasks"
  visibility    = "public"
  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true
}

resource "github_branch_protection_v3" "main" {
  repository = github_repository.lido.name
  branch     = "main"

  restrictions {
    users = ["ptqa"]
  }
}
