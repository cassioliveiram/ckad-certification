resource "google_compute_instance_template" "tpl" {
  name = "${var.name}-template"
  description = var.description

  instance_description = var.description
  machine_type = "n1-standard-2"
  can_ip_forward = false
  metadata_startup_script = "ready-for.sh"

  disk {
    disk_name = var.name
    source_image = "projects/ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20210429"
    auto_delete = true
    boot = true
    disk_size_gb = 30
    disk_type = "pd-balanced"
  }

  network_interface {
    network = "projects/ckad-certification-315919/global/networks/vpc-ckad-lab"
    access_config {
      network_tier = "PREMIUM"
        }
    }

  labels = {
    my_key = google_compute_project_metadata.ssh_key_ckad_labs.id
  }

  service_account {
    email = data.google_service_account.svc_terraform.email
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}

resource "google_compute_region_instance_group_manager" "instance_group_manager" {
  name               = var.name
  base_instance_name = "ckad"
  distribution_policy_zones = ["us-central1-c","us-central1-b"]
  target_size        = "2"

  version {
    instance_template = google_compute_instance_template.tpl.id
  }
}


//resource "google_compute_instance_from_template" "tpl" {
//  name = var.name
//
//  source_instance_template = google_compute_instance_template.tpl.id
//
//  // Override fields from instance template
//  can_ip_forward = false
//  labels = {
//    my_key = google_compute_project_metadata.ssh_key_ckad_labs.id
//  }
//}
