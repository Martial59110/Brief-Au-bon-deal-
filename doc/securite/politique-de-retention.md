## 📜 Politique de Rétention des Sauvegardes

### 🎯 Objectif

Cette politique de rétention des sauvegardes PostgreSQL a pour but de garantir la sécurité, l’intégrité et la disponibilité des données critiques de l’organisation. Elle vise à contrer les menaces potentielles et à répondre aux besoins de restauration rapide en cas d’incident.

### 🚨 Menaces Contrées

Notre politique couvre les scénarios suivants :

Perte de données accidentelle : 

Protection en cas de suppression involontaire.

Cyberattaques : 

Résilience contre les ransomwares, malwares, et autres attaques.

Défaillance matérielle : 

Sauvegardes assurées même en cas de crash serveur.

Catastrophes naturelles et sinistres : 

Réplication et stockage externe pour restaurer les données en cas de désastre.

### 🕑 Fréquence des Sauvegardes

   Sauvegarde journalière complète : Une copie complète de toutes les données critiques est effectuée chaquenuit à 2h du matin.

   Pourquoi la nuit ? Cette heure est choisie pour minimiser l'impact sur les utilisateurs et les systèmes en production, car l’activité est généralement plus faible la nuit. 
   
   Cela garantit que les performances ne sont pas affectées durant les heures de travail, tout en permettant des sauvegardes fiables et sans interruption.

### ⏳ Durée de Conservation


Rétention des sauvegardes journalières :

 Chaque sauvegarde complète est conservée pendant 7 jours. 
 
 Cela signifie que les 7 dernières copies de sauvegarde sont toujours disponibles, une pour chaque jour de la semaine, ce qui permet une récupération rapide en cas de besoin.

### 📅 Automatisation des Sauvegardes

Les sauvegardes sont automatisées avec cron pour exécuter un script de sauvegarde à 2h du matin chaque jour.

### 🔓 Sécurité et Stockage des Sauvegardes

   Chiffrement des Sauvegardes :
   
   Les fichiers de sauvegarde sont chiffrés pour prévenir tout accès non autorisé.

   Stockage Externe et Distant :
   
   Une copie des sauvegardes est transférée vers un stockage distant sécurisé pour limiter les risques liés à un sinistre local.

   Contrôle d’Accès : 
   
   Les fichiers de sauvegarde nesont accessibles qu’aux utilisateurs autorisés.