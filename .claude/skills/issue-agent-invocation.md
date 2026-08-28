# Skill: GitHub Issue Agent Invocation

## When to use
When responding to a task that arrived via a GitHub issue (issue title/body/labels are in the prompt).

## Procedure

1. Parse the issue: title = task description, body = full spec, labels = routing hints.
2. Load relevant memory context (see memory-navigation skill).
3. Execute the task.
4. Format the response as a GitHub issue comment: use Markdown, include a summary heading, bullet key decisions, end with next-step suggestions if applicable.
5. If the task produced artifacts (files, code), reference them by path relative to repo root.

## Output format for issue comments

```markdown
## Result

<one-sentence summary>

### What was done
- bullet 1
- bullet 2

### Files changed / created
- `path/to/file` — what it does

### Next steps
- suggestion (if any)
```

## Gotchas

- The issue body is the authoritative spec. If it contradicts the title, body wins.
- Labels are routing hints, not hard constraints — use judgment if the task spans multiple agents.
