variable "github_repo" {
  type        = string
  default     = "kbot"
  description = "repo with code on which flux watching"
}

variable "github_token" {
  type        = string
  default     = ""
  description = "The token used to authenticate with the Git repository"
}

variable "github_owner" {
  type        = string
  default     = ""
  description = "Repo owner"
}