provider "google" {
  credentials = file("../auth.json")

  project = "ckad-certification-315919"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_project_metadata" "ssh_key_ckad_labs" {
  metadata = {
    ssh-keys = <<EOF
      vagrant:SHA256:PW3Tq/ERdxb7VEbFWRZ3LEHCE/GRJYR1he85BmuxVHc runway-devenv
    EOF
  }
}

output "ssh_key_id" {
  value = google_compute_project_metadata.ssh_key_ckad_labs.id
}