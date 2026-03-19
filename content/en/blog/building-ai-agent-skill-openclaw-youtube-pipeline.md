---
title: "Building an AI Agent Skill: Automating YouTube Research with OpenClaw"
date: 2026-03-10T20:00:00-05:00
summary: "How I built a hybrid YouTube transcript pipeline as an OpenClaw agent skill, combining yt-dlp, Whisper, and cron automation to turn video content into actionable intelligence."
description: "A walkthrough of building an OpenClaw AI agent skill that automates YouTube transcript extraction using yt-dlp and Whisper, with nightly batch processing and Telegram delivery."
tags: ["AI", "OpenClaw", "Automation", "Python", "Open Source"]
categories: ["Projects"]
author: "Dominic-André Leclerc"
showToc: false
TocOpen: false
draft: false
hidemeta: false
comments: false
cover:
  image: "/images/building-ai-agent-skill-openclaw-cover.jpg"
  alt: "A person building a robot claw in a workshop that automates YouTube research"
  hidden: false
---

## The Problem

If you work in AI governance, you know the feeling. Your YouTube subscriptions are full of relevant content: conference talks, expert interviews, policy discussions. But who has time to watch 47 minutes of a panel discussion to extract the three points that actually matter?

I built a solution using OpenClaw, the multi-agent AI system I run locally. The YouTube transcript pipeline is now one of its agent skills, and it runs every night while I sleep.

## What OpenClaw Is

OpenClaw is a six-agent AI ecosystem I built on local infrastructure, where each agent has specific skills and responsibilities. The agents communicate through a shared task queue and can call on each other's skills. The YouTube pipeline became a natural addition: a skill that any agent can use when video intelligence is needed.

Running it on my own hardware matters for data privacy and cost control.

## How the Pipeline Works

The transcript extraction pipeline has two paths.

**Path 1: Caption-based extraction.** Most YouTube videos have auto-generated or manually uploaded captions. The pipeline uses yt-dlp to check for available captions and downloads them directly. This is fast, free, and accurate for videos that have good captions.

**Path 2: Whisper fallback.** When captions aren't available or are poor quality, the pipeline downloads the audio and runs it through OpenAI's Whisper model locally. This is slower but handles podcasts, interviews, and videos in multiple languages.

The pipeline automatically detects which path to use, processes the content, and outputs clean, formatted text ready for AI analysis.

## The Stack

The technical setup is straightforward: yt-dlp downloads videos and extracts captions, Whisper runs locally on my hardware with no API costs and no data leaving my network, Python scripts handle the pipeline logic that checks for captions and falls back to Whisper, run_batch.sh processes entire channels or playlists on a schedule, skill/youtube.py provides the OpenClaw skill interface that agents use to request and process transcripts, and skill/youtube.yaml configures when and how the skill runs.

## The Automation Layer

The real power isn't in grabbing transcripts. It's in what happens next. With OpenClaw's cron system, nightly jobs pull new videos from a curated list of channels focused on AI policy, governance, and technology law, extract transcripts using the hybrid pipeline, pass them to an AI agent for summarization and key-point extraction, and deliver formatted reports via Telegram.

I wake up every morning with a digest of yesterday's most relevant AI content, already summarized and ready to reference. For someone building expertise in AI governance consulting, this is worth every minute I spent building it.

## Lessons Learned

Start with the shell and then wrap. I built the core pipeline as bash and Python scripts first, then wrapped it as an OpenClaw skill. This made debugging much easier and let me test each component independently.

Whisper is surprisingly good locally. Running it on a decent GPU gives results comparable to the API with zero cost per transcription, and for batch processing the speed is acceptable.

Curation matters more than volume. I started by indexing every AI-related channel I could find, but the signal-to-noise ratio was terrible. Now I maintain a curated list of about 20 channels that consistently produce content worth reading. Less input, better output.

The skill abstraction pays off. By building this as an OpenClaw skill rather than a standalone script, any agent in the system can request YouTube intelligence. The research agent uses it to prepare briefings, the content agent uses it to find reference material, and the same pipeline serves multiple purposes.

## What's Next

I'm working on adding speaker identification to the pipeline so I can track which experts are saying what across different videos, and building a searchable archive of processed transcripts. The goal is a personal AI governance knowledge base that grows automatically.
