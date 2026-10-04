---
name: read-book
description: Structured notes from books and long documents - PDF, EPUB, markdown, txt, pasted text, or URL to public-domain text. Per-chapter TL;DR, key concepts, quotes with locators, action items. Modes- notes, summary, quotes, study. Invoke as /read-book <file|url> [mode].
---
# read-book

No state, no schedule. Invoke: `/read-book <file|url> [mode]`.

## Modes

| Invocation | What you get |
|---|---|
| `/read-book <input>` | **notes** (default): chapter-by-chapter TL;DR + key concepts + quotes + action items |
| `... summary` | Whole-book TL;DR (1 paragraph) + 3-5 takeaways + who it is for |
| `... quotes` | Pull-quote highlights only, with chapter and page refs |
| `... study` | Notes + 10-20 spaced-repetition Q&A cards |

## Run

1. **Parse input**: PDF and text formats read directly (PDF in page chunks); EPUB/MOBI via `pandoc` or `ebook-convert` if installed; URLs only for public-domain text (Project Gutenberg, archive.org). Ambiguous type: ask once.
2. **Chunk**: by chapter when a TOC exists, else 50-page blocks for PDFs, else ~30k-char blocks for plain text. State the chunking plan before starting.
3. **Extract per chunk**: TL;DR, key concepts, quotes with locators (chapter/page), action items. Never paraphrase a quote into a paraphrase and keep the locator.
4. **Assemble** into one .md file and ship it to the topic. Books over 200 pages: warn first that it takes many passes, then process in parts and deliver incrementally.

## Rules

- Cite locators for every quote. An uncited quote is a fabrication risk, not a quote.
- Long book + unspecified mode: default to notes but say the cost up front.
- If the source cannot be read (scanned PDF without text layer, dead URL, DRM), say so plainly. Never invent content to fill the gap.
