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
opencrabs crab search watch --index ./index.toml   # local checkout
```

This repo is **public** — the default raw-URL index works unauthenticated:
search, inspect, and install with no clone and no credentials.

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
| last30days | On-demand opinion research, hard 30-day recency window, every claim dated and sourced |
| haggle-bot | SaaS spend audit from statements you hand it; draft-only cancellation scripts |
| nightly-audit | Nightly git-hygiene audit over active repos (dirty/unpushed/behind); failures only, silence = all clear |
| site-canary | Daily uptime canary for a URL watchlist; tattles only on failures or slow responses |
| repo-pulse | Daily GitHub pulse over watched repos: new issues/PRs/releases, red CI; speaks only when eyes are needed |
| standup-crab | Daily 8am standup draft: last-24h commits plus the in-flight ledger as Shipped / In flight / Blockers |
| changelog-scribe | Weekly release-note drafts from commits since the last tag; drafts only, you publish |
| critiquito | On-demand design critique of a screenshot or URL: hierarchy, contrast, type, motion, ranked fixes |
| security-audit | Language-agnostic security and CVE audit of a repo, scored 0-100, findings ranked by severity |
| read-book | Extract structured notes from a book: PDF, EPUB, MOBI, markdown, or pasted text |
| watch-video | Extract content from a video: transcript, summary, chaptered notes |
| unstuck | Structured escape hatch when a solution seems blocked: reframes the wall, generates exit paths |
| maker-council | Simulated personal board of advisors: multiple expert perspectives on a founder/operator question |
