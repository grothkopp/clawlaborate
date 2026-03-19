# /collalog:setup — Project Setup

One-time setup for a new or existing project. Run this once after `collalog init`.

## What This Does

1. Asks for project details (name, description, team, technologies, communication)
2. Populates `collalog/project.md` with the answers
3. Creates initial task list in `collalog/tasks.md`
4. Optionally seeds the log from existing project data

## For Existing Projects

If the project already has history, offer to import:

- **Git log**: Run `git log --oneline --since="3 months ago"` and summarize key changes as [change] entries
- **README/docs**: Extract project description, tech stack, and goals from existing files
- **Package files**: Read `package.json`, `Cargo.toml`, `pyproject.toml`, etc. for technologies
- **Open issues**: If GitHub issues exist, import open ones as [task] entries

Ask the user: "This repo has existing history. Want me to seed the log from git history and project files?"

## Steps

1. Greet the user and explain what this command does
2. Ask questions one at a time:
   - Project name
   - Short description (1-2 sentences)
   - Team members (name, shortcut like @SG, role) — keep asking until user says done
   - Key technologies
   - Communication platform (Slack, WhatsApp, Teams, etc.)
3. If existing repo: offer to import history
4. Write `collalog/project.md`
5. Write initial `collalog/tasks.md` with setup tasks
6. If importing: write initial entries to `collalog/log.md`
7. Log the setup itself as a [milestone] entry
8. Commit with: `org: collalog setup complete`

## Important

- Be conversational, not robotic
- Don't dump all questions at once — ask one at a time
- For team members, suggest shortcuts based on names (e.g., "Stefan Grothkopp" → "@SG")
- If the user already has a CLAUDE.md, update it rather than overwriting
