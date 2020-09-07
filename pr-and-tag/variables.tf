variable "repoName" {
  type = string
}

variable "ownerName" {
  type = string
}

variable "ciMainPath" {
  type = string
  default = "ci/main/cloudbuild.yaml"
}

variable "ciDevPath" {
  type = string
  default = "ci/feature/cloudbuild.yaml"
}

variable "ignoredFiles" {
  type = list(string)
  default = [
    "README.md",
    ".gitignore"]
}

variable "project_id" {
  type = string
}