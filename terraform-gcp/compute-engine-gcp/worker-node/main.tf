provider "google" {
  credentials = file("../../auth.json")

  project = "ckad-certification-315919"
  region  = "us-central1"
  zone    = "us-central1-c"
}
