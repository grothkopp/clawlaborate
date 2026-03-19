# Skill: Clawlaborate Sync

Sync generic skills and prompts between this project and the clawlaborate template repository.

## When to Use

- After improving a skill or prompt that should benefit other projects
- When updating to the latest clawlaborate templates
- During project review to check for upstream improvements

## Upstream (project -> clawlaborate)

When a skill or prompt has been improved in this project and the improvement is generic (not project-specific):

1. Run `clawbo sync` to see what differs from the templates
2. Copy the improved version to the clawlaborate repo's `templates/` directory
3. Commit in clawlaborate with message: `content: update <skill> from <project>`
4. Push clawlaborate changes

## Downstream (clawlaborate -> project)

When clawlaborate has new or updated templates:

1. Run `clawbo update` from the project root
2. Review flagged differences with `clawbo sync`
3. New skills are installed automatically; modified files are flagged for review

## Rules

- Never blindly overwrite project files — always review diffs
- Project-specific customizations in skills/prompts should be clearly marked with comments
- If a skill needs project-specific behavior, extend it rather than modifying the generic version
- Keep the generic version in clawlaborate clean and universally applicable
