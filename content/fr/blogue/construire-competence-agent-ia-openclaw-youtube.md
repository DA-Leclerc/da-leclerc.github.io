---
title: "Construire une compétence d'agent IA : Automatiser la recherche YouTube avec OpenClaw"
date: 2026-03-10
description: "Comment j'ai construit un pipeline hybride de transcription YouTube comme compétence d'agent OpenClaw, combinant yt-dlp, Whisper et l'automatisation cron."
summary: "Comment j'ai construit un pipeline hybride de transcription YouTube comme compétence d'agent OpenClaw, combinant yt-dlp, Whisper et l'automatisation cron pour transformer le contenu vidéo en intelligence actionnable."
tags: ["IA", "OpenClaw", "Automatisation", "Python", "Open Source"]
categories: ["Projets"]
cover:
  image: "/images/building-ai-agent-skill-openclaw-cover.jpg"
  alt: "Un robot pince construit dans un atelier qui automatise la recherche YouTube"
  hidden: false
showToc: false
---

## Le problème

Si tu travailles en gouvernance IA, tu connais le feeling. Tes abonnements YouTube débordent de contenu pertinent : des conférences, des entrevues d'experts, des discussions sur les politiques. Mais qui a le temps de regarder 47 minutes d'un panel pour extraire les trois points qui comptent vraiment?

J'ai bâti une solution avec OpenClaw, le système d'IA multi-agents que je roule localement. Le pipeline de transcription YouTube est maintenant une de ses compétences d'agent, et il roule chaque nuit pendant que je dors.

## C'est quoi OpenClaw

OpenClaw est un écosystème de six agents IA que j'ai bâti sur infrastructure locale, où chaque agent a des compétences et des responsabilités spécifiques. Les agents communiquent à travers une file de tâches partagée et peuvent appeler les compétences des autres. Le pipeline YouTube est devenu un ajout naturel : une compétence que n'importe quel agent peut utiliser quand de l'intelligence vidéo est nécessaire.

Le fait de rouler ça sur mon propre matériel compte pour la vie privée des données et le contrôle des coûts.

## Comment le pipeline fonctionne

Le pipeline d'extraction de transcriptions a deux chemins.

**Chemin 1 : Extraction par sous-titres.** La plupart des vidéos YouTube ont des sous-titres auto-générés ou uploadés manuellement. Le pipeline utilise yt-dlp pour vérifier les sous-titres disponibles et les télécharge directement. C'est rapide, gratuit, et précis pour les vidéos qui ont de bons sous-titres.

**Chemin 2 : Fallback Whisper.** Quand les sous-titres sont pas disponibles ou de mauvaise qualité, le pipeline télécharge l'audio et le passe dans le modèle Whisper d'OpenAI localement. C'est plus lent mais ça gère les podcasts, les entrevues, et les vidéos en plusieurs langues.

Le pipeline détecte automatiquement quel chemin utiliser, traite le contenu, et sort du texte propre et formaté prêt pour l'analyse IA.

## Le stack

Le setup technique est simple : yt-dlp télécharge les vidéos et extrait les sous-titres, Whisper roule localement sur mon matériel sans coûts d'API et sans données qui quittent mon réseau, des scripts Python gèrent la logique du pipeline qui vérifie les sous-titres et tombe sur Whisper en fallback, run_batch.sh traite des chaînes complètes ou des playlists sur un horaire, skill/youtube.py fournit l'interface de compétence OpenClaw que les agents utilisent pour demander et traiter des transcriptions, et skill/youtube.yaml configure quand et comment la compétence roule.

## La couche d'automatisation

Le vrai pouvoir est pas dans l'extraction des transcriptions. C'est dans ce qui se passe après. Avec le système cron d'OpenClaw, des jobs de nuit tirent les nouvelles vidéos d'une liste curatée de chaînes focalisées sur les politiques IA, la gouvernance et le droit technologique, extraient les transcriptions via le pipeline hybride, les passent à un agent IA pour le résumé et l'extraction de points clés, et livrent des rapports formatés via Telegram.

Je me réveille chaque matin avec un digest du contenu IA le plus pertinent de la veille, déjà résumé et prêt à référencer. Pour quelqu'un qui construit une expertise en consultation en gouvernance IA, ça vaut chaque minute investie.

## Leçons apprises

Commence par le shell et wrape après. J'ai bâti le pipeline de base en scripts bash et Python d'abord, puis je l'ai wrapé comme compétence OpenClaw. Ça a rendu le debugging beaucoup plus facile et m'a permis de tester chaque composante indépendamment.

Whisper est surprenamment bon localement. Le rouler sur un GPU décent donne des résultats comparables à l'API avec zéro coût par transcription, et pour le traitement en batch la vitesse est acceptable.

La curation compte plus que le volume. J'ai commencé par indexer chaque chaîne reliée à l'IA que je pouvais trouver, mais le ratio signal-bruit était terrible. Maintenant je maintiens une liste curatée d'environ 20 chaînes qui produisent du contenu qui vaut la peine d'être lu de façon constante. Moins d'input, meilleur output.

L'abstraction en compétence paie. En construisant ça comme une compétence OpenClaw plutôt qu'un script standalone, n'importe quel agent dans le système peut demander de l'intelligence YouTube. L'agent de recherche l'utilise pour préparer des briefings, l'agent de contenu l'utilise pour trouver du matériel de référence, et le même pipeline sert plusieurs objectifs.

## La suite

Je travaille sur l'ajout de l'identification de locuteurs au pipeline pour pouvoir tracker quels experts disent quoi à travers différentes vidéos, et je construis une archive cherchable de transcriptions traitées. L'objectif : une base de connaissances personnelle en gouvernance IA qui grandit automatiquement.
