# Challenge 04: Lose the state, then get it back

**Prerequisite:** Complete the [module 04 guided lab](../../04-state/README.md).  
**Goal:** Experience a lost state file safely, and recover with a backup copy.  
**Cloud account required:** No.

## Your task

Work in `04-state/example` in your own clone.

1. Run `terraform init`, then `terraform apply` and confirm. Check with `terraform state list` that two resources are managed.
2. Create a folder named `state-copy` and **copy** `terraform.tfstate` into it.
3. Compare the original and the copy with a checksum. On macOS or Linux use `shasum -a 256`; in PowerShell use `Get-FileHash`. Both values must be identical.
4. Simulate the incident: **move** `terraform.tfstate` out of the directory, into `state-copy/lost/`. If a `terraform.tfstate.backup` file exists, move it too.
5. Run `terraform state list` and `terraform plan`. Write down what Terraform says. **Do not apply.**
6. Recover: copy your saved `terraform.tfstate` back next to the `.tf` files.
7. Run `terraform plan` again and write down the result.
8. Add a third resource named `challenge` that creates `state-challenge.txt`. Apply after review, then find its address with `terraform state list`.
9. Run `terraform plan -destroy`, then `terraform destroy` and confirm. Delete the `state-copy` folder.

## Success criteria

- In step 5, `terraform state list` reports that no state file was found (or lists nothing), and the plan proposes **2 to add**, although both files still exist on disk.
- In step 7, the plan reports **No changes**.
- In step 8, the state lists three addresses.
- `git status` never lists a state file or the `state-copy` folder.

## Hints

- Copy first, move second. The copy is your safety net.
- Terraform creates a fresh, empty state when it finds none. That is why the plan in step 5 wants to create everything.
- If step 7 still proposes changes, the file you copied back is not the one you saved.

<details>
<summary>Reveal a possible resource block after attempting the challenge</summary>

```hcl
resource "local_file" "challenge" {
  content  = "I know what the state is for.\n"
  filename = "${path.module}/state-challenge.txt"
}
```

Its address is `local_file.challenge`.

</details>

## Reflection

The files never disappeared during this challenge. What exactly was lost in step 4? Where would a team store the state so that one laptop cannot lose it?
