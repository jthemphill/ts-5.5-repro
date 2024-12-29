#! /bin/bash

set -euo pipefail

# This shell script runs tsc the way Bazel invokes it within our repo.

pnpm i
pnpm tsc --project tsconfig_bazel.json --outDir src
