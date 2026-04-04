---
title: "I Run a Team of AI Agents From a Mini-PC in My Living Room"
date: 2026-03-10T20:00:00-05:00
summary: "Five autonomous AI agents, one mini-PC, zero employees. How a retired military technician built an always-on AI operation using OpenClaw, shell scripts, and 21 years of systems thinking."
description: "How I built a multi-agent AI system on a mini-PC using OpenClaw, combining cron automation, local LLMs, and military-grade procedures to run an autonomous operation."
tags: ["AI", "OpenClaw", "Automation", "Agents", "Open Source"]
categories: ["Projects"]
author: "Dominic-André Leclerc"
showToc: false
TocOpen: false
draft: false
hidemeta: false
comments: false
cover:
  image: "/images/building-ai-agent-skill-openclaw-cover.jpg"
  alt: "A mini-PC running an autonomous AI agent operation"
  hidden: false
---

There's a small box on my desk, an EliteMini mini-PC with a Ryzen 9 and 32 gigs of RAM. It runs Ubuntu, and it runs my entire AI operation around the clock.

The platform is called OpenClaw, an open-source multi-agent system that lets you build AI agents, assign them personalities and instructions, connect them to messaging apps like Telegram and WhatsApp, and let them work on their own. You talk to them like you'd talk to an employee. They have memory, they have tools, and they have jobs.

I'm a retired Canadian Forces Warrant Officer with 21 years in military aviation as an avionics technician and quality management auditor. I spent my career making sure complex systems worked as designed, and figuring out why they didn't when they failed. Now I'm applying that same mindset to AI.

## The team

Tom is my CEO agent. He runs on Telegram, and every morning at 7:30 he delivers a briefing: weather in Saguenay, geopolitical news affecting markets, and an Alan Watts quote to start the day. When I need something researched, I tell Tom and he delegates to whoever is best suited for the task.

James is my investment researcher. He monitors YouTube channels I follow for investing (InvestAnswers, Jordi Visser, Peter Diamandis, Anthony Pompliano), using a batch script that grabs the latest transcripts overnight. James reads them, pulls out the investment signals, and delivers a structured briefing to my Telegram before I wake up. Everything gets archived to Notion for future reference.

Blue is my wife's personal assistant, with her own Telegram bot, her own personality, and her own voice. When my wife needs something, she messages Blue directly. Jarv handles the same role for the whole family through WhatsApp.

Scout is the newest addition: a business development agent that scans for local opportunities in my region and delivers a report twice a week. Potential clients, companies that could benefit from AI consulting, relevant tenders. He's the business development arm that never clocks out.

All five agents run on the same mini-PC, all using Qwen 3 235B through Venice.ai for privacy. The total operating cost is a Venice subscription and electricity.

## How it actually works

Each agent has a SOUL.md file, which functions as both its personality definition and its operating manual. The file tells the agent who it is, how it communicates, what tools it has access to, and what rules it follows. Tom's SOUL.md defines him as a CEO who delegates through specific sub-agent commands (not by sending Telegram messages to other agents). James's defines him as a precision research instrument that delivers findings with sources and confidence levels. Blue's shapes her voice and interaction style for conversations with my wife.

Beyond the soul files, each agent maintains memory files, tool configurations, and standing orders. These aren't suggestions or guidelines; they're hard rules that determine how the agent operates.

The infrastructure layer is where the real reliability comes from. Cron jobs and shell scripts handle scheduling and data pre-fetching: a script pulls all the raw data Tom needs before his morning briefing so he doesn't waste processing time on API calls mid-conversation. A watchdog process resets session files every 15 minutes to prevent agents from drowning in their own conversation history. A nightly backup pushes the entire system to GitHub.

None of this is glamorous. It works because it's boring.

## What I learned

AI agents are not magic. They're employees who take everything literally and will confidently report that they've completed a task they never actually started. The fix is the same approach I used for 21 years in military aviation: clear procedures, explicit instructions, and verification at every step.

You don't tell an agent "you can search the web." You specify the exact tool name, the exact syntax for calling it, and what the agent should do when the call fails. You don't trust an agent to orchestrate five API calls under time pressure. You build a shell script that does the fetching, and you hand the agent a clean data package to reason about.

The pattern that makes everything reliable is simple: build solid infrastructure around the agent, let the AI handle what it's genuinely good at (reasoning, writing, formatting), and keep it away from what it's bad at (multi-step tool orchestration with tight timeouts). Reliability beats brilliance, every time. I'd rather have a B+ briefing delivered at 4:30 AM every single morning than an A+ briefing that fails 40% of the time.

## Why this matters

I built all of this in about two weeks, working alone, with no formal coding background. I'm not a developer. I'm a retired military technician who knows how to make systems work and who uses AI tools to fill the gaps in his technical knowledge.

Every conversation I had with Claude about architecture, debugging, or deployment strategy was a conversation I didn't need to pay a consultant for. Every agent I configured is a recurring task that now runs without me. Scout finds business opportunities while I train jiu-jitsu. James reads investment content while I sleep. Tom manages the whole operation and reports back when something needs my attention.

This is what practical AI adoption actually looks like for a one-person operation: not replacing humans, but multiplying what a single person can accomplish in a day. I'm building a consulting business called Nord Paradigm around this exact approach, and the infrastructure I run for myself doubles as my product demo. When a potential client asks what I can do for their business, I open my Telegram and show them.

Five agents, one mini-PC, zero employees.
