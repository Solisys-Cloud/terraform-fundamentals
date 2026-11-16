# Challenge 08: Three clean commits

**Prerequisite:** Complete the [module 08 guided lab](../../08-git-basics/README.md).  
**Goal:** Build a short, readable history and unstage a file added by mistake.  
**Cloud account required:** No.

## Your task

Work in your `git-sandbox` folder.

1. Create `variables.tf` with one variable named `greeting` (type `string`, with a default). Commit **only** this file.
2. Edit `main.tf` so that the file content uses `var.greeting`. Commit **only** this change.
3. Create `README.md` with two lines explaining what the folder contains. Create also a file `notes.tmp` with any text.
4. Run `git add .` and then `git status`. `notes.tmp` is staged, which is a mistake.
5. Unstage `notes.tmp` without deleting it, then add a rule to `.gitignore` so it is ignored.
6. Commit `README.md` and `.gitignore` together.
7. Display the history with `git log --oneline` and the content of the last commit with `git show --stat`.

## Success criteria

- `git log --oneline` shows **five** commits: two from the guided lab and three new ones.
- Each new commit message says what the commit does.
- `notes.tmp` exists on disk but appears in no commit and not in `git status`.
- `git status` ends with `nothing to commit, working tree clean`.

## Hints

- `git add FILE` stages one file. `git add .` stages everything that is not ignored.
- `git restore --staged FILE` removes a file from the staging area and keeps it on disk.
- A pattern such as `*.tmp` in `.gitignore` ignores every file with that extension.

<details>
<summary>Reveal a possible solution after attempting the challenge</summary>

```sh
git add variables.tf
git commit -m "Add greeting variable"

git add main.tf
git commit -m "Use the greeting variable in the file content"

git add .
git status
git restore --staged notes.tmp
echo "*.tmp" >> .gitignore
git add README.md .gitignore
git commit -m "Add README and ignore temporary files"

git log --oneline
git show --stat
```

</details>

## Reflection

Why is one commit per logical change easier to review than one large commit at the end of the day?
