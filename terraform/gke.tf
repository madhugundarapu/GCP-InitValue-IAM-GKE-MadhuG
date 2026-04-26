resource "google_container_cluster" "cluster" {
  name     = "gke-cluster"
  location = "us-east1"

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  location = "us-east1-b"
  cluster  = google_container_cluster.cluster.name

  node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
