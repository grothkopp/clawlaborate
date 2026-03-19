# clawlaborate

**Make collaboration part of your repo, not another tool.**

clawlaborate adds structured collaboration to any project through your AI coding agent. Instead of switching between Slack, Jira, Notion, and your IDE, the agent tracks tasks, logs decisions, maintains project memory, and keeps everyone in sync — all in plain Markdown files inside your git repository.

Every team member keeps using their preferred tool. The AI agent handles the overhead.

## Why

Most collaboration overhead isn't the actual work — it's the meta-work: updating task boards, writing meeting notes, documenting decisions, keeping everyone informed. This is exactly what AI agents are good at.

clawlaborate gives your agent the skills and structure to:

- **Track tasks** with owners and status — right in the repo
- **Log decisions** (lightweight ADRs) — who decided what, when, and why
- **Maintain project memory** — context that survives between sessions
- **Write changelogs** automatically — what changed and why
- **Run daily briefings** — everyone starts the day aligned
- **Commit everything to git** — full history, no lock-in

It works with any AI coding tool: Claude Code, Codex, Cursor, Gemini, Windsurf, Copilot, and more. Skills are installed where your tool expects them.

## Quick Start

### 1. Install clawlaborate

```bash
git clone https://github.com/grothkopp/clawlaborate.git
export PATH="$PATH:$(pwd)/clawlaborate/bin"
```

### 2. Initialize your project

```bash
cd my-project
clawbo init .

# For a different AI tool:
clawbo --agent codex init .
clawbo --agent cursor init .
```

This creates:
- Skills in your agent's commands directory (e.g., `.claude/commands/clawbo.*.md`)
- `.clawlaborate/` with config, memory, logs, and prompts
- `0 Inbox/` and `1 Project/` for human-facing documents
- `CLAUDE.md` as the main agent prompt

### 3. Configure your project

```bash
clawbo setup
```

The setup wizard asks for:
- Project name and description
- Team members (name, shortcut like @SG, role)
- Technologies and communication platform
- Additional directories

This generates a customized `CLAUDE.md`, populates memory files, and creates your task list.

### 4. Set up scheduled tasks

Configure these in your agent platform (Claude Code, OpenClaw, etc.):

- **Heartbeat** (every 30 min): Agent monitors conversations and updates tasks, decisions, memory. See `.clawlaborate/prompts/heartbeat.md`
- **Morning briefing** (daily 8:00): Agent sends a summary of open tasks, recent changes, and decisions. See `.clawlaborate/prompts/morning.md`

### 5. Commit and go

```bash
git add -A
git commit -m "org: initialize project with clawlaborate"
```

Start working. The agent will:
- Pick up tasks from conversations and add them to `1 Project/tasks.md`
- Log decisions to `.clawlaborate/logs/decisions.md` (ADR-style)
- Track changes in `.clawlaborate/logs/changelog.md`
- Keep project context in `.clawlaborate/memory/`
- Commit changes to git automatically

## Project Structure

```
my-project/
├── .clawlaborate/                   # Agent workspace
│   ├── config.yaml                  # Project configuration
│   ├── memory/                      # Project knowledge base
│   │   ├── project.md               #   Vision, status, tech stack
│   │   ├── topics.md                #   Subject areas, open questions
│   │   └── contacts.md              #   Team directory
│   ├── logs/                        # Change and decision history
│   │   ├── changelog.md             #   What changed and why
│   │   └── decisions.md             #   ADR-style decision records
│   ├── prompts/                     # Scheduled agent behaviors
│   │   ├── heartbeat.md             #   Every 30 min check-in
│   │   └── morning.md               #   Daily briefing
│   └── templates/                   # Original templates (for sync)
├── .claude/commands/                # Skills (Claude Code example)
│   ├── clawbo.git.md
│   ├── clawbo.changelog.md
│   ├── clawbo.decision-log.md
│   ├── clawbo.task-management.md
│   ├── clawbo.memory.md
│   └── clawbo.clawlaborate-sync.md
├── 0 Inbox/                         # Quick captures (for humans)
├── 1 Project/                       # Tasks and planning (for humans)
│   └── tasks.md
├── CLAUDE.md                        # Main agent prompt
└── .gitignore
```

**Convention:** Uppercase+Number folders (`0 Inbox/`, `1 Project/`) are for humans. Dot-folders (`.clawlaborate/`, `.claude/`) are for the agent.

## Supported Agents

| Agent | Commands Directory | File Pattern |
|-------|--------------------|--------------|
| Claude Code | `.claude/commands/` | `clawbo.*.md` |
| Codex | `.codex/prompts/` | `clawbo.*.md` |
| Cursor | `.cursor/commands/` | `clawbo.*.md` |
| Gemini CLI | `.gemini/commands/` | `clawbo.*.toml` |
| Windsurf | `.windsurf/workflows/` | `clawbo.*.md` |
| GitHub Copilot | `.github/agents/` | `clawbo.*.agent.md` |
| Kilo Code | `.kilocode/workflows/` | `clawbo.*.md` |
| Roo | `.roo/commands/` | `clawbo.*.md` |
| OpenCode | `.opencode/command/` | `clawbo.*.md` |
| Kiro CLI | `.kiro/prompts/` | `clawbo.*.md` |
| Amp | `.agents/commands/` | `clawbo.*.md` |
| OpenClaw | `.clawlaborate/skills/` | `clawbo.*.md` |

## Commands

```bash
clawbo init [path]         # Initialize a new project
clawbo setup               # Interactive project configuration
clawbo update              # Pull latest templates (won't overwrite customizations)
clawbo sync                # Show differences between project and templates
clawbo version             # Show version
```

**Options:**
- `--agent <type>` — AI tool (default: `claude`). See supported agents above.
- `--lang en|de` — Language for generated files (default: `en`)

## Updating Templates

When clawlaborate gets new skills or improvements:

```bash
cd my-project
clawbo update    # Pulls new templates, flags modified files
clawbo sync      # Shows diffs for review
```

When you improve a skill in your project and want to contribute it back:

```bash
clawbo sync      # See what changed vs. templates
# Copy improved files to your clawlaborate clone's templates/ directory
# Commit and push clawlaborate
```

## License

MIT
