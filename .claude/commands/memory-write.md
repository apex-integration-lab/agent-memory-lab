# /memory-write

Write or update a file in the memory tree.

## Usage

```
/memory-write <path> <content>
```

- `path` is relative to `memory/`
- After writing, update the parent directory's `.overview.md` to include a one-line entry for the new file
- If the new entry makes the parent `.abstract.md` stale, update it too (keep ≤256 chars)
