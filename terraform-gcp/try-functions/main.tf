provider "google" {
  credentials = file("../auth.json")

  project = "ckad-certification-315919"
  region  = "us-central1"
  zone    = "us-central1-c"
}

//data "google_compute_subnetwork" "ckad-labs-subnetwork" {
//  name   = "vpc-ckad-lab"
//  region = "us-central1"
//}
//
//output "subnetwork" {
//  value = data.google_compute_subnetwork.ckad-labs-subnetwork.name
//}


output "master_private_ip" {
  value = google_compute_region_instance_group_manager.instance_master.description
}

