resource "google_compute_region_instance_group_manager" "instance_worker" {
  name               = "${var.name}-worker"
  base_instance_name = "ckad-worker"
  distribution_policy_zones = ["us-central1-c","us-central1-b"]
  target_size        = "2"

  version {
    instance_template = google_compute_instance_template.tpl-nodes.id
  }
  region = "us-central1"
}
