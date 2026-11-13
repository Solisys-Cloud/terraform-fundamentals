# Terraform Fundamentals

A beginner-friendly course to learn the basics of Terraform and Git, one small step at a time.

This repository focuses on **concepts and guided exercises**. The separate [azure-terraform-devops-lab](https://github.com/Solisys-Cloud/azure-terraform-devops-lab) repository is for practical Azure labs.

**No Azure subscription is needed to start.** Where possible, examples use local resources so you can practice on your computer.

## Course roadmap

Follow these modules in order:

| Module | Topic | What you will learn |
| --- | --- | --- |
| `01-what-is-terraform/` | What is Terraform? | Infrastructure as Code and the Terraform workflow |
| `02-providers/` | Providers | How Terraform connects to resources, including the local provider |
| `03-tf-files/` | Terraform files | What `main.tf`, `versions.tf`, and other `.tf` files do |
| `04-state/` | State | Why Terraform keeps state and how to protect it |
| `05-variables-outputs/` | Variables and outputs | How to reuse configuration and view results |
| `06-modules/` | Modules | How to organize and reuse Terraform code |
| `07-essential-commands/` | Essential commands | `init`, `fmt`, `validate`, `plan`, `apply`, and `destroy` |
| `08-git-basics/` | Git basics | Repositories, commits, staging, and pushing changes |
| `09-branches-pull-requests/` | Branches and pull requests | How to work safely with branches and code review |
| `exercises/` | Practice | Progressive exercises that combine the topics |

> Modules will be added gradually. A folder may not exist until its pull request has been merged.

## What to expect in each module

Each module includes:

1. A short, plain-English `README.md`.
2. A clear SVG diagram.
3. A small example you can run without Azure whenever possible.
4. One progressive exercise.
5. Three **Check your understanding** questions.

## Getting started

- Install [Terraform](https://developer.hashicorp.com/terraform/install) and [Git](https://git-scm.com/downloads) before running exercises.
- Start with module 01 and work through the modules in order.
- Read the commands before running them. No exercise should run `terraform apply` automatically.
- Never commit credentials, secrets, Terraform state files, or private variable values.

## Contribution and review workflow

- Use a **separate branch and pull request** for each module. Never push directly to `main`.
- Every change is reviewed in a pull request before it is merged.
- Start the next pull request only after the previous one has been merged.
- Keep explanations and examples beginner-friendly.

Maintained by Olivier Lumeau, Solisys SRL
