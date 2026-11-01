#!/usr/bin/env bash
set -euo pipefail

if (( $# > 1 )); then
  echo "Usage: $0 [file.tex]" >&2
  echo "一次只能编译一个 TeX 文件。" >&2
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
template_dir="$(cd -- "$script_dir/.." && pwd)"
tex_file="${1:-}"

if [[ -z "$tex_file" ]]; then
  tex_file="$template_dir/main.tex"
elif [[ ! -f "$tex_file" && "$tex_file" != /* ]]; then
  tex_file="$template_dir/$tex_file"
fi

if [[ ! -f "$tex_file" ]]; then
  echo "找不到 TeX 文件：$tex_file" >&2
  exit 1
fi

tex_dir="$(cd -- "$(dirname -- "$tex_file")" && pwd)"
tex_path="$tex_dir/$(basename -- "$tex_file")"

case "$tex_path" in
  "$template_dir"/*) ;;
  *)
    echo "TeX 文件必须位于模板目录内：$template_dir" >&2
    exit 1
    ;;
esac

if [[ "$tex_path" != *.tex ]]; then
  echo "目标文件必须是 .tex 文件：$tex_file" >&2
  exit 1
fi

docker_tex_file="${tex_path#"$template_dir"/}"

docker run --rm \
  -v "$template_dir:/workdir" \
  -w /workdir \
  ghcr.io/tellcts/texlive:latest \
  latexmk "$docker_tex_file"
