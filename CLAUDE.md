# Appli de musculation (Flutter, Android)

- Réponds en français, avec tutoiement. L'utilisateur ne code pas : explique chaque étape.
- Dossier : C:\Users\seijo\Documents\appli-muscu\appli_muscu. Windows 11, PowerShell.
- Une petite tâche à la fois. Annonce ce que tu vas modifier avant de le faire.
- Ne supprime aucun fichier, n'ajoute aucune dépendance et ne fais aucune migration sans accord explicite.
- Ne lis jamais les fichiers .glb (binaires très volumineux).
- Après chaque modification, lance flutter analyze et résume la sortie. Ne lance pas flutter run.
- Ne jamais affirmer un fait sur la machine sans l'avoir vérifié par une commande.
- Les fichiers sont en UTF-8 : garde les accents.
- Structure : lib/salle_page.dart (équipements de la salle et table modeles3d des GLB), lib/fiches_*.dart + fiches.dart + fiche_modele.dart (fiches d'exercices), lib/data/ et lib/pages/ (autres sections).
- Les clés des fiches doivent être identiques au caractère près aux noms d'exercices de salle_page.dart.
- Pour ajouter un GLB : copier le fichier dans assets/models/, puis ajouter une ligne dans la table modeles3d avec le nom exact de l'équipement.
- L'info deprecated_member_use sur material.dart est connue : l'ignorer pour l'instant.