#!/bin/sh
# validate.sh — registry coherence check for crab-market.
# Fails (exit 1) if: index entry points at a missing/incomplete pack,
# a pack dir is missing from the index, or a crab.toml lacks required fields.
set -u
fail=0

[ -f index.toml ] || { echo "FAIL: index.toml missing"; exit 1; }

# 1. Every index entry resolves to a complete pack.
for p in $(sed -n 's/^path = "\(.*\)"$/\1/p' index.toml); do
  if [ ! -f "$p/crab.toml" ]; then
    echo "FAIL: index path $p has no crab.toml"; fail=1; continue
  fi
  for field in name version description; do
    grep -q "^$field = " "$p/crab.toml" || { echo "FAIL: $p/crab.toml missing '$field'"; fail=1; }
  done
  ls "$p"/skills/*/SKILL.md >/dev/null 2>&1 || { echo "FAIL: $p has no skills/*/SKILL.md"; fail=1; }
done

# 2. Every pack dir is listed in the index.
for d in crabs/*/; do
  name=$(basename "$d")
  grep -q "path = \"crabs/$name\"" index.toml || { echo "FAIL: $name not in index.toml"; fail=1; }
done

if [ "$fail" -eq 0 ]; then
  n=$(grep -c '^\[\[crabs\]\]' index.toml)
  echo "OK: $n crabs, index and packs coherent"
fi
exit $fail
