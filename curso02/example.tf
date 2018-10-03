# Configure the Oracle Cloud Infrastructure Classic provider
provider "opc" {
  user            = ""
  password        = ""
  identity_domain = ""
  endpoint = "https://compute.brcom-central-1.oraclecloud.com"
}

# Create an IP Reservation
resource "opc_compute_ip_reservation" "production" {
  parent_pool = "/oracle/public/ippool"
  permanent = true
}

output "my_public_ip" {
  # incluir o ressource
  value = "${opc_compute_ip_reservation.production.ip}"
}
output "my_public_name" {
  # retornar na console o nome do ressource
  value = "${opc_compute_ip_reservation.production.name}"
}


