output "cluster_name" {
  value = google_container_cluster.cluster.name
}

output "project_id" {
  value = var.project_id
}
