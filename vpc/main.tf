resource "google_compute_network" "vpc_network" {
  count = 0
  name                    = var.vpc_name
  auto_create_subnetworks = false 
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  count = 0
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_range
  region        = var.subnet_region
  network       = google_compute_network.vpc_network.id
}

output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.vpc_subnetwork.id
}
