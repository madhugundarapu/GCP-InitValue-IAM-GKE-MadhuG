resource "google_service_account" "dev_sa" {
  account_id   = "dev-gke-sa"
  display_name = "Dev Service Account"
}

resource "google_service_account" "qa_sa" {
  account_id   = "qa-gke-sa"
  display_name = "QA Service Account"
}

resource "google_service_account" "devops_sa" {
  account_id   = "devops-gke-sa"
  display_name = "DevOps Service Account"
}

resource "google_service_account" "cicd_sa" {
  account_id   = "cicd-gke-sa"
  display_name = "CI/CD Service Account"
}

# IAM Roles
resource "google_project_iam_member" "dev_access" {
  role   = "roles/container.developer"
  member = "serviceAccount:${google_service_account.dev_sa.email}"
}

resource "google_project_iam_member" "qa_access" {
  role   = "roles/container.viewer"
  member = "serviceAccount:${google_service_account.qa_sa.email}"
}

resource "google_project_iam_member" "devops_access" {
  role   = "roles/container.admin"
  member = "serviceAccount:${google_service_account.devops_sa.email}"
}

resource "google_project_iam_member" "cicd_access" {
  role   = "roles/container.developer"
  member = "serviceAccount:${google_service_account.cicd_sa.email}"
}
