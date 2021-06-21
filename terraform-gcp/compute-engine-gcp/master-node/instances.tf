resource "google_compute_region_instance_group_manager" "instance_master" {
  name               = "${var.name}-master"
  base_instance_name = "ckad-master"
  distribution_policy_zones = ["us-central1-a"]
  target_size        = "1"


  version {
    instance_template = google_compute_instance_template.tpl-master.id
  }
  region = "us-central1"
}
