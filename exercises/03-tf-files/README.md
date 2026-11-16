# Challenge 03: Tidy up one big file

**Prerequisite:** Complete the [module 03 guided lab](../../03-tf-files/README.md).  
**Goal:** Reorganize a configuration into conventional files without changing what Terraform manages.  
**Cloud account required:** No.

## Your task

Work in `03-tf-files/example` in your own clone.

1. Run `terraform init`, then `terraform apply` and confirm, so that both files exist.
2. Create one new file named `everything.tf` and move **all** the content of `versions.tf`, `main.tf`, and `extra.tf` into it. Delete the three original files.
3. Run `terraform plan`. Write down the result.
4. Now do the reverse with a clean layout: `versions.tf` for the `terraform` block, and `main.tf` for both resources. Delete `everything.tf`.
5. Run `terraform fmt`, `terraform validate`, and `terraform plan`.
6. Add a third resource named `challenge` in a new file `challenge.tf`. It must create `files-challenge.txt` next to the configuration.
7. Run `terraform plan`, read it, then apply after review.
8. Run `terraform plan -destroy`, then `terraform destroy` and confirm.
9. Run `git restore .` and delete `challenge.tf` to return to the published layout.

## Success criteria

- Steps 3 and 5 both report **No changes**.
- Step 7 proposes exactly **1 to add**.
- `git status` never lists `.terraform/`, state files, or generated text files.
- You can explain why moving code between files did not change the plan.

## Hints

- A directory may contain only one `terraform` block with `required_providers`. Move it, do not copy it.
- If the plan wants to destroy something, a resource name changed while you were moving code.
- `terraform fmt` rewrites files in the standard style. Run it before `validate`.

<details>
<summary>Reveal a possible challenge.tf after attempting the challenge</summary>

```hcl
resource "local_file" "challenge" {
  content  = "I can organize Terraform files.\n"
  filename = "${path.module}/files-challenge.txt"
}
```

</details>

## Reflection

If file names do not matter to Terraform, who are they for? What would you expect to find in a file named `network.tf`?
