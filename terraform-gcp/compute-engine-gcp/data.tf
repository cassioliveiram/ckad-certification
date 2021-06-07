data "google_compute_subnetwork" "ckad-labs-subnetwork" {
  name   = "vpc-ckad-lab"
  region = "us-central1"
}

data "google_service_account" "svc_terraform" {
  account_id = "terraform"
}
