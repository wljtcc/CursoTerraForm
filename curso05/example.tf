resource "opc_compute_storage_volume" "foo" {
  name = "acc-test-orchestration"
  size = 1
}

resource "opc_compute_storage_volume" "bar" {
  name = "acc-test-orchestration-2"
  size = 1
}

resource "opc_compute_orchestrated_instance" "default" {
  name          = "test_orchestration"
  desired_state = "active"

  instance {
    name       = "default-instance"
    label      = "Default Instance"
    shape      = "oc3"
    image_list = "/oracle/public/OL_7.2_UEKR4_x86_64"

    storage {
      volume = "${opc_compute_storage_volume.foo.name}"
      index  = 1
    }

    storage {
      volume = "${opc_compute_storage_volume.bar.name}"
      index  = 2
    }
  }
}