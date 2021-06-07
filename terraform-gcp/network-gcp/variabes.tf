variable "name" {
  type = string
  default = "vpc-ckad-lab"
  description = "VPC name"
}

variable "description" {
  type = string
  default = "Firewall rule to use in CKAD Lab"
  description = "Description used in the firewall rule resource"
}