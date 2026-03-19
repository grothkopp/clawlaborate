# Skill: Task Management

Rules for maintaining the task snapshot at `collalog/tasks.md`.

The task list is a live snapshot derived from log entries of type [task].
It shows what's open, who owns it, and what's blocked.

## Task Format

```markdown
- [ ] Task description (@Owner, due date or context)
- [x] Completed task (@Owner, completed YYYY-MM-DD)
```

## Rules

- Every task change gets a log entry (type: task) AND an update to tasks.md
- Keep task descriptions actionable — start with a verb
- Always assign an owner when possible
- Mark blocked tasks with `blocked by:` and the dependency
- Update "Last updated" whenever the file changes
- Remove completed tasks after 2 weeks (they live on in the log)
- Group tasks under headings that fit the project
