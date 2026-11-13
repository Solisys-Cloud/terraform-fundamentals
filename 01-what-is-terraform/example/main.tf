resource "local_file" "welcome" {
  content  = "Hello from Terraform!\n"
  filename = "${path.module}/hello.txt"
}
