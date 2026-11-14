# Challenge 02: One provider, two files

**Prerequisite:** Complete the [module 02 guided lab](../../02-providers/README.md).  
**Goal:** Reuse one provider for two resources and identify the provider version actually installed.  
**Cloud account required:** No.

## Your task

Work in `02-providers/example` in your own clone.

1. Inspect `versions.tf`: write down the provider's source and its allowed version range.
2. Run `terraform init` if needed. Open `.terraform.lock.hcl` and write down the **exact** selected provider version.
3. Add a second `local_file` resource named `notes` in `main.tf`.
4. It must create `provider-notes.txt` in the same directory with the content `I understand providers.\n`.
5. Run `terraform fmt`, `terraform validate`, and `terraform providers`.
6. Run `terraform plan` and identify the proposed changes.
7. Run `terraform apply` manually, then confirm after reviewing the plan.
8. Change the content of your new resource in `main.tf` and preview the result with `terraform plan`. Apply the change only after review.
9. Run `terraform plan -destroy`. If the removal is expected, run `terraform destroy` and confirm manually.

## Success criteria

- Both resources use `local_file` and work through the same `hashicorp/local` provider.
- You can explain why the version constraint in `versions.tf` may differ from the exact version in `.terraform.lock.hcl`.
- Both output files exist after approval, and neither remains after cleanup.
- `git status` does not show the generated text files or Terraform state. The lock file may appear as an untracked file and is intended for version control after review.

## Hints

- Create the file next to your configuration with `filename = "${path.module}/provider-notes.txt"`.
- A second resource does **not** require a second `required_providers` declaration.
- If the plan reports more changes than you expect, read each action before approving it.

<details>
<summary>Reveal a possible resource block after attempting the challenge</summary>

```hcl
resource "local_file" "notes" {
  content  = "I understand providers.\n"
  filename = "${path.module}/provider-notes.txt"
}
```

You should have both this resource and the original `local_file.provider_demo` resource in `main.tf`.

</details>

## Reflection

What would happen if every teammate were free to select a different provider version? How do a version constraint and a dependency lock file work together?
