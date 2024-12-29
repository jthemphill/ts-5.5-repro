#! /bin/bash

set -euo pipefail

# This test verifies that TypeScript <5.5 passes and TypeScript >=5.5 fails.

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

rm package.json
ln -s package.ts5_4.json package.json
pnpm i >& /dev/null
if pnpm tsc --outDir src ; then
    echo '✅ Passed with TypeScript <5.5'
else
    echo '❌ Failed with TypeScript <5.5"'
    exit 1
fi

rm package.json
ln -s package.ts5_5.json package.json
pnpm i >& /dev/null
if (pnpm tsc --outDir src || true) | grep 'error TS7017' > /dev/null ; then
    echo '✅ Failed with TypeScript >=5.5'
else
    echo '❌ Passed with TypeScript >=5.5'
    exit 1
fi
