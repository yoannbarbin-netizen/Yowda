# Lot 1 : suppression du code mort

Lis d'abord @docs/ETAT_PROJET.md.

## Objectif
Supprimer le fichier mort lib/echauffement_page.dart (à la racine de lib, 104 lignes, classe StatefulWidget EchauffementPage). Ne le confonds pas avec lib/pages/echauffement_page.dart (StatelessWidget, utilisé par main.dart), qui doit rester intact.

## Accord explicite de Yo
- Tu peux supprimer UNIQUEMENT lib/echauffement_page.dart (à la racine de lib).
- Aucune autre suppression, aucune dépendance ajoutée, aucune migration. Ne lance pas flutter run. Ne commite pas.

## Étapes
1. Prouve par une recherche que lib/echauffement_page.dart n'est importé par aucun fichier. Les imports « echauffement_page.dart » dans lib/pages/ désignent lib/pages/echauffement_page.dart. Cite la commande et son résultat.
2. Supprime-le avec : git rm lib/echauffement_page.dart (le fichier est suivi par Git, donc récupérable ; pas de copie).
3. Lance flutter analyze. Attendu : 8 infos deprecated_member_use. Donne le nombre exact et les fichiers concernés.
4. Vérifie que lib/pages/echauffement_page.dart existe toujours.
5. Mets à jour docs/ETAT_PROJET.md : retire le fichier mort de la structure, ajoute une ligne au Journal (date, action, résultat de flutter analyze) et mets « Prochaine tâche » à : valider l'architecture cible avec Yo.

## Rapport final (obligatoire)
- Fichier supprimé : oui/non, avec la sortie de git status --short.
- Résultat de flutter analyze : nombre d'infos et sortie.
- Si une commande est refusée ou échoue : recopie l'erreur exacte et écris « NON VÉRIFIÉ » pour ce point.
- Propose le message de commit : « Nettoyage: suppression de lib/echauffement_page.dart (code mort) ».