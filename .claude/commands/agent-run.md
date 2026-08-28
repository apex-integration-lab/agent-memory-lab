# /agent-run

Manually invoke a named agent with a prompt.

## Usage

```
/agent-run <agent-name> <prompt>
```

Valid agent names: `memory-agent`, `research-agent`, `code-agent`

## Behavior

1. Read the agent definition from `agents/<agent-name>.md`
2. Load the agent's required memory context (per its definition)
3. Execute the prompt under the agent's role and constraints
4. Return the result in the agent's output format
