variable "repoName" {
  type = string
}

variable "ownerName" {
  type = string
}

variable "ciBranchPushPath" {
  type    = string
  default = "ci/branch/cloudbuild.yaml"
}

variable "ciTagPath" {
  type    = string
  default = "ci/release/cloudbuild.yaml"
}

variable "ciPullRequestPath" {
  type    = string
  default = "ci/feature/cloudbuild.yaml"
}

variable "ignoredFiles" {
  type = list(string)
  default = [
    "README.md",
    ".gitignore",
    ".editorconfig"
  ]
}

variable "project_id" {
  type = string
}