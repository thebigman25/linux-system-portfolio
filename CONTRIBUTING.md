# Contributing & Engineering Standards

This document outlines the standards for adding new projects or updates to this portfolio. Adhering to these rules ensures the repository remains professional, scannable, and maintainable.

## 1. Version Control Standards (I.A.11)

### Commit Message Format
We follow the **Conventional Commits** specification. Every commit must be prefixed with a type:
* `feat`: A new project or major feature.
* `fix`: A bug fix in a script or configuration.
* `docs`: Changes to documentation (READMEs, templates).
* `chore`: Maintenance tasks (updating .gitignore, folder structure).
* `refactor`: Code changes that neither fix a bug nor add a feature.

**Example:** `feat(shell): add log rotation script`

### Branching Strategy
* **main**: The stable production-ready branch. Only completed projects are merged here.
* **dev**: The integration branch for active development.
* **feat/project-name**: Individual branches for new work.

## 2. Project Requirements
Every new project added to `/projects/` must include:
1. A project-specific `README.md` based on the standard template.
2. A `tests/` directory with at least one validation check.
3. No hardcoded secrets or absolute file paths.

## 3. Merge Policy
* Use **Pull Requests** for significant additions.
* All code must be linted and verified on a Linux environment (mafiaOS) before merging to `main`.
