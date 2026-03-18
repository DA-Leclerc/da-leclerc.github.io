---
title: "Construire une compÃ©tence d'agent IA : Automatiser la recherche YouTube avec OpenClaw"
date: 2026-03-10T20:00:00-05:00
summary: "Comment j'ai construit un pipeline hybride de transcription YouTube comme compÃ©tence d'agent OpenClaw  combinant yt-dlp, Whisper et l'automatisation cron pour transformer le contenu vidÃ©o en intelligence actionnable."
description: "Un parcours de la construction d'une compÃ©tence d'agent OpenClaw qui automatise l'extraction de transcriptions YouTube en utilisant yt-dlp et Whisper, avec traitement par lots nocturne et livraison Telegram."
tags: ["IA", "OpenClaw", "Automatisation", "Python", "Open Source"]
categories: ["Projets"]
author: "Dominic-AndrÃ© Leclerc"
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
---

## Le problÃ¨me : trop de vidÃ©os, pas assez de temps

Si vous travaillez en gouvernance de l'IA  ou dans tout domaine en Ã©volution rapide  vous connaissez ce sentiment. Vos abonnements YouTube s'accumulent avec des confÃ©rences, des briefings politiques et des entrevues d'experts. Chacun pourrait contenir un aperÃ§u clÃ©, mais qui a le temps de tout regarder ?

Je voulais un systÃ¨me capable d'extraire automatiquement les transcriptions des chaÃ®nes YouTube que je suis, de les passer Ã  un agent IA pour analyse, et de livrer des rÃ©sumÃ©s concis directement sur mon tÃ©lÃ©phone. Alors je l'ai construit.

## DÃ©couvrir OpenClaw

