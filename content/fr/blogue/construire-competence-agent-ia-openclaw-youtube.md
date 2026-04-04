---
title: "Je gère une équipe d'agents IA depuis un mini-PC dans mon salon"
date: 2026-03-10
description: "Cinq agents IA autonomes, un mini-PC, zéro employé. Comment un technicien militaire retraité a bâti une opération IA complète avec OpenClaw, des scripts shell et 21 ans de pensée systémique."
summary: "Cinq agents IA autonomes, un mini-PC, zéro employé. Comment un technicien militaire retraité a bâti une opération IA complète avec OpenClaw, des scripts shell et 21 ans de pensée systémique."
tags: ["IA", "OpenClaw", "Automatisation", "Agents", "Open Source"]
categories: ["Projets"]
cover:
  image: "/images/building-ai-agent-skill-openclaw-cover.jpg"
  alt: "Un mini-PC qui fait rouler une opération d'agents IA autonomes"
  hidden: false
showToc: false
---

Il y a une petite boîte sur mon bureau. Un EliteMini avec un Ryzen 9, 32 Go de RAM, qui roule Ubuntu. Cette machine-là fait rouler toute mon opération IA, 24 heures sur 24, 7 jours sur 7.

La plateforme s'appelle OpenClaw : un système multi-agents open source qui permet de bâtir des agents IA, de leur donner des personnalités et des instructions, de les brancher sur des apps de messagerie comme Telegram et WhatsApp, et de les laisser travailler de façon autonome. On leur parle comme on parlerait à un employé. Ils ont de la mémoire, des outils, et des mandats.

Je suis un adjudant retraité des Forces armées canadiennes, avec 21 ans en aviation militaire comme technicien en avionique et auditeur en gestion de la qualité. J'ai passé ma carrière à m'assurer que des systèmes complexes fonctionnaient comme prévu, et à trouver pourquoi quand ils flanchaient. Aujourd'hui, j'applique exactement la même approche à l'IA.

## L'équipe

Tom est mon agent PDG. Il roule sur Telegram, et chaque matin à 7 h 30 il me livre un briefing : météo à Saguenay, nouvelles géopolitiques qui affectent les marchés, et une citation d'Alan Watts pour partir la journée. Quand j'ai besoin d'une recherche, je le dis à Tom et il délègue à l'agent le mieux placé pour le mandat.

James est mon chercheur en investissement. Il surveille les chaînes YouTube que je suis pour l'investissement (InvestAnswers, Jordi Visser, Peter Diamandis, Anthony Pompliano) à l'aide d'un script batch qui va chercher les transcriptions les plus récentes pendant la nuit. James les lit, en extrait les signaux d'investissement, et me livre un briefing structuré sur Telegram avant que je me réveille. Tout est archivé dans Notion pour référence future.

Blue est l'assistante personnelle de ma femme, avec son propre bot Telegram, sa propre personnalité et sa propre voix. Quand ma femme a besoin de quelque chose, elle écrit directement à Blue. Jarv joue le même rôle pour toute la famille, mais sur WhatsApp.

Scout est le dernier arrivé : un agent de développement des affaires qui scanne les opportunités locales dans ma région et livre un rapport deux fois par semaine. Des clients potentiels, des entreprises qui pourraient bénéficier de consultation en IA, des appels d'offres pertinents. C'est mon bras de développement commercial qui ne punch jamais out.

Les cinq agents roulent sur le même mini-PC, tous sur Qwen 3 235B via Venice.ai pour la confidentialité. Le coût total de l'opération : un abonnement Venice et de l'électricité.

## Comment ça marche concrètement

Chaque agent possède un fichier SOUL.md qui sert à la fois de définition de personnalité et de manuel d'opération. Le fichier lui dit qui il est, comment il communique, quels outils il a à sa disposition, et quelles règles il suit. Le SOUL.md de Tom le définit comme un PDG qui délègue par des commandes spécifiques de sous-agents (pas en envoyant des messages Telegram aux autres agents). Celui de James en fait un instrument de recherche de précision qui livre ses résultats avec des sources et des niveaux de confiance. Celui de Blue façonne sa voix et son style d'interaction pour les conversations avec ma femme.

Au-delà des fichiers SOUL, chaque agent maintient des fichiers de mémoire, des configurations d'outils et des ordres permanents. Ce ne sont pas des suggestions; ce sont des règles strictes qui déterminent comment l'agent opère.

La couche d'infrastructure, c'est là que la fiabilité se joue vraiment. Des cron jobs et des scripts shell gèrent l'horaire et la pré-extraction de données : un script va chercher tout ce dont Tom a besoin avant son briefing du matin pour qu'il ne perde pas de temps en appels API en pleine conversation. Un processus watchdog remet à zéro les fichiers de session aux 15 minutes pour empêcher les agents de se noyer dans leur propre historique de conversation. Un backup de nuit pousse le tout sur GitHub.

Rien de ça n'est glamour. Ça marche parce que c'est plate.

## Ce que j'ai appris

Les agents IA ne sont pas de la magie. Ce sont des employés qui prennent tout au pied de la lettre et qui vont te confirmer avec assurance qu'une tâche est complétée alors qu'ils ne l'ont jamais commencée. La solution, c'est exactement ce que j'ai fait pendant 21 ans en aviation militaire : des procédures claires, des instructions explicites, et de la vérification à chaque étape.

On ne dit pas à un agent « tu peux chercher sur le web. » On lui donne le nom exact de l'outil, la syntaxe exacte pour l'appeler, et ce qu'il doit faire quand l'appel échoue. On ne fait pas confiance à un agent pour orchestrer cinq appels API sous pression de temps. On bâtit un script shell qui fait l'extraction, et on remet à l'agent un paquet de données propre sur lequel raisonner.

Le patron qui rend tout fiable est simple : construire de l'infrastructure solide autour de l'agent, laisser l'IA faire ce qu'elle fait bien (raisonner, rédiger, formater), et la tenir loin de ce qu'elle fait mal (orchestration multi-étapes avec des timeouts serrés). La fiabilité bat le génie, à tout coup. Je préfère un briefing B+ livré à 4 h 30 chaque matin sans exception qu'un briefing A+ qui plante 40 % du temps.

## Pourquoi c'est important

J'ai bâti tout ça en environ deux semaines, seul, sans formation en programmation. Je ne suis pas développeur. Je suis un technicien militaire retraité qui sait comment faire fonctionner des systèmes, et qui utilise les outils d'IA pour combler les trous dans ses connaissances techniques.

Chaque conversation que j'ai eue avec Claude sur l'architecture, le debugging ou la stratégie de déploiement, c'est une conversation pour laquelle je n'ai pas eu besoin de payer un consultant. Chaque agent que j'ai configuré est une tâche récurrente qui roule maintenant sans moi. Scout me trouve des opportunités d'affaires pendant que je m'entraîne en jiu-jitsu. James lit du contenu d'investissement pendant que je dors. Tom gère l'opération au complet et me revient quand quelque chose demande mon attention.

C'est ça, l'adoption pratique de l'IA pour une opération d'une seule personne : pas remplacer des humains, mais multiplier ce qu'un individu peut accomplir dans une journée. Je bâtis une entreprise de consultation appelée Nord Paradigm autour de cette approche exacte, et l'infrastructure que je fais rouler pour moi-même sert aussi de démo produit. Quand un client potentiel me demande ce que je peux faire pour son entreprise, j'ouvre mon Telegram et je lui montre.

Cinq agents, un mini-PC, zéro employé.
