# Skill: Collalog Sync

Rules for syncing skills, commands, and prompts with the collalog template repository.

## Upstream (project -> collalog repo)

When a command or skill has been improved and the improvement is generic:
1. Run `collalog sync` to see diffs
2. Copy improved files to the collalog repo's `templates/` directory
3. Commit and push

## Downstream (collalog repo -> project)

When collalog has new templates:
1. Run `collalog update` — installs new files, flags modified ones
2. Run `collalog sync` — review diffs
3. Accept or merge manually

## Rules

- Never blindly overwrite — always review diffs
- Project-specific customizations should be clearly marked
- Keep the generic version clean and universally applicable
