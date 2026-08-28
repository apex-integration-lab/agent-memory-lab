# /memory-read

Read a file or directory from the memory tree.

## Usage

```
/memory-read [path]
```

- `path` is relative to `memory/` (e.g. `entities/aaron.md` or `skills/`)
- Omit path to read the root overview (`memory/.overview.md`)

## Behavior

If `path` is a directory: read its `.overview.md`. If `path` is a file: read it directly. Print the contents.
