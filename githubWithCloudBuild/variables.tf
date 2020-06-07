variable "repoName" {
  type = string
}

variable "ownerName" {
  type = string
}

variable "description" {
  type = string
}

variable "private" {
  type = bool
  default = false
  description = "should this github repo be private? defaults to false"
}

variable "autoInit" {
  type = bool
  default = false
  description = "should github create the initial commit and readme? defaults to false"
}

variable "license" {
  type = string
  default = "apache-2.0"
  description = "which license should be attached to this project (defaults to apache 2.0). see https://www.terraform.io/docs/providers/github/r/repository.html#license_template for more information"
}

variable "ciMasterPath" {
  type = string
  default = "ci/master/cloudbuild.yaml"
}

variable "ciDevPath" {
  type = string
  default = "ci/feature/cloudbuild.yaml"
}

variable "ignoredFiles" {
  type = list(string)
  default = ["README.md", ".gitignore"]
}