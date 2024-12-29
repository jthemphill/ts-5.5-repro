#! /bin/bash

set -euo pipefail

# This test verifies that TypeScript <5.5 passes and TypeScript >=5.5 fails.

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

rm package.json
ln -s ./package.json.ts5_4 ./package.json
pnpm i >& /dev/null
if ./run_bazel.sh ; then
    echo '✅ Passed with TypeScript <5.5'
else
    echo '❌ Failed with TypeScript <5.5"'
    exit 1
fi

rm package.json
ln -s ./package.json.ts5_5 ./package.json
pnpm i >& /dev/null
if ./run_bazel.sh ; then
    echo '❌ Passed with TypeScript >=5.5'
    exit 1
else
    echo '✅ Failed with TypeScript >=5.5'
fi
