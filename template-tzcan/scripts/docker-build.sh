#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
template_dir="$(cd -- "$script_dir/.." && pwd)"

if [[ ! -f "$template_dir/main.tex" ]]; then
  echo "Cannot find main.tex under template root: $template_dir" >&2
  exit 1
fi

docker run --rm \
  -v "$template_dir:/workdir" \
  -w /workdir \
  ghcr.io/tellcts/texlive:latest \
  latexmk main.tex
