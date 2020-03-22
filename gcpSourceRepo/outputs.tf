output "repoName" {
  value = google_sourcerepo_repository.repo.name
}

output "repoURL" {
  value = google_sourcerepo_repository.repo.url
}

output "masterTriggerName" {
  value = google_cloudbuild_trigger.masterTrigger.name
}

output "devTriggerName" {
  value = google_cloudbuild_trigger.devTrigger.name
}