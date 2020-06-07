resource "google_cloudbuild_trigger" "masterTrigger" {
  provider = google-beta
  name = "${var.repoName}-master"
  description = "ci for master branch for ${github_repository.githubRepo.html_url}"
  filename = var.ciMasterPath
  ignored_files = var.ignoredFiles
  github {
    owner = split("/", github_repository.githubRepo.full_name)[0]
    name = split("/", github_repository.githubRepo.full_name)[1]
    push {
      branch = "master"
    }
  }
}

resource "google_cloudbuild_trigger" "devTrigger" {
  provider = google-beta
  name = "${var.repoName}-dev"
  description = "ci for dev branches for ${github_repository.githubRepo.html_url}"
  filename = var.ciDevPath
  ignored_files = var.ignoredFiles
  github {
    owner = split("/", github_repository.githubRepo.full_name)[0]
    name = split("/", github_repository.githubRepo.full_name)[1]
    pull_request {
      branch = ".*"
      comment_control = "COMMENTS_ENABLED"
    }
  }
}