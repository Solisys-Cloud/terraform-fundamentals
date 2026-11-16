# Root configuration: the folder where you run terraform commands.
# It calls the same module twice. Each call writes to a different path.

module "alpha" {
  source = "./modules/note"

  name     = "alpha"
  filename = "${path.root}/output/alpha.txt"
  lines    = ["First call of the module."]
}

module "beta" {
  source = "./modules/note"

  name     = "beta"
  filename = "${path.root}/output/beta.txt"
  lines    = ["Second call of the module.", "Same code, different values."]
}
