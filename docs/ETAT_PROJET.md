# État du projet (source de vérité, à tenir à jour)

Dernière mise à jour : 24/11/2026

## Contexte
- Appli Flutter Android « Appli Muscu » (iOS plus tard), version 1.0.0+1, Git local, branche master.
- 5 sections : Échauffement, Salle de sport, Matériel maison, Sans matériel, Étirements.
- Yo ne code pas. Un autre assistant (Claude, en chat) compile les prompts du dossier docs/prompts/ ; tu les exécutes en suivant leurs règles.

## Fait
- Salle : 34 équipements avec modèle 3D (33 fichiers dans assets/models ; Banc réglable réutilise incline_bench.glb) et 90 GIF liés (88 fichiers dans assets/gifs).
- Android : permission INTERNET (release) et SafeArea(top: false) dans main.dart.
- Agents du projet dans .claude/agents.

## Décisions
- Fractionné et Course continue partagent course_continue.gif (volontaire).
- Allègement des GLB lourds (leg_extension 22,6 Mo, lat_pulldown 11,5 Mo) reporté à une grosse sortie de version.
- flutter analyze : 7 infos deprecated_member_use (après suppression du code mort).
- Les clés des fiches doivent rester identiques au caractère près aux noms d'exercices de salle_page.dart.

## Structure actuelle de lib/ (avant refactor)
- À plat : main.dart, salle_page.dart, fiche_modele.dart, fiches.dart, 12 fichiers fiches_*.dart, gifs_exercices.dart.
- data/ : echauffement, etirements, materiel_maison, sans_materiel. pages/ : 4 pages des autres sections.

## Chantier en cours : refactor de l'architecture
Objectif : code propre et architecture organisée, sans changer le comportement visible de l'appli.
Lots prévus (provisoire, à valider avec Yo) : 1 code mort ; 2 modèles ; 3 données de la salle ; 4 fiches regroupées par catégorie ; 5 pages ; 6 migration material_ui.

## Journal
- 23/11/2026 : commits 3287387 (GIF), dcd0fa0 (agents), f66b861 (retrait d'un GLB inutile). Inventaire de lib/ fait.
- 24/11/2026 : Lot 1 exécuté — suppression de `lib/echauffement_page.dart` (code mort, non importé). `flutter analyze` : 7 infos `deprecated_member_use`.

## Prochaine tâche
- Valider l'architecture cible avec Yo.