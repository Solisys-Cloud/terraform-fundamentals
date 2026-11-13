# Challenge 01: Manage two local files

**Prerequisite:** Complete the [module 01 guided lab](../../01-what-is-terraform/README.md).  
**Goal:** Make a small change without copying a full solution.  
**Cloud account required:** No.

## Your task

Work inside `01-what-is-terraform/example` in your own clone.

1. Keep the existing `local_file.welcome` resource in `main.tf`.
2. Add another `local_file` resource named `notes`.
3. Make it create `notes.txt` in the same folder with the content `Terraform practice notes.\n`.
4. Run `terraform fmt` and `terraform validate`.
5. Run `terraform plan`. Identify **what Terraform wants to add** before changing anything.
6. Run `terraform apply` manually and confirm only after reading the plan.
7. Open both files to verify the contents.
8. Change the text in `notes.txt` **through `main.tf`**, not by editing the generated file directly. Preview and apply the change.
9. Run `terraform plan -destroy`, review the proposed removal, and then run `terraform destroy` manually.

## Success criteria

- You can point to two resource blocks in `main.tf`.
- After applying, `hello.txt` and `notes.txt` exist with the expected content.
- Changing configuration changes the next plan.
- After destroying, both managed files have been removed.
- `git status` does not show generated `.tfstate` files or lab output text files as new files.

## Hints

- A resource starts with `resource "local_file" "some_name"`.
- Use `filename = "${path.module}/notes.txt"` to place the file next to `main.tf`.
- Review `terraform plan` before every change.
- The example folder has a `.gitignore` for generated files, and the repository root ignores Terraform state.

<details>
<summary>Show an example solution after you try</summary>

Add this block to `main.tf` beneath the existing resource:

```hcl
resource "local_file" "notes" {
  content  = "Terraform practice notes.\n"
  filename = "${path.module}/notes.txt"
}
```

For step 8, change the `content` value in this block to a different sentence, then rerun `terraform plan` and `terraform apply` manually.

</details>

## Reflection

What did the plan show before you created the second file? What changed after editing its content? Explain the difference between the configuration and the generated file in your own words.
