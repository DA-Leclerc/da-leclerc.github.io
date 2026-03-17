---
title: "Construire une compétence d'agent IA : Automatiser la recherche YouTube avec OpenClaw"
date: 2026-03-10T20:00:00-05:00
summary: "Comment j'ai construit un pipeline hybride de transcription YouTube comme compétence d'agent OpenClaw, combinant yt-dlp, Whisper et l'automatisation cron pour transformer le contenu vidéo en intelligence actionnable."
description: "Un parcours de la construction d'une compétence d'agent OpenClaw qui automatise l'extraction de transcriptions YouTube en utilisant yt-dlp et Whisper, avec traitement par lots nocturne et livraison Telegram."
tags: ["IA", "OpenClaw", "Automatisation", "Python", "Open Source"]
categories: ["Projets"]
author: "Dominic-André Leclerc"
showToc: false
TocOpen: false
draft: false
hidemeta: false
comments: false
---

## Le problème

Si tu travailles en gouvernance IA ou dans n'importe quel domaine qui bouge vite, tu connais la pile. Les abonnements YouTube qui s'accumulent avec des conférences, des briefings, des entrevues d'experts. Chacun pourrait contenir un insight critique. Mais les regarder tous? Pas le temps.

J'avais besoin d'un système qui extrait les transcriptions, les passe à un agent IA pour analyse, et livre des résumés sur Telegram chaque matin. Rien de tel existait dans la forme que je voulais. Alors j'ai arrêté d'en rêver et je l'ai construit.

## Pourquoi yt-dlp et Whisper

Le pipeline commence avec [yt-dlp](https://github.com/yt-dlp/yt-dlp), le meilleur outil open source pour extraire du contenu YouTube. Si une vidéo a des sous-titres existants, yt-dlp les récupère directement. Rapide et propre.

Quand les sous-titres n'existent pas (ce qui arrive souvent, surtout pour le contenu de niche, les live, les vidéos francophones), le pipeline se rabat sur Whisper d'OpenAI qui roule localement. Pas d'appels API, pas de services de transcription tiers. Tout reste sur mon propre hardware. Whisper gère bien l'anglais et le français, ce qui est important quand tu suis du contenu bilingue.

Le pipeline a quatre composantes :

- **grab_transcript.sh** gère une seule vidéo : vérifie les sous-titres, bascule à Whisper, produit du texte propre
- **run_batch.sh** traite des chaînes entières ou des playlists selon une schedule
- **skill/youtube.py** est l'interface que les agents IA utilisent pour demander et traiter les transcriptions
- **skill/youtube.yaml** définit quand et comment la compétence s'exécute

## L'automatisation

Extraire des transcriptions, c'est la partie facile. Ce qui se passe après, c'est là que ça devient intéressant.

Le système cron d'OpenClaw roule des jobs chaque nuit qui récupèrent les nouvelles vidéos des chaînes qu'on suit (politique IA, gouvernance, droit technologique), extraient les transcriptions via le pipeline hybride, les passent à un agent pour résumé et extraction de points clés, puis livrent les rapports formatés via Telegram.

Je me réveille chaque matin avec un digest du contenu vidéo le plus pertinent de la veille. Pas besoin de regarder quoi que ce soit. L'agent signale ce qui demande mon attention directe, et je peux creuser dans la transcription complète quand quelque chose m'intéresse. Pour quelqu'un qui conseille en gouvernance IA, c'est du gold.

## Leçons apprises

**Bash d'abord, Python après.** J'ai écrit le pipeline en shell scripts, je l'ai poussé vraiment, puis j'ai encapsulé ça dans Python. Débogage plus facile. Les composants restent utiles indépendamment.

**Whisper c'est puissant mais ça consomme.** Rouler Whisper localement te donne la privacy et tu paies pas d'API. Mais tu as besoin de hardware décent. Pour les traitements nocturnes, je les schedule pendant les creux pour pas bloquer d'autres jobs.

**Le 80/20 des sous-titres.** Environ 85% des vidéos ont des sous-titres via YouTube. Les 15% restants? C'est souvent le meilleur contenu. Les conférences spécialisées, les tables rondes sans sous-titrage pro.

**Bilinguisme obligatoire au Canada.** Travailler en anglais et français en gouvernance IA au Québec, c'est pas optionnel. Whisper supporte les deux, donc pas besoin de pipelines séparés par langue.

## Pourquoi c'est important

C'est pas juste un exercice technique. C'est un exemple d'automatisation IA responsable.

La compétence respecte les conditions des plateformes en utilisant les API officielles avant de basculer au traitement audio. Elle garde les données locales avec Whisper au lieu d'envoyer l'audio à des tiers. Elle est open source pour qu'on puisse auditer ce qu'elle fait. Et elle résout un vrai problème au lieu d'être de l'IA pour le fun.

C'est exactement les principes que je pousse quand j'aide des organisations à adopter l'IA : partir d'un besoin réel, choisir l'approche technique la moins invasive, être transparent sur ce qui se passe, garder les humains dans la boucle pour les décisions qui comptent.

## Essaie-le

C'est open source : [DA-Leclerc/openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill)

Fork-le, casse-le, fais-en ce que tu veux.
