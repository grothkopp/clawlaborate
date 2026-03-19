# Skill: Changelog

Log significant changes to shared documents in `.clawlaborate/logs/changelog.md`.

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

## Example

```markdown
### 2026-03-19 14:30 — @SG

- *File(s):* `1 Project/tasks.md`
- *Change:* Added 5 research tasks from kickoff meeting
- *Reason:* Team agreed on initial work packages during kickoff

### 2026-03-19 10:00 — @NR

- *File(s):* `.clawlaborate/memory/project.md`, `.clawlaborate/memory/contacts.md`
- *Change:* Created initial project memory with vision, tech stack, and team directory
- *Reason:* Project setup — capturing decisions from planning phase
```

## Rules

- Every changelog entry should be paired with a git commit (type: content, org, or memory)
- Keep entries concise — one to three lines per change
- Reference the file path relative to the project root
- Use the team member's shortcut who authored or requested the change
