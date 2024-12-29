#! /bin/bash

set -euo pipefail

# This shell script runs tsc the way Bazel invokes it within our repo.

pnpm install
pnpm tsc --outDir src
