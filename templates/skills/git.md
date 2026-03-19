# Skill: Git Conventions

Rules for version control in collalog projects.

## Commit Format

```
<type>: <short description>

Author: @<shortcut>
```

The commit type matches the log entry type: change, decision, task, idea, note, milestone, org.

## Rules

- Commit after every logical unit of change
- Write meaningful commit messages — the log entry title works well
- Never auto-push; commits stay local until explicitly pushed
- Run `git pull --rebase` before committing to avoid merge conflicts
- Always include `collalog/log.md` in commits that have log updates
- Use the Author field to attribute changes to the right person
