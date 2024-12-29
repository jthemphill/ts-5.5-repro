#! /bin/bash

set -euo pipefail

# This test verifies that TypeScript <5.5 passes and TypeScript >=5.5 fails.

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

rm package.json
ln -s package.ts5_5_20240426.json package.json
pnpm install >& /dev/null
if pnpm tsc --outDir src ; then
    echo '✅ Passed with TypeScript 5.5.0-dev.20240426'
else
    echo '❌ Failed with TypeScript 5.5.0-dev.20240426"'
    exit 1
fi

rm package.json
ln -s package.ts5_5_20240427.json package.json
pnpm install >& /dev/null
if (pnpm tsc --outDir src || true) | grep 'error TS7017' > /dev/null ; then
    echo '✅ Failed with TypeScript 5.5.0-dev.20240427'
else
    echo '❌ Passed with TypeScript 5.5.0-dev.20240427'
    exit 1
fi
