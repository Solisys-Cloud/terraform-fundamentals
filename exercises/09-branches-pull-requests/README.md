# Challenge 09: Two branches, one file

**Prerequisite:** Complete the [module 09 guided lab](../../09-branches-pull-requests/README.md).  
**Goal:** Manage two branches created from the same commit, resolve the conflict between them, and finish with a clean history.  
**Cloud account required:** No. GitHub is optional for the last step.

## Your task

Work in your `git-sandbox` folder, starting from an up-to-date `main`.

1. Create a branch `feature/add-owner-tag`. In `main.tf`, add a comment line `# Owner: platform team` as the **first line** of the file. Commit.
2. Return to `main`. Create a second branch `feature/add-purpose-tag`. Add a comment line `# Purpose: training` as the **first line** of the file. Commit.
3. Return to `main` and merge `feature/add-owner-tag`.
4. Merge `feature/add-purpose-tag`. A conflict appears.
5. Resolve it so that **both** comment lines are kept, owner first.
6. Complete the merge, delete both branches, and display the history as a graph.
7. Optional: repeat the idea through GitHub. Push a new branch with one small change, open a pull request using the structure of the template, review **Files changed**, merge, and update your local `main`.

## Success criteria

- `main.tf` starts with the two comment lines and contains no conflict markers.
- `git log --oneline --graph` shows the two branches joining.
- `git branch` lists only `main`.
- `git status` ends with `nothing to commit, working tree clean`.

## Hints

- Both branches must start from the same commit of `main`: switch back to `main` before creating the second one.
- Resolving a conflict does not mean choosing one side. You can keep both, in the order you decide.
- Search the file for `<<<<<<<`, `=======`, and `>>>>>>>` before committing.

<details>
<summary>Reveal a possible solution after attempting the challenge</summary>

```sh
git switch -c feature/add-owner-tag
# edit main.tf: add "# Owner: platform team" as first line
git add main.tf
git commit -m "Add owner comment"

git switch main
git switch -c feature/add-purpose-tag
# edit main.tf: add "# Purpose: training" as first line
git add main.tf
git commit -m "Add purpose comment"

git switch main
git merge feature/add-owner-tag
git merge feature/add-purpose-tag
# CONFLICT: edit main.tf, keep both lines, remove the markers
git add main.tf
git commit -m "Merge purpose comment, keep both comments"

git branch -d feature/add-owner-tag feature/add-purpose-tag
git log --oneline --graph
```

The top of `main.tf` after the resolution:

```text
# Owner: platform team
# Purpose: training
```

</details>

## Reflection

How could the two authors have avoided this conflict? Think about branch lifetime and about how often each of them updated from `main`.
