#!/usr/bin/env bash
# Bump Formula/twg.rb to the version the official installer currently ships.
set -euo pipefail

base=https://teamwork-graph.atlassian.com/cli
formula="$(dirname "$0")/Formula/twg.rb"

version=$(curl -fsSL "$base/install" | sed -n 's/^DEFAULT_VERSION="\([^"]*\)".*/\1/p')
[ -n "$version" ] || { echo "could not read DEFAULT_VERSION from $base/install" >&2; exit 1; }
if grep -q "version \"$version\"" "$formula"; then
  echo "already at $version"
  exit 0
fi

sums=$(mktemp)
trap 'rm -f "$sums" "$formula.new"' EXIT
curl -fsSL "$base/SHA256SUMS-v$version" -o "$sums"

awk -v v="$version" '
  NR == FNR     { sha[$2] = $1; next }
  /^  version "/ { print "  version \"" v "\""; next }
  /url ".*twg-/  { match($0, /twg-[a-z0-9]+-[a-z0-9]+-v/); key = substr($0, RSTART, RLENGTH) v
                   if (!(key in sha)) { print "no checksum for " key > "/dev/stderr"; exit 1 }
                   print; next }
  key && /sha256 "/ { sub(/"[0-9a-f]*"/, "\"" sha[key] "\""); key = "" }
  { print }
' "$sums" "$formula" > "$formula.new"
mv "$formula.new" "$formula"
echo "bumped to $version"
