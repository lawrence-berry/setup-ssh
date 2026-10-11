#!/bin/sh
# Adds an Include of this repo's config to your ~/.ssh/config. Safe to re-run.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
line="Include $dir/config"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
rc="$HOME/.ssh/config"
touch "$rc" && chmod 600 "$rc"
# These are Host * defaults; ssh uses the first value per option, so append
# them (your own ~/.ssh/config entries still win).
grep -qxF "$line" "$rc" || printf '\n%s\n' "$line" >> "$rc"
echo "set up: $rc includes $dir/config"
