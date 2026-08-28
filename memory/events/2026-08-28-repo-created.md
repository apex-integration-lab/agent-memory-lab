# Event: agent-memory-lab repo created

**Date:** 2026-08-28  
**Type:** Milestone

## What happened

The `agent-memory-lab` repo was scaffolded in the `apex-integration-lab` GitHub org. Structure includes:
- Three-tier memory system (`memory/` with L0/L1/L2 sidecars)
- Two invocation paths: Claude Code interactive + GitHub Actions on issue assignment
- Agent definitions for memory, research, and code agents
- `.claude/` project instructions and skill/command definitions
- `.github/copilot-instructions.md` for Copilot context

## Decisions

- Used file-tree memory pattern modeled on OpenViking L0/L1/L2 architecture rather than depending on the OpenViking package itself — keeps the repo self-contained and portable.
- GitHub Actions workflow uses the Anthropic Messages API directly (not the claude CLI) so no additional binary installs are needed on the runner.
- Agent routing uses issue labels; default agent handles unlabeled issues.
