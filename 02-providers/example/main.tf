resource "local_file" "provider_demo" {
  content  = "This file was created through the Local provider.\n"
  filename = "${path.module}/provider-demo.txt"
}
