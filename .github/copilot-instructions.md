# GitHub Copilot Instructions

This repo is `agent-memory-lab` in the `apex-integration-lab` org. It experiments with agent memory and invocation patterns.

## Memory system

All persistent context lives in `memory/` as a three-tier tree:
- `memory/**/.abstract.md` — L0, always-loaded summaries (≤256 chars)
- `memory/**/.overview.md` — L1, navigation indexes (≤4,000 chars)
- All other `.md` files — L2, full content

When suggesting edits that produce new knowledge, also suggest updating the relevant `.overview.md`.

## Agents

Agent definitions are in `agents/`. Each file specifies role, input, tools, output. Routing happens via GitHub issue labels — see `.github/workflows/agent-on-issue.yml`.

## Code style

- Minimal dependencies. No frameworks unless necessary.
- Node.js or Python for scripts.
- Prefer deletion over addition.
- Comment non-obvious decisions with `// ponytail: <ceiling> — <upgrade path>` when intentionally keeping something simple.
