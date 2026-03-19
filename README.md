# clawlaborate

Collaborative AI agent setup for teams. Set up skills, prompts, and project structure so multiple people can work together with a shared AI agent.

Built for [Claude Code](https://claude.ai/code) and [OpenClaw](https://github.com/anthropics/openclaw) agents, inspired by [spec-kit](https://github.com/github/spec-kit) and [OpenSpec](https://github.com/Fission-AI/OpenSpec).

## What It Does

clawlaborate gives your team a shared AI agent that:

- Maintains a **task list** with owners and deadlines
- Keeps a **decision log** — who decided what, when, and why
- Writes a **changelog** of all document changes
- Manages **project memory** — context that survives between sessions
- Runs a **morning briefing** and **heartbeat** to keep everyone in sync
- Commits everything to **git** automatically

## Quick Start

```bash
# Clone clawlaborate
git clone https://github.com/grothkopp/clawlaborate.git
export PATH="$PATH:$(pwd)/clawlaborate/bin"

# Initialize a new project
mkdir my-project && cd my-project
git init
clawlabo init .

# Configure project details (team, description, etc.)
clawlabo setup

# Review generated files, then commit
git add -A && git commit -m "org: initialize project with clawlaborate"
```

## Project Structure

After `clawlabo init`, your project looks like this:

```
my-project/
├── 0 Inbox/              # Quick captures
├── 1 Project/            # Tasks and planning
│   └── tasks.md
├── agent/
│   ├── skills/           # How the agent works
│   │   ├── git.md
│   │   ├── changelog.md
│   │   ├── decision-log.md
│   │   ├── task-management.md
│   │   ├── memory.md
│   │   └── clawlaborate-sync.md
│   ├── prompts/          # Scheduled behaviors
│   │   ├── heartbeat.md
│   │   └── morning.md
│   ├── memory/           # Project knowledge
│   │   ├── project.md
│   │   ├── topics.md
│   │   └── contacts.md
│   └── logs/             # Change and decision history
│       ├── changelog.md
│       └── decisions.md
├── .clawlaborate/        # Config
│   └── config.yaml
└── CLAUDE.md             # Main agent prompt
```

**Convention:** Uppercase + number folders (`1 Project/`) are for humans. Lowercase folders (`agent/`) are for the agent.

## Commands

| Command | Description |
|---------|-------------|
| `clawlabo init [path]` | Initialize a new project |
| `clawlabo setup` | Interactive project configuration |
| `clawlabo update` | Pull latest templates (won't overwrite customizations) |
| `clawlabo sync` | Show differences between project and templates |
| `clawlabo version` | Show version |

## Options

| Flag | Description |
|------|-------------|
| `--agent claude\|openclaw` | Agent type (default: claude) |
| `--lang en\|de` | Language for generated files (default: en) |

## Updating Templates

When clawlaborate gets new skills or prompt improvements:

```bash
clawlabo update    # Pulls new templates, skips modified files
clawlabo sync      # Shows diffs for modified files
```

When you improve a skill in your project and want to contribute it back:

```bash
clawlabo sync      # See what changed
# Copy improved files to your clawlaborate clone
# Commit and push clawlaborate
```

## License

MIT
