# Challenge 05: A configurable greeting

**Prerequisite:** Complete the [module 05 guided lab](../../05-variables-outputs/README.md).  
**Goal:** Add your own variable, protect it with a validation rule, and expose a new output.  
**Cloud account required:** No.

## Your task

Work in `05-variables-outputs/example` in your own clone.

1. In `variables.tf`, add a variable named `owner` of type `string`, with a description and **no default**.
2. Add a validation rule: the value must be at least 2 characters long.
3. In `main.tf`, add a line `Owner: ...` to the content of the summary file.
4. In `outputs.tf`, add an output named `owner_greeting` with the value `Hello, <owner>!`.
5. Run `terraform fmt` and `terraform validate`.
6. Run `terraform plan` without giving a value. Observe what Terraform does, then cancel with `Ctrl+C`.
7. Run `terraform plan -var="owner=A"`. Read the error.
8. Run `terraform plan -var="owner=Olivia"`, then apply with the same option after review.
9. Run `terraform output owner_greeting`.
10. Run `terraform destroy -var="owner=Olivia"` and confirm, then `git restore .`.

## Success criteria

- Step 6: Terraform asks for a value, because the variable has no default.
- Step 7: your own error message is displayed and nothing is planned.
- Step 9: the output shows `"Hello, Olivia!"`.
- `git status` does not list generated text files or state files.

## Hints

- `length("text")` returns the number of characters of a string.
- A validation rule can only refer to its own variable: use `var.owner` inside the rule.
- To avoid repeating `-var` on every command, you could put `owner = "Olivia"` in your own `terraform.tfvars`.

<details>
<summary>Reveal a possible solution after attempting the challenge</summary>

In `variables.tf`:

```hcl
variable "owner" {
  description = "Name of the person responsible for the project."
  type        = string

  validation {
    condition     = length(var.owner) >= 2
    error_message = "owner must contain at least 2 characters."
  }
}
```

In `outputs.tf`:

```hcl
output "owner_greeting" {
  description = "A greeting for the project owner."
  value       = "Hello, ${var.owner}!"
}
```

In `main.tf`, inside the `content` block, add the line `Owner: ${var.owner}`.

</details>

## Reflection

Which values in your daily work change between environments? Which of them should never be committed to Git?
