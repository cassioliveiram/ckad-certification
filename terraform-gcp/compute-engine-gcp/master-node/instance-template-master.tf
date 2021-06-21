module "ssh-key" {
  source = "../ssh-key.tf"
}

resource "google_compute_instance_template" "tpl-master" {
  name = "${var.name}-template-master"
  description = var.description

  instance_description = var.description
  machine_type = "e2-medium"
  can_ip_forward = false
  metadata_startup_script = data.template_file.script-master.rendered

  disk {
    disk_name = var.name
    source_image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210604"
    auto_delete = true
    boot = true
    disk_size_gb = 20
    disk_type = "pd-balanced"
  }

  network_interface {
    network = "projects/ckad-certification-315919/global/networks/vpc-ckad-lab"
    access_config {
      network_tier = "PREMIUM"
    }
  }

  labels = {
    my_key = module.ssh-key.ssh_key_ckad_labs.id
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
