---
title: "Construire une compétence d'agent IA : Automatiser la recherche YouTube avec OpenClaw"
date: 2026-03-10T20:00:00-05:00
summary: "Comment j'ai construit un pipeline hybride de transcription YouTube comme compétence d'agent OpenClaw  combinant yt-dlp, Whisper et l'automatisation cron pour transformer le contenu vidéo en intelligence actionnable."
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

## Le problème : trop de vidéos, pas assez de temps

Si vous travaillez en gouvernance de l'IA  ou dans tout domaine en évolution rapide  vous connaissez ce sentiment. Vos abonnements YouTube s'accumulent avec des conférences, des briefings politiques et des entrevues d'experts. Chacun pourrait contenir un aperçu clé, mais qui a le temps de tout regarder ?

Je voulais un système capable d'extraire automatiquement les transcriptions des chaînes YouTube que je suis, de les passer à un agent IA pour analyse, et de livrer des résumés concis directement sur mon téléphone. Alors je l'ai construit.

## Découvrir OpenClaw

[OpenClaw](https://github.com/punkpeye/openclaw) est une plateforme d'agents IA open source qui permet de construire des « compétences » modulaires  des capacités autonomes que les agents peuvent utiliser pour accomplir des tâches. Pensez-y comme un système de plugins pour assistants IA, où chaque compétence a sa propre logique, sa configuration, et peut être déclenchée selon un horaire.

Ce qui m'a attiré vers OpenClaw, c'est son architecture pratique : les compétences sont simplement des scripts Python avec une configuration YAML, les espaces de travail gardent vos données organisées, et le système cron intégré signifie que vous pouvez automatiser des flux de travail sans déployer d'infrastructure supplémentaire.

## Ce que j'ai construit

Mon [openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill) est un pipeline hybride de transcription qui fonctionne en deux étapes :

**Étape 1 : Essayer la voie facile d'abord.** La compétence utilise yt-dlp pour vérifier si YouTube dispose déjà de sous-titres pour une vidéo  générés automatiquement ou téléchargés manuellement. S'ils existent, on les récupère directement. C'est rapide, gratuit, et ça fonctionne pour la grande majorité du contenu.

**Étape 2 : Se rabattre sur Whisper.** Quand les sous-titres ne sont pas disponibles  ce qui arrive plus souvent qu'on ne le pense avec du contenu de niche, des enregistrements en direct ou des vidéos non anglophones  la compétence télécharge l'audio et le passe à travers le modèle Whisper d'OpenAI pour la transcription locale. Whisper gère bien plusieurs langues, ce qui est important quand on suit du contenu en anglais et en français.

Le pipeline comprend :

- **grab_transcript.sh**  Gère une seule vidéo : vérifie les sous-titres, se rabat sur Whisper, produit du texte propre
- **run_batch.sh**  Traite des chaînes entières ou des playlists selon un horaire
- **skill/youtube.py**  L'interface de compétence OpenClaw que les agents utilisent pour demander et traiter les transcriptions
- **skill/youtube.yaml**  Configuration définissant quand et comment la compétence s'exécute

## La couche d'automatisation

La vraie puissance n'est pas dans l'extraction des transcriptions  c'est dans ce qui se passe ensuite. Avec le système cron d'OpenClaw, j'ai des tâches nocturnes qui :

1. Récupèrent les nouvelles vidéos d'une liste curatée de chaînes (politique IA, gouvernance, droit technologique)
2. Extraient les transcriptions via le pipeline hybride
3. Les passent à un agent IA pour résumé et extraction de points clés
4. Livrent des rapports formatés via Telegram

Cela signifie que je me réveille chaque matin avec un digest du contenu IA le plus pertinent de la veille, déjà résumé et prêt à référencer. Pour quelqu'un qui développe une expertise en consultation en gouvernance de l'IA, c'est inestimable.

## Leçons apprises

**Commencer avec le shell, puis l'encapsuler.** J'ai d'abord construit le pipeline principal en scripts bash, je les ai testés minutieusement, puis je les ai encapsulés dans l'interface de compétence Python. Cela a rendu le débogage beaucoup plus facile et a gardé les composants indépendamment utiles.

**Whisper est impressionnant mais gourmand en ressources.** Exécuter Whisper localement vous donne la confidentialité et évite les coûts d'API, mais vous avez besoin d'un matériel décent. Pour les traitements par lots nocturnes, je les planifie pendant les heures creuses pour ne pas concurrencer d'autres travaux.

**Le 80/20 des transcriptions.** Environ 85 % des vidéos ont des sous-titres disponibles via YouTube. Le repli sur Whisper gère les 15 % restants, mais c'est souvent ces 15 % qui contiennent le contenu de niche le plus précieux  les conférences et tables rondes qui n'obtiennent pas de sous-titrage professionnel.

**Le bilinguisme compte au Canada.** Opérer en anglais et en français n'est pas optionnel pour le travail de gouvernance de l'IA au Québec et au Canada. Le support multilingue de Whisper a rendu cela faisable sans maintenir des pipelines séparés pour chaque langue.

## Pourquoi c'est important pour la gouvernance de l'IA

Ce projet n'est pas qu'un exercice technique  c'est un exemple pratique d'automatisation IA responsable. La compétence :

- **Respecte les conditions des plateformes** en utilisant les API de sous-titres officielles avant de se rabattre sur le traitement audio
- **Garde les données locales** avec la transcription Whisper sur l'appareil plutôt que d'envoyer l'audio à des API tierces
- **Est transparente et open source**, pour que quiconque puisse auditer ce qu'elle fait et comment
- **Résout un vrai problème de flux de travail** plutôt que d'être de l'IA pour le plaisir de l'IA

Ce sont exactement les principes que je préconise quand j'aide les organisations à adopter l'IA : commencer avec un besoin réel, choisir l'approche technique la moins invasive, être transparent sur ce que fait le système, et garder les humains dans la boucle pour les décisions qui comptent.

## Essayez-le vous-même

Le projet est open source et disponible sur GitHub : [DA-Leclerc/openclaw-youtube-skill](https://github.com/DA-Leclerc/openclaw-youtube-skill)

Que vous soyez intéressé par les plateformes d'agents IA, l'automatisation YouTube, ou que vous cherchiez simplement une meilleure façon de suivre le contenu vidéo dans votre domaine, n'hésitez pas à le forker et à le personnaliser.

---

*Des questions sur la construction de compétences d'agents IA ou l'automatisation de flux de recherche ? [Contactez-moi](/fr/a-propos/)  je suis toujours heureux de discuter d'automatisation IA pratique.*
