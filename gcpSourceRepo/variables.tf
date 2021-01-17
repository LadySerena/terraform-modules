variable "repoName" {
  type = string
}

variable "ciMasterPath" {
  type    = string
  default = "ci/master/cloudbuild.yaml"
}

variable "ciDevPath" {
  type    = string
  default = "ci/feature/cloudbuild.yaml"
}

variable "ignoredFiles" {
  type = list(string)
  default = [
    "README.md",
  ".gitignore"]
}

