# Skill: Memory Navigation

## When to use
When a task requires reading prior context from the `memory/` tree before acting.

## Procedure

1. Read `memory/.abstract.md` — always. One line, instant orientation.
2. Decide: is this task memory-sensitive? If yes, read `memory/.overview.md`.
3. Find the relevant subdirectory from the L1 overview and read its `.overview.md`.
4. Pull specific L2 files only if you need full detail for the task.
5. After completing a task that produces new knowledge: write it back (see CLAUDE.md Writing memory section).

## Gotchas

- `.abstract.md` and `.overview.md` are hidden sidecars — they describe the directory, not individual files.
- Always update the parent `.overview.md` after adding a new L2 file, or the memory tree becomes stale.
- Keep `.abstract.md` ≤256 chars. If it grows, trim ruthlessly — this file is always loaded.
