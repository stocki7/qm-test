# Platzhalter – hier entsteht die Prod-Umgebung (VMs, Netzwerk, Firewall).
# Gemeinsame Bausteine nach infra/terraform/modules/ auslagern.
terraform {
  required_version = ">= 1.6"
  required_providers {
    cloudstack = {
      source  = "cloudstack/cloudstack"
      version = "~> 0.5"
    }
  }
  # backend "..." { }   # TODO: siehe ADR zum Terraform-State
}

provider "cloudstack" {
  # Zugangsdaten kommen aus CLOUDSTACK_API_URL / CLOUDSTACK_API_KEY / CLOUDSTACK_SECRET_KEY
}
