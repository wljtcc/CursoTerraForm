resource "opc_compute_orchestrated_instance" "default" {
  name          = "default_orchestration"
  desired_state = "active"

  instance {
    name       = "default-orchestrated-instance"
    label      = "Orchestrated Instance 1 Label"
    shape      = "oc3"
    image_list = "${var.image}"
  }
}