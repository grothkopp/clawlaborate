# Skill: Git Version Control

Track all changes to shared documents with git.

## Commit Format

```
<type>: <short description>

<optional details>

Author: @<shortcut>
```

## Commit Types

| Type | Use for |
|------|---------|
| content | New or changed content (documents, research, writing) |
| task | Task list changes (added, completed, reassigned) |
| decision | New decision logged |
| memory | Updated project memory or knowledge base |
| org | Organizational changes (structure, config, setup) |

## Rules

- Commit after every logical unit of change (not after every line)
- Write meaningful commit messages — future you will thank you
- Never auto-push; commits stay local until explicitly pushed
- Run `git pull --rebase` before committing to avoid merge conflicts
- Use the Author field to attribute changes to the right person
- When the agent makes changes on behalf of a team member, use their shortcut
