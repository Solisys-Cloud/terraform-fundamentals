# Challenge 06: A third note and a new input

**Prerequisite:** Complete the [module 06 guided lab](../../06-modules/README.md).  
**Goal:** Add a module call, then extend the module without breaking its existing callers.  
**Cloud account required:** No.

## Your task

Work in `06-modules/example` in your own clone.

### Part 1: a third call

1. In `main.tf`, add a call named `gamma` that writes `output/gamma.txt` with two lines of your choice.
2. In `outputs.tf`, add `module.gamma.file_path` to `note_paths` and include `gamma` in `total_lines`.
3. Run `terraform init`, `terraform validate`, and `terraform plan`.

### Part 2: a new optional input

4. In the module, add a variable `author` of type `string` with the default value `"unknown"`.
5. Add a line `Author: <author>` at the end of the file content.
6. Set `author` only in the `gamma` call.
7. Run `terraform fmt -recursive`, `terraform validate`, and `terraform plan`.
8. Apply after review, open the three files, then destroy and run `git restore .`.

## Success criteria

- After Part 1, the plan shows **3 to add** and the new address `module.gamma.local_file.this`.
- After Part 2, the calls `alpha` and `beta` still work **without any edit**.
- `gamma.txt` shows your author name; the two other files show `Author: unknown`.
- `git status` does not list generated files or state files.

## Hints

- A new module call always needs `terraform init`.
- `concat` joins several lists into one.
- A new variable **with a default** does not break existing callers. A new variable without a default would force every caller to change.

<details>
<summary>Reveal a possible solution after attempting the challenge</summary>

In `modules/note/variables.tf`:

```hcl
variable "author" {
  description = "Name of the person who wrote the note."
  type        = string
  default     = "unknown"
}
```

In `modules/note/main.tf`:

```hcl
resource "local_file" "this" {
  filename = var.filename
  content  = join("\n", concat(["# Note: ${var.name}"], var.lines, ["Author: ${var.author}", ""]))
}
```

In the root `main.tf`:

```hcl
module "gamma" {
  source = "./modules/note"

  name     = "gamma"
  filename = "${path.root}/output/gamma.txt"
  lines    = ["Third call of the module.", "Added during the challenge."]
  author   = "Olivia"
}
```

</details>

## Reflection

You changed the module once and three files changed. When is that helpful? When could it be dangerous?
