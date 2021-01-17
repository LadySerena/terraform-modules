resource "google_cloudbuild_trigger" "masterTrigger" {
  provider      = google-beta
  name          = "${var.repoName}-master"
  description   = "ci for master branch for https://github.com/${var.ownerName}/${var.repoName}"
  filename      = var.ciMasterPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name  = var.repoName
    push {
      branch = "master"
    }
  }
}

resource "google_cloudbuild_trigger" "devTrigger" {
  provider      = google-beta
  name          = "${var.repoName}-dev"
  description   = "ci for pull requests for https://github.com/${var.ownerName}/${var.repoName}"
  filename      = var.ciDevPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name  = var.repoName
    pull_request {
      branch          = ".*"
      comment_control = "COMMENTS_ENABLED"
    }
  }
}