resource "google_compute_firewall" "default" {
  name    = var.name
  description = var.description
  enable_logging = false
  network = google_compute_network.vpc_network.name

  ## Default is ingress traffic
  allow {
    protocol = "all"

    ## Is not necessary define ports if you want to open all ports. https://github.com/hashicorp/terraform-provider-google/issues/750#issuecomment-345870630
    //  ports = ["22-30000"]
  }

  target_service_accounts = [data.google_service_account.svc_terraform.email]

}
