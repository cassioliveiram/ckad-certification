//create output from master node ip

output "master_private_ip" {
  value = google_compute_region_instance_group_manager.instance_master.description
}