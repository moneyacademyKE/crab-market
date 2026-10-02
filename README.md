# Crab Market

A directory of **crabs** — portable skill packs for OpenCrabs. Read over plain
GitHub raw; no server, no API, no auth.

## Install

Crabs live in subdirs of this repo; the `#crabs/<name>` fragment targets one:

```
opencrabs crab inspect https://github.com/moneyacademyKE/crab-market#crabs/competitor-watch
opencrabs crab install https://github.com/moneyacademyKE/crab-market#crabs/competitor-watch --yes
opencrabs crab list
opencrabs crab updates        # drift check — report-only, never applies
opencrabs crab remove competitor-watch
```

Search the index:

```
opencrabs crab search watch                        # default index (raw GitHub URL)
opencrabs crab search watch --index ./index.toml   # local checkout / private market
```

While this repo is **private**, the default raw-URL fetch can't authenticate:
search with `--index` against a local checkout (git clone works with your
credentials; raw HTTPS doesn't). Flipping the repo public is one command and
needs zero code change — the default index URL starts working as-is.

Inspect first, always: the report shows files, frontmatter, blast radius
(elevated tools the skills reference), and a secret scan. Installs refuse
credential-shaped payloads (exit 3) and upstream drift (exit 4) until
re-inspected with `--force`.

## Format

```
index.toml                     # the registry: name, version, description, category, repo, pin
crabs/<name>/
├── crab.toml                  # the manifest — the allowlist of what installs
└── skills/<name>/SKILL.md     # one or more skill dirs
```

The manifest is the contract — exactly the declared skill dirs are installed,
nothing else:

```toml
name = "competitor-watch"
version = "0.1.0"
description = "Daily page-diff over watched URLs; reports only what changed"
category = "monitor"

[[skills]]
path = "skills/competitor-watch"
```

## Crabs

| Name | What it does |
|---|---|
| competitor-watch | Daily page-diff over a watched-URL list; reports only changes |
| morning-newspaper | Daily morning digest over an RSS/YouTube source list; only what's new since the last edition |
| nightly-audit | Nightly git-hygiene audit over active repos (dirty/unpushed/behind); failures only, silence = all clear |
