---
title: "Building an AI Agent Skill: Automating YouTube Research with OpenClaw"
date: 2026-03-10T20:00:00-05:00
summary: "How I built a hybrid YouTube transcript pipeline as an OpenClaw agent skill, combining yt-dlp, Whisper, and cron automation to turn video content into actionable intelligence."
description: "A walkthrough of building an OpenClaw AI agent skill that automates YouTube transcript extraction using yt-dlp and Whisper, with nightly batch processing and Telegram delivery."
tags: ["AI", "OpenClaw", "Automation", "Python", "Open Source"]
categories: ["Projects"]
author: "Dominic-AndrÃ© Leclerc"
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
---

## The Problem: Too Much Video, Not Enough Time

If you work in AI governance (or any fast-moving field), you know the feeling. Your YouTube subscriptions pile up with conference talks, policy briefings, and expert interviews. Each one could contain a critical insight, but who has time to watch them all?

I wanted a system that could automatically pull transcripts from YouTube channels I follow, run them through an AI agent for analysis, and deliver concise summaries straight to my phone. So I built one.

## Enter OpenClaw

[OpenClaw](https://github.com/punkpeye/openclaw) is an open-source AI agent platform that lets you build modular "skills": self-contained capabilities that agents can use to accomplish tasks. Think of it as a plugin system for AI assistants, where each skill has its own logic, configuration, and can be triggered on a schedule.

What drew me to OpenClaw was its practical architecture: skills are just Python scripts with a YAML config, workspaces keep your data organized, and the built-in cron system means you can automate workflows without spinning up separate infrastructure.

## What I Built

My [openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill) is a hybrid transcript pipeline that works in two stages:

**Stage 1: Try the easy way first.** The skill uses yt-dlp to check if YouTube already has captions available for a video (either auto-generated or manually uploaded). If they exist, we grab them directly. This is fast, free, and works for the vast majority of content.

**Stage 2: Fall back to Whisper.** When captions aren't available (which happens more often than you'd expect with niche content, live recordings, or non-English videos), the skill downloads the audio and runs it through OpenAI's Whisper model for local speech-to-text transcription. Whisper handles multiple languages well, which matters when you're tracking both English and French content.

The pipeline includes:

- **grab_transcript.sh:** Handles a single video: checks for captions, falls back to Whisper, outputs clean text
- **run_batch.sh:** Processes entire channels or playlists on a schedule
- **skill/youtube.py:** The OpenClaw skill interface that agents use to request and process transcripts
- **skill/youtube.yaml:** Configuration defining when and how the skill runs

## The Automation Layer

The real power isn't in grabbing transcripts. It's in what happens next. With OpenClaw's cron system, I have nightly jobs that:

1. Pull new videos from a curated list of channels (AI policy, governance, technology law)
2. Extract transcripts using the hybrid pipeline
3. Pass them to an AI agent for summarization and key-point extraction
4. Deliver formatted reports via Telegram

This means I wake up every morning with a digest of yesterday's most relevant AI content, already summarized and ready to reference. For someone building expertise in AI governance consulting, this is worth every minute.

## Lessons Learned

**Start with the shell, then wrap it.** I built the core pipeline as bash scripts first, tested them thoroughly, then wrapped them in the Python skill interface. This made debugging much easier and kept the components independently useful.

**Whisper is impressive but resource-hungry.** Running Whisper locally gives you privacy and avoids API costs, but you need decent hardware. For the nightly batch jobs, I schedule them during off-hours so the processing doesn't compete with other work.

**The 80/20 of transcripts.** About 85% of videos have captions available through YouTube. The Whisper fallback handles the remaining 15%, but it's that 15% that often contains the most valuable niche content, the conference talks and panel discussions that don't get professional captioning.

**Multilingual matters in Canada.** Operating in both English and French isn't optional for AI governance work in Quebec and Canada. Whisper's multilingual support made this feasible without maintaining separate pipelines for each language.

## Why This Matters for AI Governance

This project isn't just a technical exercise. It's a practical example of responsible AI automation. The skill:

- **Respects platform terms** by using official caption APIs before falling back to audio processing
- **Keeps data local** with on-device Whisper transcription rather than sending audio to third-party APIs
- **Is transparent and open-source**, so anyone can audit what it does and how
- **Solves a real workflow problem** rather than being AI for AI's sake

These are exactly the principles I advocate for when helping organizations adopt AI: start with a genuine need, choose the least invasive technical approach, be transparent about what the system does, and keep humans in the loop for decisions that matter.

## Try It Yourself

The project is open source and available on GitHub: [DA-Leclerc/openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill)

Whether you're interested in AI agent platforms, YouTube automation, or just want a better way to keep up with video content in your field, feel free to fork it and make it your own.

---

*Have questions about building AI agent skills or automating research workflows? [Get in touch](/about/), I'm always happy to talk about practical AI automation.*
