data "google_compute_subnetwork" "ckad-labs-subnetwork" {
  name   = "vpc-ckad-lab"
  region = "us-central1"
}

output "subnetwork" {
  value = data.google_compute_subnetwork.ckad-labs-subnetwork.name
}

provider "google" {
  credentials = file("../auth.json")

  project = "ckad-certification-315919"
  region  = "us-central1"
  zone    = "us-central1-c"
}
