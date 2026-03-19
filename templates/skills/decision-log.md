# Skill: Decision Log

Document important decisions in `.clawlaborate/logs/decisions.md`.

Inspired by Architecture Decision Records (ADR) but lightweight enough for daily use.

## When to Log

- A direction or approach is chosen over alternatives
- Team agrees on a convention, tool, or process
- Scope changes or priorities shift
- Any decision someone might later ask "why did we do it this way?"

## Format

Newest entries first. Each entry is a lightweight ADR:

```markdown
### ADR-NNN: Short Title

- *Date:* YYYY-MM-DD
- *Status:* accepted | superseded by ADR-NNN | deprecated
- *Participants:* @SG, @AP
- *Context:* What is the situation? What forces are at play? What problem needs solving?
- *Options considered:*
  1. Option A — brief description
  2. Option B — brief description
- *Decision:* We will use Option A.
- *Rationale:* Why this option was chosen over the others. Be specific.
- *Consequences:* What follows from this decision — both positive and negative.
```

## Example

```markdown
### ADR-001: Use Markdown for all shared documents

- *Date:* 2026-03-19
- *Status:* accepted
- *Participants:* @SG, @NR
- *Context:* The team needs a format for shared documents that works in git,
  is readable without special tools, and can be edited by both humans and AI agents.
- *Options considered:*
  1. Markdown — universal, git-friendly, AI-readable
  2. Google Docs — rich formatting, real-time collaboration
  3. Notion — structured, database features
- *Decision:* We will use Markdown stored in git.
- *Rationale:* Markdown is the only format that works natively in all our tools
  (code editors, AI agents, git diffs). Google Docs and Notion require API access
  and don't integrate well with version control.
- *Consequences:* No rich formatting (tables are limited). Team members need basic
  Markdown knowledge. All changes are tracked in git history.
```

## Rules

- Number decisions sequentially (ADR-001, ADR-002, ...)
- Every decision gets a changelog entry and a git commit (type: decision)
- Be specific about the rationale — "seemed like a good idea" is not enough
- Include who was involved so decisions can be revisited with the right people
- When a decision is superseded, update the old entry's status and link to the new one
- Keep context brief but sufficient — someone reading this in 6 months should understand why
