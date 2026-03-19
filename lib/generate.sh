#!/usr/bin/env bash
# generate.sh — Template generation functions for clawlaborate

# Parse YAML value (simple key: value extraction, indented)
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
  local commands_dir=$(yaml_top_val "$config" "commands_dir")

  cat > "$output" << CLAUDE_INNER
# ${name}

${desc}

## Team

| Name | Shortcut | Role |
|------|----------|------|
CLAUDE_INNER

  while IFS='|' read -r tname tshort trole; do
    [[ -z "$tname" ]] && continue
    tname=$(echo "$tname" | xargs)
    tshort=$(echo "$tshort" | xargs)
    trole=$(echo "$trole" | xargs)
    echo "| ${tname} | ${tshort} | ${trole} |" >> "$output"
  done < <(get_team "$config")

  cat >> "$output" << CLAUDE_INNER

## Skills

The agent uses skills from \`${commands_dir:-".claude/commands"}/\`:

| Skill | Description |
|-------|-------------|
| git | Version control conventions and commit format |
| changelog | Document tracking and change logging |
| decision-log | Decision documentation with rationale (ADR-style) |
| task-management | Shared task list management |
| memory | Project knowledge and context maintenance |

## Prompts

Scheduled agent behaviors in \`.clawlaborate/prompts/\`:

| Prompt | Schedule | Description |
|--------|----------|-------------|
| heartbeat | Every 30 min | Monitor conversations, update tasks/decisions/memory |
| morning | Daily 8:00 | Daily summary: tasks, changes, decisions |

## Workspace Structure

\`\`\`
.clawlaborate/
  config.yaml          Project configuration
  memory/              Project knowledge base
  logs/                Changelog and decision log
  prompts/             Scheduled agent behaviors
  templates/           Original templates (for sync)
${commands_dir:-".claude/commands"}/
  clawbo.*.md          Skills (agent reads these)
0 Inbox/               Quick captures, unsorted
1 Project/             Tasks, planning
CLAUDE.md              This file
\`\`\`
CLAUDE_INNER

  echo "" >> "$output"
  echo "## Communication" >> "$output"
  echo "" >> "$output"

  if [[ -n "$comm" ]]; then
    echo "Primary channel: ${comm}" >> "$output"
  fi

  cat >> "$output" << 'CLAUDE_INNER'

The agent communicates with the team through the configured messaging platform.
When updating shared documents, always follow the changelog and git skills.

## Formatting

- Use proper Unicode characters where applicable
- No emojis
- Keep messages concise and actionable
CLAUDE_INNER

  if [[ "$lang" == "de" ]]; then
    echo "- Use proper German Umlauts: ÄÖÜäöüß" >> "$output"
  fi

  if [[ -n "$tech" ]]; then
    echo "" >> "$output"
    echo "## Technologies" >> "$output"
    echo "" >> "$output"
    echo "${tech}" >> "$output"
  fi
}

# ─── Memory Generators ──────────────────────────────────────────────────────

generate_project_memory() {
  local config="$1" output="$2"
  local name=$(yaml_val "$config" "name")
  local desc=$(yaml_val "$config" "description")
  local tech=$(yaml_val "$config" "technologies")
  local lang=$(yaml_val "$config" "language")

  cat > "$output" << MEM_INNER
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
MEM_INNER
}

generate_contacts_memory() {
  local config="$1" output="$2"

  cat > "$output" << 'MEM_INNER'
# Contacts

## Team

| Name | Shortcut | Role |
|------|----------|------|
MEM_INNER

  while IFS='|' read -r tname tshort trole; do
    [[ -z "$tname" ]] && continue
    tname=$(echo "$tname" | xargs)
    tshort=$(echo "$tshort" | xargs)
    trole=$(echo "$trole" | xargs)
    echo "| ${tname} | ${tshort} | ${trole} |" >> "$output"
  done < <(get_team "$config")

  echo "" >> "$output"
  echo "## External Contacts" >> "$output"
}

generate_tasks() {
  local config="$1" output="$2"
  local name=$(yaml_val "$config" "name")

  cat > "$output" << TASKS_INNER
# Tasks — ${name}

> Last updated: $(date +%Y-%m-%d)

## Setup
- [ ] Review and customize CLAUDE.md
- [ ] Review agent skills and prompts
- [ ] Set up heartbeat task (every 30 min)
- [ ] Set up morning briefing task (daily 8:00)
- [ ] Initial git commit

## Content

## Research

## Organization

## Tech
TASKS_INNER
}
