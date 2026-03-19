# Prompt: Morning Briefing

> Schedule: Daily, weekdays at 8:00
> Skills: task-management, git, decision-log

## Purpose

Start the day with a clear picture of what's happening and what needs attention.

## Steps

1. **Collect open tasks** — Read `1 Project/tasks.md`, group by owner
2. **Check recent changes** — Run `git log --oneline --since="24 hours ago"`
3. **Check recent decisions** — Read last 48h entries from `agent/logs/decisions.md`
4. **Send summary** to the team:

```
Good morning! Here's today's overview:

**Open Tasks**
@Person1: [list their tasks]
@Person2: [list their tasks]
Unassigned: [list if any]

**Recent Changes** (last 24h)
- [commit summaries]

**Recent Decisions**
- [decision summaries, if any]

**Upcoming**
- [deadlines, meetings, or milestones if known]
```

## Important

- Keep it concise — this should take 30 seconds to read
- Skip sections that have nothing to report
- Flag overdue or blocked tasks explicitly
- If there are no tasks, changes, or decisions, send a short "all clear" instead of the full template
