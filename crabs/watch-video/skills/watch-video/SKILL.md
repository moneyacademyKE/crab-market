---
name: watch-video
description: Extract content from video - YouTube, Loom, Vimeo, Zoom recordings, local MP4/MOV/WebM, anything yt-dlp supports. Depth modes- transcript (default), visual (frames + vision pass), multimodal (native video model). Invoke as /watch-video <url|path> [depth].
---
# watch-video

No state, no schedule. Invoke: `/watch-video <url|path> [depth]`.

## Depth modes

| Invocation | What you get |
|---|---|
| `/watch-video <input>` | **transcript** (default): clean text + metadata + chapters |
| `... visual` | Transcript + ffmpeg frame extraction + vision pass on key moments |
| `... multimodal` | Native video to a multimodal model if configured, else dense vision frame-by-frame |

Video over 10 minutes + unspecified depth: ask before defaulting up. Visual and multimodal cost real time and tokens on long videos.

## Run

1. **Identify source**: YouTube (any URL shape), Loom, Vimeo, Riverside, X/IG/TikTok, or a local file. Ambiguous: ask once.
2. **Metadata first**: `yt-dlp --skip-download --print` for URLs, `ffprobe` for local files. Title, uploader, duration, date, chapters.
3. **Transcript**: platform captions when available (YouTube auto-subs, Loom), else local whisper if installed, else download audio and transcribe with whatever the runtime provides. State which path you used.
4. **Visual pass** (when asked): `ffmpeg -i <file> -vf fps=N frame_%03d.jpg` at 1 frame per 5-15s depending on length, then read frames with vision. Key moments get timestamps.
5. **Deliver** as one .md file in the topic: metadata, transcript (or dense summary for long videos), key moments with timestamps, action items if any.

## Rules

- Never invent transcript content. If the video cannot be fetched or transcribed, say exactly what failed and stop.
- Timestamps for any claim about what happened in the video. "He said X" without a timestamp is a guess.
- Long videos: deliver incrementally per chapter rather than one giant dump.
