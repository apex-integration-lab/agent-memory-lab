# agent-memory-lab

A laboratory for experimenting with agent memory and invocation patterns. Agents can be invoked two ways:

## Invocation Paths

### 1. Claude Code (Interactive)

Open this repo in Claude Code and submit any request. The project's `.claude/CLAUDE.md` gives Claude context about the memory system, available agents, and how to read/write memory.

```bash
clone git@github.com:apex-integration-lab/agent-memory-lab.git
cd agent-memory-lab
clause  # or open in Claude Code
```

Available slash commands (`.claude/commands/`):
- `/memory-read` — read a memory file from the `memory/` tree
- `/memory-write` — write or update a memory entry
- `/agent-run` — manually invoke a named agent with a prompt

### 2. GitHub Issue Assignment (Automated)

Assign a GitHub issue to trigger the corresponding agent automatically via GitHub Actions.

**How it works:**
1. Create an issue with a label matching an agent (`memory-agent`, `research-agent`, `code-agent`)
2. Assign the issue to any user (assignment is the trigger)
3. The workflow (`.github/workflows/agent-on-issue.yml`) wakes, routes by label, calls the Anthropic API with the issue as the prompt, and posts the result as a comment

**Label → Agent routing:**
| Label | Agent | Description |
|-------|-------|-------------|
| `memory-agent` | `agents/memory-agent.md` | Reads/writes structured memory |
| `research-agent` | `agents/research-agent.md` | Web research and synthesis |
| `code-agent` | `agents/code-agent.md` | Code generation and review |
| *(none)* | default | General-purpose assistant |

## Memory System

The `memory/` directory implements a three-tier context tree inspired by OpenViking's L0/L1/L2 model:

| Tier | File | Size limit | Loaded when |
|------|------|-----------|-------------|
| L0 | `.abstract.md` per dir | ~256 chars | Always — injected into every agent prompt |
| L1 | `.overview.md` per dir | ~4,000 chars | On demand — when an agent drills into a topic |
| L2 | Full files | Unlimited | Explicit read — deep context on request |

```
memory/
  .abstract.md          # L0: one-liner for the whole memory root
  .overview.md          # L1: full index of memory categories
  entities/             # People, orgs, projects
  events/               # Decisions, milestones
  preferences/          # User/agent preferences
  skills/               # Reusable execution patterns
  sessions/             # Per-session summaries
```

Agents read L0 always, navigate L1 to decide what to load, and pull L2 only when needed. Write via `memory-write` command or directly.

## Repo Layout

```
.claude/
  CLAUDE.md              # Project instructions for Claude Code
  skills/                # Reusable skill definitions
  commands/              # Slash command definitions
.github/
  copilot-instructions.md
  workflows/
    agent-on-issue.yml   # Issue assignment → agent trigger
memory/                  # L0/L1/L2 memory tree
agents/                  # Agent definitions
README.md
```

## Setup

1. Add `ANTHROPIC_API_KEY` to your repo secrets (Settings → Secrets → Actions)
2. Optionally add `GH_TOKEN` if you want the workflow to post comments with a bot identity (defaults to `GITHUB_TOKEN`)
3. Clone and open in Claude Code — no other install needed
