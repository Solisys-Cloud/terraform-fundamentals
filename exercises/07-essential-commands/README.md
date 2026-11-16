# Challenge 07: Find the errors

**Prerequisite:** Complete the [module 07 guided lab](../../07-essential-commands/README.md).  
**Goal:** Repair a broken configuration using `fmt`, `validate`, and `plan`, then apply a saved plan.  
**Cloud account required:** No.

## Your task

Work in `07-essential-commands/example` in your own clone.

1. Replace the content of `main.tf` with the broken configuration below. Type it or paste it exactly.

```text
resource "local_file" "release_note" {
  filename = "${path.module}/release-note.txt"
  content  = "Release ${var.relase}\n"
}

resource "local_file" "changelog" {
  filename = "${path.module}/release-note.txt"
  contents = "Changes in this release\n"
}

output "release_file" {
  description = "Path of the generated release note."
  value       = local_file.release_notes.filename
}
```

2. Run `terraform validate`. Fix one error at a time and run it again until it succeeds.
3. Run `terraform plan`. Read it carefully: one problem is not an error for Terraform, but it is a mistake.
4. Fix that last problem, then run `terraform fmt -check`.
5. Save a plan to `challenge.tfplan`, show it, and apply it.
6. Destroy the resources, delete `challenge.tfplan`, and run `git restore .`.

## Success criteria

- You found **three** errors with `validate` and **one** mistake by reading the plan.
- The final plan shows **2 to add** with two different file names.
- You applied a saved plan, not a fresh one.
- `git status` does not list generated files, plan files, or state files.

## Hints

- `validate` reports the file name and the line number of each error.
- Compare names carefully: a variable, an argument, and a resource reference are each misspelled once.
- Two resources that write the same file will overwrite each other. Terraform does not see this as an error.

<details>
<summary>Reveal the solution after attempting the challenge</summary>

| Problem | Found with | Fix |
| --- | --- | --- |
| `var.relase` | `validate` | `var.release` |
| `contents = ...` | `validate` | `content = ...` |
| `local_file.release_notes` | `validate` | `local_file.release_note` |
| Both resources use `release-note.txt` | Reading the plan | Give the changelog its own file, for example `changelog.txt` |

```hcl
resource "local_file" "release_note" {
  filename = "${path.module}/release-note.txt"
  content  = "Release ${var.release}\n"
}

resource "local_file" "changelog" {
  filename = "${path.module}/changelog.txt"
  content  = "Changes in this release\n"
}

output "release_file" {
  description = "Path of the generated release note."
  value       = local_file.release_note.filename
}
```

Remember that `changelog.txt` is a generated file: delete it after the destroy if it remains.

</details>

## Reflection

Three errors were caught by a tool. One was only caught by reading. What does that say about reviewing a plan before applying it?
