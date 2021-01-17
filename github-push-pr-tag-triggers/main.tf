resource "google_cloudbuild_trigger" "branchTrigger" {
  provider      = google-beta
  name          = "${var.repoName}-main"
  project       = var.project_id
  description   = "ci for main branch for https://github.com/${var.ownerName}/${var.repoName}"
  filename      = var.ciPullRequestPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name  = var.repoName
    push {
      branch = ".*"
    }
  }
}

resource "google_cloudbuild_trigger" "tagTrigger" {
  provider      = google-beta
  name          = "${var.repoName}-tag"
  project       = var.project_id
  description   = "ci for tags for https://github.com/${var.ownerName}/${var.repoName}"
  filename      = var.ciTagPath
  ignored_files = var.ignoredFiles
  github {
    owner = var.ownerName
    name  = var.repoName
    push {
      tag = ".*"
    }
  }
}

resource "google_cloudbuild_trigger" "prTrigger" {
  provider      = google-beta
  name          = "${var.repoName}-dev"
  project       = var.project_id
  description   = "ci for pull requests for https://github.com/${var.ownerName}/${var.repoName}"
  filename      = var.ciPullRequestPath
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