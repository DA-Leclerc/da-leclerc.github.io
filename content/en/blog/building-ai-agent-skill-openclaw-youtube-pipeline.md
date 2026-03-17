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
---

## The Problem

If you work in AI governance or any field that moves this fast, you know the pile. YouTube subscriptions full of conference talks, policy briefings, expert interviews. Each one might contain something critical. But watching them all? Not happening.

I needed a system that could pull transcripts from videos, summarize the key points, and hand me a clean report every morning. Nothing like that existed in the form I wanted. So I built it.

## Why yt-dlp and Whisper

The pipeline starts with [yt-dlp](https://github.com/yt-dlp/yt-dlp), the best open-source tool for pulling content from YouTube. If a video has existing captions, yt-dlp grabs them directly. Fast and clean.

When captions don't exist (which is often), the pipeline falls back to OpenAI's Whisper running locally. No API calls, no third-party transcription services. Everything stays on my own hardware. Whisper handles both English and French, which matters when you're tracking bilingual content.

The pipeline has four components:

- **grab_transcript.sh** handles a single video: checks for captions, falls back to Whisper, outputs clean text
- **run_batch.sh** processes entire channels or playlists on a schedule
- **skill/youtube.py** is the OpenClaw skill interface that agents use to request and process transcripts
- **skill/youtube.yaml** defines when and how the skill runs

## The Automation Layer

Grabbing transcripts is the easy part. What happens next is where it gets interesting.

OpenClaw's cron system runs nightly jobs that pull new videos from a curated channel list (AI policy, governance, technology law), extract transcripts through the hybrid pipeline, pass them to an AI agent for summarization and key-point extraction, then deliver formatted reports via Telegram.

I wake up every morning with a digest of yesterday's most relevant video content. No watching required. The agent flags anything that needs my direct attention, and I can dig into the full transcript when something catches my eye.

## Building It as a Skill

OpenClaw uses a skill-based architecture. Each skill is a self-contained module with its own configuration, entry points, and scheduling rules. Building the YouTube pipeline as a skill meant any agent in the system could request a transcript on demand, the pipeline could run on its own schedule without manual triggers, configuration lives in a single YAML file, and adding new channels or playlists takes one line.

The YAML config keeps things clean. I define the channels I want to monitor, the schedule for batch processing, output formats, and which agents get notified when new transcripts are ready.

## Why This Approach Matters

I talk a lot about responsible AI adoption. This project is a concrete example of what that looks like at the individual level.

The pipeline runs locally, keeping data on my own infrastructure rather than sending audio to third-party APIs. It's transparent and open-source, so anyone can audit what it does and how. And it solves a real workflow problem rather than being AI for the sake of AI.

Those are exactly the principles I push when helping organizations adopt AI. Start with a genuine need. Choose the least invasive technical approach. Be transparent about what the system does. Keep humans in the loop for decisions that matter.

## Try It

The project is open source on GitHub: [DA-Leclerc/openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill)

Fork it, break it, make it yours.
