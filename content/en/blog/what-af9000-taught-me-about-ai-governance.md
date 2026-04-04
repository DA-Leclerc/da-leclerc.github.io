---
title: "What AF9000+ Taught Me About AI Governance"
date: 2026-03-11T08:00:00-05:00
summary: "Military quality auditing and AI governance look unrelated until you examine the underlying discipline. The overlap is almost total, and it exposes what most organizations are getting wrong about both."
description: "How the AF9000+ military quality management system principles apply directly to AI governance and responsible adoption."
tags: ["AI Governance", "Military", "AF9000+", "Quality"]
categories: ["AI Governance"]
author: "Dominic-André Leclerc"
showToc: false
TocOpen: false
draft: false
hidemeta: false
comments: false
cover:
  image: "/images/what-af9000-taught-me-cover.jpg"
  alt: "Military quality inspector applying systematic audit approach to AI systems"
  hidden: false
---

When people find out I spent twenty-one years in the Canadian Armed Forces doing avionics maintenance and quality auditing, and that I now work in AI governance consulting, there is usually a pause while they look for the connection. The connection is not subtle once you see it, but it does require knowing what AF9000+ actually is, because the overlap between military quality management and responsible AI adoption is almost total at the level of underlying discipline.

## What AF9000+ Actually Is

AF9000+ is the Canadian Armed Forces' quality management system, a defence-adapted version of ISO 9001 that governs everything from component inspection to documentation standards to audit procedures across the fleet. Every piece of equipment I worked on, from CF-188 Hornet avionics to electronic warfare systems, was maintained under AF9000+ protocols, and nothing ever got signed off without evidence behind the signature. No process ran without documentation. No deviation went unrecorded. That combination (traceable evidence, documented process, and recorded deviation) is the spine of the system, and it works because every person inside it understands that the spine is non-negotiable.

## Where the Parallels Start

The first parallel is documented process. In AF9000+, every maintenance task has a technical order attached to it that specifies exactly what is done, by whom, in what sequence, and against what acceptance criteria. In AI governance, every model deployment should have the equivalent: a document that specifies what data the model uses, what it does with that data, who approved its release into production, and how its behaviour is being monitored. Most organizations deploying AI today have none of this, and when something goes wrong there is no artifact anyone can point to that establishes what was supposed to happen.

The second parallel is the audit trail. Military quality systems track everything because the alternative (trusting memory and goodwill) fails the first time conditions change or personnel turn over. AI systems need the same traceability at the level of who modified a model, when, why, and with what approval, because model drift and data drift are invisible until they aren't, and reconstructing what happened after the fact is nearly impossible without the record. Risk classification is the third parallel, and it's the one organizations most often get intuitively wrong: not every component in an aircraft gets the same level of scrutiny, because critical systems get more oversight and routine parts get less, and AI applications should be classified the same way. A chatbot answering FAQ questions does not need the governance envelope of a model scoring job applicants, and treating both at the same level of rigour produces either security theatre around the chatbot or dangerous under-governance of the hiring model.

Regular audits are the fourth parallel. AF9000+ requires scheduled audits rather than reactive ones, which sounds obvious until you notice that most AI governance in the wild is triggered by incidents rather than calendars. Serious systems are audited on a cadence regardless of whether anything appears to be wrong, because catching drift early is dramatically cheaper than catching it after a customer complaint. And the fifth parallel is training and competency: in an AF9000+ environment nobody is allowed to touch an aircraft system without documented training on that specific system, and the documentation exists because institutional memory is not reliable enough to trust with safety-critical work. Organizations deploying AI need the same discipline around the humans operating and overseeing the systems, because an AI tool handled by an untrained user is the source of most of the failures I see in the field.

## What Most Organizations Get Wrong

The common mistake is treating AI governance as a one-time project: write a policy, circulate it for signatures, file the PDF, move on to the next initiative. That is not how quality management works in any serious industry, and it is not how AI governance works either. AF9000+ taught me that governance is a continuous operating rhythm, built into the daily texture of how work gets done, not a compliance artifact layered on top of an existing process at the end of a quarter. The organizations that will get AI governance right are the ones that are building it into the workflow itself, and the ones that produce a governance document and file it away are the ones that will end up reconstructing everything under deadline pressure after their first serious incident.

The interesting question isn't whether the principles from military quality management transfer to AI. They do. The question is how long organizations will keep trying to build AI governance without the operational discipline that makes any quality system actually function, and what the cost of that lag will look like when the first high-profile enforcement action lands on a Canadian company that can't produce an audit trail.
