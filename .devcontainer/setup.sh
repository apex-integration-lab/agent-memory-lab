#!/usr/bin/env bash
set -euo pipefail

echo "=== agent-memory-lab devcontainer setup ==="

# Python deps
echo "Installing OpenViking..."
pip install openviking --upgrade --quiet

# Node deps: OpenViking CLI
echo "Installing OpenViking CLI..."
npm install -g @openviking/cli --silent

# Claude Code CLI
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code --silent \
  || echo "Claude Code install failed — install manually: npm install -g @anthropic-ai/claude-code"

# OpenViking Claude Code plugin (needs Claude Code + API key at runtime; soft-fail here)
if command -v claude &>/dev/null; then
  echo "Installing OpenViking memory plugin for Claude Code..."
  claude plugin install openviking-memory@openviking --non-interactive 2>/dev/null \
    || echo "Plugin install skipped — run manually: claude plugin install openviking-memory@openviking"
fi

echo ""
echo "=== Setup complete ==="
echo ""
echo "Next steps:"
echo "  1. Set ANTHROPIC_API_KEY in your environment"
echo "  2. openviking-server init      # configure LLM provider (interactive)"
echo "  3. openviking-server           # start server on port 1933"
echo "  4. ov config add custom --name local --url http://127.0.0.1:1933 --activate"
echo "  5. ov health                   # verify connectivity"
echo ""
echo "Then open Claude Code — the OpenViking memory plugin loads context automatically."
echo "See memory/ for the L0/L1/L2 context tree."
