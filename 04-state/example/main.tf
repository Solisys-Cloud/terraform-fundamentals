# Two small resources, enough to see how Terraform records them in its state.

resource "local_file" "inventory" {
  content  = "server-01\nserver-02\n"
  filename = "${path.module}/state-inventory.txt"
}

resource "local_file" "owner" {
  content  = "Managed by Terraform. Do not edit by hand.\n"
  filename = "${path.module}/state-owner.txt"
}
