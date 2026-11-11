#!/usr/bin/env bash
# Lightweight but real CI subset for the merge-guard trial:
#   1. dependency install without native builds (--ignore-scripts)
#   2. the repo's own client typecheck (pnpm run typecheck-client)
#   3. a typecheck of the trial sources with the repo's own tsc
# Intentionally NOT the full compile/test suite, which does not fit
# GitHub-hosted runner limits.
set -euo pipefail

export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
corepack enable 2>/dev/null || sudo corepack enable

pnpm install --ignore-scripts
pnpm run typecheck-client

if [ -d merge-guard-trial ]; then
  ./node_modules/.bin/tsc --noEmit --strict merge-guard-trial/*.ts
fi
