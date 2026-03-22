# Prompt: Heartbeat

> Schedule: Every N minutes during working hours (configured during /colog:setup)
> Default: Every 30 minutes, 08:00-18:00, weekdays
> Skills: git, task-management, memory

## Purpose

Regular check-in to keep the git log and task list in sync with team activity.

## Working Hours

This prompt should only run during the team's configured working hours.
Check `colog/project.md` for the schedule configuration. If outside working
hours, do nothing and exit silently.

## Steps

1. **Gather context** — Read recent conversations since last heartbeat
2. **Run /colog:sync** — Pull remote changes, sync tasks.md ↔ git in both directions
3. **Log events** — For each loggable event found in conversations,
   use `/colog:log` to create the commit:
   - New tasks mentioned → `/colog:log` (type: task)
   - Decisions made → `/colog:log` (type: decision)
   - Questions asked → `/colog:log` (type: note)
   - New information → `/colog:log` (type: note), optionally update memory.md
4. **Save file changes** — If files were changed since last heartbeat,
   use `/colog:save` to commit them with semantic messages
5. **Notify** — Only message the team if something requires their attention.
   Do NOT send "nothing to report" messages.

## Important

- This runs automatically — be efficient and quiet
- Only speak up when there is something actionable or noteworthy
- Delegates to `/colog:sync`, `/colog:log`, and `/colog:save` — never duplicates their logic
- When in doubt, commit silently and let the morning briefing surface it
- Respect working hours — no notifications outside configured times
- The git log IS the project log — every commit is a log entry