[OpenClaw](https://github.com/punkpeye/openclaw) est une plateforme d'agents IA open source qui permet de construire des Â« compÃ©tences Â» modulaires  des capacitÃ©s autonomes que les agents peuvent utiliser pour accomplir des tÃ¢ches. Pensez-y comme un systÃ¨me de plugins pour assistants IA, oÃ¹ chaque compÃ©tence a sa propre logique, sa configuration, et peut Ãªtre dÃ©clenchÃ©e selon un horaire.

Ce qui m'a attirÃ© vers OpenClaw, c'est son architecture pratique : les compÃ©tences sont simplement des scripts Python avec une configuration YAML, les espaces de travail gardent vos donnÃ©es organisÃ©es, et le systÃ¨me cron intÃ©grÃ© signifie que vous pouvez automatiser des flux de travail sans dÃ©ployer d'infrastructure supplÃ©mentaire.

## Ce que j'ai construit

Mon [openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill) est un pipeline hybride de transcription qui fonctionne en deux Ã©tapes :

**Ãtape 1 : Essayer la voie facile d'abord.** La compÃ©tence utilise yt-dlp pour vÃ©rifier si YouTube dispose dÃ©jÃ  de sous-titres pour une vidÃ©o  gÃ©nÃ©rÃ©s automatiquement ou tÃ©lÃ©chargÃ©s manuellement. S'ils existent, on les rÃ©cupÃ¨re directement. C'est rapide, gratuit, et Ã§a fonctionne pour la grande majoritÃ© du contenu.

**Ãtape 2 : Se rabattre sur Whisper.** Quand les sous-titres ne sont pas disponibles  ce qui arrive plus souvent qu'on ne le pense avec du contenu de niche, des enregistrements en direct ou des vidÃ©os non anglophones  la compÃ©tence tÃ©lÃ©charge l'audio et le passe Ã  travers le modÃ¨le Whisper d'OpenAI pour la transcription locale. Whisper gÃ¨re bien plusieurs langues, ce qui est important quand on suit du contenu en anglais et en franÃ§ais.

Le pipeline comprend :

- **grab_transcript.sh**  GÃ¨re une seule vidÃ©o : vÃ©rifie les sous-titres, se rabat sur Whisper, produit du texte propre
- **run_batch.sh**  Traite des chaÃ®nes entiÃ¨res ou des playlists selon un horaire
- **skill/youtube.py**  L'interface de compÃ©tence OpenClaw que les agents utilisent pour demander et traiter les transcriptions
- **skill/youtube.yaml**  Configuration dÃ©finissant quand et comment la compÃ©tence s'exÃ©cute

## La couche d'automatisation

La vraie puissance n'est pas dans l'extraction des transcriptions  c'est dans ce qui se passe ensuite. Avec le systÃ¨me cron d'OpenClaw, j'ai des tÃ¢ches nocturnes qui :

1. RÃ©cupÃ¨rent les nouvelles vidÃ©os d'une liste curatÃ©e de chaÃ®nes (politique IA, gouvernance, droit technologique)
2. Extraient les transcriptions via le pipeline hybride
3. Les passent Ã  un agent IA pour rÃ©sumÃ© et extraction de points clÃ©s
4. Livrent des rapports formatÃ©s via Telegram

Cela signifie que je me rÃ©veille chaque matin avec un digest du contenu IA le plus pertinent de la veille, dÃ©jÃ  rÃ©sumÃ© et prÃªt Ã  rÃ©fÃ©rencer. Pour quelqu'un qui dÃ©veloppe une expertise en consultation en gouvernance de l'IA, c'est inestimable.

## LeÃ§ons apprises

**Commencer avec le shell, puis l'encapsuler.** J'ai d'abord construit le pipeline principal en scripts bash, je les ai testÃ©s minutieusement, puis je les ai encapsulÃ©s dans l'interface de compÃ©tence Python. Cela a rendu le dÃ©bogage beaucoup plus facile et a gardÃ© les composants indÃ©pendamment utiles.

**Whisper est impressionnant mais gourmand en ressources.** ExÃ©cuter Whisper localement vous donne la confidentialitÃ© et Ã©vite les coÃ»ts d'API, mais vous avez besoin d'un matÃ©riel dÃ©cent. Pour les traitements par lots nocturnes, je les planifie pendant les heures creuses pour ne pas concurrencer d'autres travaux.

**Le 80/20 des transcriptions.** Environ 85 % des vidÃ©os ont des sous-titres disponibles via YouTube. Le repli sur Whisper gÃ¨re les 15 % restants, mais c'est souvent ces 15 % qui contiennent le contenu de niche le plus prÃ©cieux  les confÃ©rences et tables rondes qui n'obtiennent pas de sous-titrage professionnel.

**Le bilinguisme compte au Canada.** OpÃ©rer en anglais et en franÃ§ais n'est pas optionnel pour le travail de gouvernance de l'IA au QuÃ©bec et au Canada. Le support multilingue de Whisper a rendu cela faisable sans maintenir des pipelines sÃ©parÃ©s pour chaque langue.

## Pourquoi c'est important pour la gouvernance de l'IA

Ce projet n'est pas qu'un exercice technique  c'est un exemple pratique d'automatisation IA responsable. La compÃ©tence :

- **Respecte les conditions des plateformes** en utilisant les API de sous-titres officielles avant de se rabattre sur le traitement audio
- **Garde les donnÃ©es locales** avec la transcription Whisper sur l'appareil plutÃ´t que d'envoyer l'audio Ã  des API tierces
- **Est transparente et open source**, pour que quiconque puisse auditer ce qu'elle fait et comment
- **RÃ©sout un vrai problÃ¨me de flux de travail** plutÃ´t que d'Ãªtre de l'IA pour le plaisir de l'IA

Ce sont exactement les principes que je prÃ©conise quand j'aide les organisations Ã  adopter l'IA : commencer avec un besoin rÃ©el, choisir l'approche technique la moins invasive, Ãªtre transparent sur ce que fait le systÃ¨me, et garder les humains dans la boucle pour les dÃ©cisions qui comptent.

## Essayez-le vous-mÃªme

Le projet est open source et disponible sur GitHub : [DA-Leclerc/openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill)

Que vous soyez intÃ©ressÃ© par les plateformes d'agents IA, l'automatisation YouTube, ou que vous cherchiez simplement une meilleure faÃ§on de suivre le contenu vidÃ©o dans votre domaine, n'hÃ©sitez pas Ã  le forker et Ã  le personnaliser.

---

*Des questions sur la construction de compÃ©tences d'agents IA ou l'automatisation de flux de recherche ? [Contactez-moi](/fr/a-propos/)  je suis toujours heureux de discuter d'automatisation IA pratique.*
