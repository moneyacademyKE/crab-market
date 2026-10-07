# pstack (crab port)

> "if you want to go fast, go deep first. pstack helps you write less, but higher quality code."

A faithful port of **Cursor's pstack** plugin (v0.15.15) to the OpenCrabs crab format.

**Upstream:** [cursor/plugins @ d0ef80d](https://github.com/cursor/plugins/tree/d0ef80d86795816da932a153458c5dbe192d294e/pstack)
**Author:** Lauren Tan · **License:** MIT (see LICENSE, vendored verbatim)

## What's inside

50 skills, all prompt-only markdown with YAML frontmatter (the same format OpenCrabs skills use natively):

- **Workflows**: architect, arena, automate-me, blast-radius, correct, figure-it-out, how, interrogate, recall, reflect, show-me-your-work, swarm, tdd, teach, technical-writing, unslop, why, and more
- **poteto-mode**: 20+ playbooks for long autonomous runs (autopilot, bug-fix, feature, refactoring, shipping, orchestration)
- **principle-\***: 20 one-shot engineering principles (subtract-before-you-add, prove-it-works, fix-root-causes, guard-the-context-window, ...)

## Port notes (what changed from upstream)

- **Skipped `setup-pstack`**: Cursor-plugin installer, meaningless outside Cursor.
- **Skipped Bun/TS machinery** (`poteto-mode/scripts/orch`, `watch-pr`, `bootstrap.ts`): these drive Cursor's agent runtime. The markdown playbooks that reference them remain and are the valuable part.
- **Kept** the two portable bash scripts: `show-me-your-work/scripts/log.sh` (TSV decision log writer with formula-injection defense) and `poteto-mode/scripts/worktree-audit.sh` (read-only worktree prune audit; its chat-transcript column reads `~/.cursor/projects` and silently degrades elsewhere).
- **One known-stale reference**: `poteto-help/SKILL.md` links Cursor's skills docs and mentions `subagent_type: "poteto-agent"`. Kept verbatim for provenance; the link is Cursor-specific.
- Frontmatter is untouched. `disable-model-invocation: true` keys are inert under OpenCrabs.

## Install

```
opencrabs crab install https://github.com/moneyacademyKE/crab-market#crabs/pstack
```

Heads up: this installs **50 skills** into your skills directory. That is the pack's design (a full stack), and the skills index will grow accordingly. `opencrabs crab remove pstack` deletes exactly what it installed.

## License

MIT, Lauren Tan and contributors. See LICENSE.
