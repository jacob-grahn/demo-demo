resource "google_service_account" "nodepool_sa" {
  account_id   = "nodepool-sa"
  display_name = "Nodepool Service Account"
}

resource "google_project_iam_member" "nodepool_sa_log_writer" {
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.nodepool_sa.email}"
}

resource "google_project_iam_member" "nodepool_sa_metric_writer" {
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.nodepool_sa.email}"
}

resource "google_project_iam_member" "nodepool_sa_monitoring_viewer" {
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.nodepool_sa.email}"
}
