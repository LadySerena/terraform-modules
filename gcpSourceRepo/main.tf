resource "google_sourcerepo_repository" "repo" {
  name = var.repoName
}

resource "google_cloudbuild_trigger" "masterTrigger" {
  name = "${google_sourcerepo_repository.repo.name}-master"
  description = "ci for master branch for ${google_sourcerepo_repository.repo.url}"
  filename = var.ciMasterPath
  ignored_files = var.ignoredFiles
  trigger_template {
    repo_name = google_sourcerepo_repository.repo.name
    branch_name = "master"
  }
}

resource "google_cloudbuild_trigger" "devTrigger" {
  name = "${google_sourcerepo_repository.repo.name}-dev"
  description = "ci for dev branches for ${google_sourcerepo_repository.repo.url}"
  filename = var.ciDevPath
  ignored_files = var.ignoredFiles
  trigger_template {
    repo_name = google_sourcerepo_repository.repo.name
    branch_name = "dev-.+"
  }
}