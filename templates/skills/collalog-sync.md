# Skill: Clawlaborate Sync

Sync generic skills and prompts between this project and the collalog template repository.

## When to Use

- After improving a skill or prompt that should benefit other projects
- When updating to the latest collalog templates
- During project review to check for upstream improvements

## Upstream (project -> collalog)

When a skill has been improved and the improvement is generic (not project-specific):

1. Run `collalog sync` to see what differs from the templates
2. Copy the improved version to the collalog repo's `templates/` directory
3. Commit in collalog with message: `change: update <skill> from <project>`
4. Push collalog changes

## Downstream (collalog -> project)

When collalog has new or updated templates:

1. Run `collalog update` from the project root
2. Review flagged differences with `collalog sync`
3. Accept or merge changes manually

## Rules

- Never blindly overwrite project files — always review diffs
- Project-specific customizations should be clearly marked with comments
- If a skill needs project-specific behavior, extend it rather than modifying the generic version
- Keep the generic version in collalog clean and universally applicable
