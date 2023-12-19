provider "github" {
  owner = var.github_owner
  token = var.github_token
}

resource "github_repository_deploy_key" "this" {
  title      = var.public_key_openssh_title
  repository = var.github_repo
  key        = var.public_key_openssh
  read_only  = false
}