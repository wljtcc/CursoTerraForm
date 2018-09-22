resource "opc_compute_sec_rule" "test_rule" {
  name             = "test"
  source_list      = "seclist:${opc_compute_security_list.sec-list1.name}"
  destination_list = "seciplist:${opc_compute_security_ip_list.sec-ip-list1.name}"
  action           = "permit"
  application      = "${opc_compute_security_application.tomcat.name}"
}

resource "opc_compute_security_list" "sec-list1" {
  name                 = "sec-list-1"
  policy               = "permit"
  outbound_cidr_policy = "deny"
}

resource "opc_compute_security_ip_list" "sec-ip-list1" {
  name       = "sec-ip-list1"
  ip_entries = ["217.138.34.4"]
}

resource "opc_compute_security_application" "tomcat" {
  name     = "tomcat"
  protocol = "tcp"
  dport    = "8080"
}

resource "opc_compute_ip_reservation" "reservation3" {
  parent_pool = "/oracle/public/ippool"
  permanent   = true
  tags        = ["test"]
}


output "public_ip_reservation" {
  value ="${opc_compute_ip_reservation.reservation3.ip}"
}

output "sec_application" {
  value ="${opc_compute_security_application.tomcat.dport}"
}

output "sec_ip_list" {
  value ="${opc_compute_security_ip_list.sec-ip-list1.name}"
}


output "sec_rule_attributes" {
  value ="${opc_compute_sec_rule.test_rule.source_list}",
  value ="${opc_compute_sec_rule.test_rule.destination_list}",
  
}


output "sec_list" {
  value ="${opc_compute_security_list.sec-list1.outbound_cidr_policy}"
}



