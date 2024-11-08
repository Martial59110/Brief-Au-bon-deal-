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

   Sauvegarde journalière complète : Une copie complète de toutes les données critiques est effectuée chaque nuit à 2h du matin.


   Pourquoi la nuit ? Cette heure est choisie pour minimiser l'impact sur les utilisateurs et les systèmes en production, car l’activité est généralement plus faible la nuit. 
   
   Cela garantit que les performances ne sont pas affectées durant les heures de travail, tout en permettant des sauvegardes fiables et sans interruption.

### ⏳ Durée de Conservation


Rétention des sauvegardes journalières :

 Chaque sauvegarde complète est conservée pendant 7 jours. 
 
 Cela signifie que les 7 dernières copies de sauvegarde sont toujours disponibles, une pour chaque jour de la semaine, ce qui permet une récupération rapide en cas de besoin.

### 🛡 La Règle de Sauvegarde 3-2-1

Pour garantir la sécurité et la disponibilité des données, cette politique de sauvegarde suit la règle 3-2-1 :

   3 copies des données : une copie de production et deux sauvegardes pour éviter la perte complète des données.
   2 types de stockage différents : diversifier les supports (par exemple, un disque dur et le cloud)permet de limiter les risques en cas de défaillance matérielle ou de sinistre.
   1 copie hors site : conserver une copie dans un lieu distant (cloud sécurisé,centre de données séparé)pour protéger les donnéescontre les catastrophes locales.

En appliquant cette règle, notre politique assure une résilience et une disponibilité maximales, tout en facilitant la restauration rapide des données en cas de besoin.
### 📅 Automatisation des Sauvegardes

Les sauvegardes sont automatisées avec cron pour exécuter un script de sauvegarde à 2h du matin chaque jour.

**Dans le cadre du brief la sauvegarde se fera toute les 4h**

### 🔓 Sécurité et Stockage des Sauvegardes

   Chiffrement des Sauvegardes :
   
   Les fichiers de sauvegarde sont chiffrés pour prévenir tout accès non autorisé.

   Stockage Externe et Distant :
   
   Une copie des sauvegardes est transférée vers un stockage distant sécurisé pour limiter les risques liés à un sinistre local.

   Contrôle d’Accès : 
   
   Les fichiers de sauvegarde ne sont accessibles qu’aux utilisateurs autorisés.