# Skill: Decision Log

Document important decisions in `agent/logs/decisions.md`.

## When to Log

- A direction or approach is chosen over alternatives
- Team agrees on a convention, tool, or process
- Scope changes or priorities shift
- Any decision someone might later ask "why did we do it this way?"

## Format

Newest entries first:

```markdown
### YYYY-MM-DD — Short Title

- *Participants:* @SG, @AP
- *Context:* What prompted this decision
- *Decision:* What was decided
- *Rationale:* Why this option was chosen
- *Next steps:* What follows from this decision
```

## Rules

- Every decision gets a changelog entry and a git commit (type: decision)
- Be specific about the rationale — "seemed like a good idea" is not enough
- Include who was involved so decisions can be revisited with the right people
- Decisions are not permanent — they can be revisited. Link back to the original when overriding.
