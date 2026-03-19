#!/usr/bin/env bash
# generate.sh — Template generation functions for clawlaborate

# Parse YAML value (simple key: value extraction)
yaml_val() {
  local file="$1" key="$2"
  grep "^  $key:" "$file" 2>/dev/null | head -1 | sed 's/.*: "//' | tr -d '"' || echo ""
}

yaml_top_val() {
  local file="$1" key="$2"
  grep "^$key:" "$file" 2>/dev/null | head -1 | sed 's/.*: "//' | tr -d '"' || echo ""
}

# Extract team members from config
get_team() {
  local file="$1"
  # Parse team array entries
  grep -A2 '- name:' "$file" 2>/dev/null | paste -d'|' - - - | \
    sed 's/.*name: "//;s/".*shortcut: "/ | /;s/".*role: "/ | /;s/".*//' || true
}

# ─── CLAUDE.md Generator ────────────────────────────────────────────────────

generate_claude_md() {
  local config="$1" output="$2"

  local name=$(yaml_val "$config" "name")
  local desc=$(yaml_val "$config" "description")
  local lang=$(yaml_val "$config" "language")
  local tech=$(yaml_val "$config" "technologies")
  local comm=$(yaml_val "$config" "communication")

  cat > "$output" <<CLAUDE
# ${name}

${desc}

## Team

| Name | Shortcut | Role |
|------|----------|------|
CLAUDE

  # Add team members
  while IFS='|' read -r tname tshort trole; do
    [[ -z "$tname" ]] && continue
    tname=$(echo "$tname" | xargs)
    tshort=$(echo "$tshort" | xargs)
    trole=$(echo "$trole" | xargs)
    echo "| ${tname} | ${tshort} | ${trole} |" >> "$output"
  done < <(get_team "$config")

  cat >> "$output" <<'CLAUDE'

## Skills

The agent uses skills defined in `agent/skills/`:

| Skill | Description |
|-------|-------------|
| [git](agent/skills/git.md) | Version control conventions and commit format |
| [changelog](agent/skills/changelog.md) | Document tracking and change logging |
| [decision-log](agent/skills/decision-log.md) | Decision documentation and rationale |
| [task-management](agent/skills/task-management.md) | Shared task list management |
| [memory](agent/skills/memory.md) | Project knowledge and context maintenance |

## Prompts

Scheduled agent behaviors in `agent/prompts/`:

| Prompt | Schedule | Description |
|--------|----------|-------------|
| [heartbeat](agent/prompts/heartbeat.md) | Every 30 min | Monitor conversations, update tasks/decisions/memory |
| [morning](agent/prompts/morning.md) | Daily 8:00 | Daily summary: tasks, changes, decisions |

## Workspace Structure

```
0 Inbox/              — Quick captures, unsorted
1 Project/            — Tasks, planning
CLAUDE

  # Add extra directories
  local dir_num=2
  local extra_dirs=$(yaml_val "$config" "directories" || echo "")

  cat >> "$output" <<'CLAUDE'
agent/
  skills/             — Reusable agent instructions
  prompts/            — Scheduled agent behaviors
  memory/             — Project knowledge base
  logs/               — Changelog and decision log
CLAUDE.md             — This file
```

## Communication

CLAUDE

  if [[ -n "$comm" ]]; then
    echo "Primary channel: ${comm}" >> "$output"
  fi

  cat >> "$output" <<'CLAUDE'

The agent communicates with the team through the configured messaging platform.
When updating shared documents, always follow the changelog and git skills.

## Formatting

- Use proper Unicode characters where applicable
- No emojis
- Keep messages concise and actionable
CLAUDE

  if [[ "$lang" == "de" ]]; then
    echo "- Use proper German Umlauts: ÄÖÜäöüß" >> "$output"
  fi

  if [[ -n "$tech" ]]; then
    cat >> "$output" <<CLAUDE

## Technologies

${tech}
CLAUDE
  fi
}

# ─── Memory Generators ──────────────────────────────────────────────────────

generate_project_memory() {
  local config="$1" output="$2"

  local name=$(yaml_val "$config" "name")
  local desc=$(yaml_val "$config" "description")
  local tech=$(yaml_val "$config" "technologies")
  local lang=$(yaml_val "$config" "language")

  cat > "$output" <<MEM
# Project: ${name}

## Vision
${desc}

## Status
- Phase: Setup
- Started: $(date +%Y-%m-%d)

## Technologies
${tech:-TBD}

## Infrastructure
- Version control: Git
- Language: ${lang}

## Notes
MEM
}

generate_contacts_memory() {
  local config="$1" output="$2"

  cat > "$output" <<MEM
# Contacts

## Team

| Name | Shortcut | Role |
|------|----------|------|
MEM

  while IFS='|' read -r tname tshort trole; do
    [[ -z "$tname" ]] && continue
    tname=$(echo "$tname" | xargs)
    tshort=$(echo "$tshort" | xargs)
    trole=$(echo "$trole" | xargs)
    echo "| ${tname} | ${tshort} | ${trole} |" >> "$output"
  done < <(get_team "$config")

  cat >> "$output" <<'MEM'

## External Contacts
MEM
}

generate_tasks() {
  local config="$1" output="$2"

  local name=$(yaml_val "$config" "name")

  cat > "$output" <<TASKS
# Tasks — ${name}

> Last updated: $(date +%Y-%m-%d)

## Setup
- [ ] Review and customize CLAUDE.md
- [ ] Review agent skills and prompts
- [ ] Initial git commit

## Content

## Research

## Organization

## Tech
TASKS
}
