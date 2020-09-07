resource "google_cloudbuild_trigger" "tagTrigger" {
  provider = google-beta
  name = "${var.repoName}-tag"
  project = var.project_id
  description = "ci for tags for https://github.com/${var.ownerName}/${var.repoName}"
  filename = var.ciMainPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name = var.repoName
    push {
      tag = ".*"
    }
  }
}

resource "google_cloudbuild_trigger" "prTrigger" {
  provider = google-beta
  name = "${var.repoName}-dev"
  project = var.project_id
  description = "ci for pull requests for https://github.com/${var.ownerName}/${var.repoName}"
  filename = var.ciDevPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name = var.repoName
    pull_request {
      branch = ".*"
      comment_control = "COMMENTS_ENABLED"
    }
  }
}