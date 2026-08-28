# agent-memory-lab — Project Instructions

This repo is a laboratory for agent memory patterns and invocation experiments. You are operating inside it as a coding/research agent.

## Memory System

All persistent context lives in `memory/` as a three-tier file tree:

- **L0** (`.abstract.md` in each directory) — always load these first. They are ≤256 chars and give you a one-line orientation to each memory category.
- **L1** (`.overview.md` in each directory) — load when you need to navigate within a category. ≤4,000 chars.
- **L2** (all other `.md` files) — load on explicit request or when L1 points you there.

### Reading memory

1. Read `memory/.abstract.md` at the start of any task that might benefit from prior context.
2. If the task is clearly memory-relevant, also read `memory/.overview.md`.
3. Follow L1 pointers to drill into specific subdirs (e.g. `memory/entities/.overview.md`).
4. Pull individual L2 files only when you need the full detail.

### Writing memory

- Place new entities in `memory/entities/<slug>.md`
- Place event records in `memory/events/YYYY-MM-DD-<slug>.md`
- Place reusable patterns in `memory/skills/<slug>.md`
- After writing any file, update the parent dir's `.overview.md` to add a one-line entry.
- If an L0 `.abstract.md` is now stale, update it (keep ≤256 chars).

## Agents

Agent definitions live in `agents/`. Each file defines: role, input format, tools allowed, output format. You can invoke them by name or they are triggered by GitHub issue labels.

| File | Label | Purpose |
|------|-------|---------|
| `agents/memory-agent.md` | `memory-agent` | Memory read/write operations |
| `agents/research-agent.md` | `research-agent` | Research and synthesis |
| `agents/code-agent.md` | `code-agent` | Code tasks |

## Code Philosophy

Lazy senior developer rules apply: no abstractions nobody asked for, minimum viable code, deletion preferred over addition.

## Skills & Commands

- `.claude/skills/` — reusable patterns you can reference with `@skills/<name>`
- `.claude/commands/` — slash commands available in Claude Code
