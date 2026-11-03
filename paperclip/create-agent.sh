#!/usr/bin/env bash
# Creates the "Engineer" agent (Claude Code adapter) in a running Paperclip instance.
# Prereqs: Node 24.11+, the `claude` CLI installed and logged in on this machine.
set -euo pipefail
cd "$(dirname "$0")"

# 1. Start Paperclip once (first run creates config + embedded DB), then leave it running:
#      npx paperclipai@latest onboard --yes
# 2. Find your company id:
#      npx paperclipai company list
COMPANY_ID="${1:?usage: $0 <company-id>}"

# Point the agent at this repo
PAYLOAD=$(sed "s#/ABSOLUTE/PATH/TO/myRepository#$(cd .. && pwd)#" engineer-agent.json)

npx paperclipai agent create --company-id "$COMPANY_ID" --payload-json "$PAYLOAD"
npx paperclipai agent list --company-id "$COMPANY_ID"
