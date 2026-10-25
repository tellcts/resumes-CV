#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
template_dir="$(cd -- "$script_dir/.." && pwd)"

docker run --rm \
  -v "$template_dir:/workdir" \
  -w /workdir \
  ghcr.io/tellcts/texlive:latest \
  latexmk main.tex