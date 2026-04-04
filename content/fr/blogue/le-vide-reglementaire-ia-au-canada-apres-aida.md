---
title: "Le vide réglementaire IA au Canada : ce que la mort de la LIAD signifie pour votre organisation"
date: 2026-03-11T10:00:00-05:00
summary: "La LIAD est morte au feuilleton, et aucun remplaçant fédéral est à l'horizon. Les organisations canadiennes naviguent maintenant entre un patchwork de règles provinciales et des exigences européennes extraterritoriales sans cadre national pour les ancrer."
description: "Une analyse de la situation réglementaire canadienne en matière d'IA après l'échec de la LIAD, couvrant l'application de la Loi 25 au Québec, les nouvelles règles ontariennes sur l'IA en embauche, et ce que les organisations devraient faire."
tags: ["Gouvernance IA", "Canada", "LIAD", "Loi 25", "Réglementation", "Conformité"]
categories: ["Gouvernance IA"]
author: "Dominic-André Leclerc"
showToc: false
TocOpen: false
draft: false
hidemeta: false
comments: false
cover:
  image: "/images/canadas-ai-governance-gap-cover.jpg"
  alt: "Le Parlement avec une legislation IA dechiquetee tandis que les dirigeants font face a l incertitude"
  hidden: false
---

La Loi sur l'intelligence artificielle et les données est morte au feuilleton quand le Parlement a été prorogé, et aucun projet de remplacement n'est à l'horizon. Ça compte plus que les commentaires politiques du moment le laissaient entendre, parce que pendant que la LIAD était vivante, les organisations canadiennes avaient au moins une direction sur laquelle planifier. On savait quels niveaux de risque allaient exister, quelles obligations de documentation s'en venaient, et à peu près quand les budgets de conformité allaient devoir atterrir. La prorogation a effacé cet horizon de planification en une seule motion procédurale, et les organisations qui attendaient de la clarté fédérale avant de bâtir la moindre gouvernance découvrent maintenant que l'attente est indéfinie.

## Ce qui s'applique concrètement en ce moment

Le vide fédéral est réel, mais c'est pas une zone sans règlement. La Loi 25 du Québec est la loi de protection de la vie privée la plus sévère au pays, elle est pleinement en vigueur depuis septembre 2024, et elle s'applique à n'importe quelle organisation qui traite des renseignements personnels de résidents québécois peu importe où cette organisation est basée. La Loi 25 exige des évaluations d'impact sur la vie privée pour tout système qui traite des données personnelles, le consentement explicite pour la prise de décision automatisée, un responsable de la protection des renseignements personnels désigné et la notification obligatoire des atteintes. Si un système d'IA dans ta pile touche des données qui appartiennent à un résident québécois, la Loi 25 s'applique déjà à toi; l'absence d'une loi fédérale sur l'IA change rien à ça.

L'Ontario a bougé en parallèle sur un front plus étroit. La Loi de 2024 sur le travail pour l'avenir (projet de loi 149) a introduit la première disposition canadienne spécifique à l'IA en emploi, qui exige que les employeurs qui utilisent l'IA dans l'embauche divulguent cette utilisation aux candidats. La règle elle-même est modeste, mais le précédent ne l'est pas : les provinces sont prêtes à réglementer l'IA par secteur pendant qu'Ottawa est paralysé, ce qui veut dire que la surface de conformité pour une entreprise qui opère dans plusieurs provinces devient plus fragmentée, pas moins. La LPRPDE, elle, continue de gouverner la vie privée dans le secteur privé fédéral sans mentionner l'IA, même si le Commissariat à la protection de la vie privée a clairement établi dans des directives successives que les systèmes qui traitent des données personnelles tombent carrément sous les exigences existantes de la LPRPDE, que la loi les nomme ou non.

## La pression internationale

Le vide laissé par la LIAD se fait remplir, en pratique, par de la législation étrangère à portée extraterritoriale. La Loi européenne sur l'IA est celle qui compte le plus pour les organisations canadiennes avec la moindre exposition européenne, et la communauté d'affaires québécoise a des liens européens assez profonds pour que « la moindre exposition européenne » soit une catégorie bien plus large que la plupart des équipes de direction le réalisent. La Loi classe les systèmes d'IA par niveau de risque et impose des obligations qui vont de la documentation et de l'évaluation de conformité jusqu'à l'interdiction pure et simple pour les catégories les plus risquées, et sa portée couvre n'importe quel système dont les résultats affectent des personnes à l'intérieur de l'UE. Pour les entreprises canadiennes avec des partenaires, des clients ou des fournisseurs européens, c'est plus théorique : les équipes d'approvisionnement européennes commencent à poser des questions sur les pratiques de gouvernance IA dans leur vérification diligente, et les organisations sans réponses cohérentes perdent des partenariats qu'elles savaient même pas dépendantes de cette question-là.

ISO/IEC 42001, c'est l'autre morceau de la pression internationale, et c'est celui sur lequel je mise le plus fort. C'est pas légalement contraignant nulle part, mais ça devient rapidement le repère vers lequel les organisations sérieuses pointent quand elles ont besoin de démontrer des pratiques d'IA responsables à des clients, à des assureurs ou à des régulateurs. Je poursuis les certifications de responsable de l'implémentation et de responsable de l'audit précisément parce que je pense que la 42001 est en train de devenir l'attente de base de la même façon que la 27001 l'est devenue pour la sécurité de l'information au cours de la dernière décennie.

## Ce que tu devrais faire maintenant

Le conseil pratique est plate, et c'est pour ça que la plupart des organisations le sautent. Fais une évaluation d'impact sur la vie privée pour tout système d'IA qui touche à des données personnelles, parce que la Loi 25 l'exige déjà au Québec et la LPRPDE s'y attend au niveau fédéral, et évaluer les risques maintenant coûte beaucoup moins cher que de reconstruire l'évaluation après qu'une plainte a été déposée. Bâtis un vrai inventaire de tes systèmes d'IA qui documente ce que chacun fait, quelles données il traite, quelles décisions il prend ou influence, et qui à l'intérieur de ton organisation est responsable de son comportement; cet inventaire-là, c'est la fondation que chaque règlement émergent suppose que tu as déjà.

Classifie ces systèmes par risque, parce qu'un chatbot qui répond à des questions sur des produits et une IA qui trie des candidatures, c'est pas la même chose et ça doit pas être gouverné avec les mêmes contrôles. Surveille la Loi européenne sur l'IA de proche si tu as la moindre connexion européenne, et commence à cartographier tes systèmes contre ses catégories de risque plutôt que d'attendre de voir ce que tes partenaires européens vont exiger. Par-dessus tout, arrête de traiter la gouvernance comme quelque chose que tu vas bâtir après l'arrivée de la loi. Les organisations qui la bâtissent de façon proactive en ce moment vont être en position de s'ajuster quand la législation canadienne va revenir, et celles qui traitent le vide fédéral comme une permission d'attendre vont courir à travers une fenêtre de conformité compressée contre des échéances qu'elles auront pas choisies.

Les vides réglementaires finissent par se fermer. Le Canada va passer une loi sur l'IA à un moment donné, et quand ça va arriver, les organisations qui auront utilisé le vide pour bâtir une gouvernance pratique, proportionnée et alignée sur les normes internationales vont vivre la transition comme un ajustement plutôt que comme une crise. La question qui vaut la peine d'être posée, c'est si les dix-huit mois entre maintenant et ce qui s'en vient ensuite sont assez de piste pour que ton organisation se retrouve dans la première catégorie plutôt que dans la seconde.
