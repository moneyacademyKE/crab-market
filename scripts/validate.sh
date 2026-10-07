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

# 3. Content scan: no credentials, no machine-specific absolute paths.
#    The registry is public — this gate runs on every push, over every
#    tracked AND untracked file (--untracked; .gitignore still excluded, so
#    workspace junk can't false-positive, but not-yet-committed packs can't
#    sneak past locally the way pstack nearly did).
#    /Users/ is the portability guard that would have caught the hardcoded
#    home paths found in the Oct-2026 audit.
scan_re='sk-[A-Za-z0-9_-]{20,}|sk-proj-[A-Za-z0-9_-]{20,}|AKIA[0-9A-Z]{16}|gh[pousr]_[A-Za-z0-9]{36}|github_pat_[A-Za-z0-9_]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|AIza[0-9A-Za-z_-]{35}|-----BEGIN (RSA |EC |OPENSSH |DSA |PGP )?PRIVATE KEY|/Users/[a-zA-Z0-9_-]+'
scan_hits=$(git grep -nE --untracked "$scan_re" -- . 2>/dev/null)
if [ -n "$scan_hits" ]; then
  echo "FAIL: secret/portability scan hits:"
  echo "$scan_hits"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  n=$(grep -c '^\[\[crabs\]\]' index.toml)
  echo "OK: $n crabs, index and packs coherent, content scan clean"
fi
exit $fail
