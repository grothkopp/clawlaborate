# Skill: Changelog

Log significant changes to shared documents in `agent/logs/changelog.md`.

## When to Log

- Document created, renamed, or deleted
- Substantial content changes (not typo fixes)
- Structural changes to the workspace
- Config or setup changes

## Format

Newest entries first:

```markdown
### YYYY-MM-DD HH:MM — @Shortcut

- *File(s):* `path/to/file.md`
- *Change:* What was changed
- *Reason:* Why it was changed
```

## Rules

- Every changelog entry should be paired with a git commit (type: content, org, or memory)
- Keep entries concise — one to three lines per change
- Reference the file path relative to the project root
- Use the team member's shortcut who authored or requested the change
