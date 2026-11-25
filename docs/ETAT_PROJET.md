# État du projet (source de vérité, à tenir à jour)

Dernière mise à jour : 24/11/2026

## Contexte
- Appli Flutter Android « Appli Muscu » (iOS plus tard), version 1.0.0+1, Git local, branche master.
- 5 sections : Échauffement, Salle de sport, Matériel maison, Sans matériel, Étirements.
- Yo ne code pas. Un autre assistant (Claude, en chat) compile les prompts du dossier docs/prompts/ ; tu les exécutes en suivant leurs règles.

## Fait
- Salle : 34 équipements avec modèle 3D (33 fichiers dans assets/models ; Banc réglable réutilise incline_bench.glb) et 90 GIF liés (88 fichiers dans assets/gifs).
- Android : permission INTERNET (release) et SafeArea(top: false) dans main.dart.
- Mode Entraînement Actif — Phase 2 : modèles `lib/models/session.dart` (3 classes avec sérialisation JSON), persistance Hive `lib/data/session_hive.dart` (singleton sessionStorage). `main.dart` en async avec `Hive.initFlutter()`. Dépendances hive et hive_flutter.
- Agents du projet dans .claude/agents.

## Décisions
- Fractionné et Course continue partagent course_continue.gif (volontaire).
- Allègement des GLB lourds (leg_extension 22,6 Mo, lat_pulldown 11,5 Mo) reporté à une grosse sortie de version.
- flutter analyze : 7 infos deprecated_member_use attendues (une par fichier qui importe package:flutter/material.dart), une par fichier. Ce nombre change si un lot ajoute ou retire un fichier important material.dart : le prompt du lot donne alors la valeur attendue.
- Les clés des fiches doivent rester identiques au caractère près aux noms d'exercices de salle_page.dart.

## Structure actuelle de lib/ (avant refactor)
- À plat : main.dart, salle_page.dart, fiche_modele.dart, fiches.dart, 12 fichiers fiches_*.dart, gifs_exercices.dart.
- data/ : echauffement, etirements, materiel_maison, sans_materiel, **session_hive.dart** (persistances Hive).
- models/ : **session.dart** (PerformedSet, PerformedExercise, WorkoutSession).
- pages/ : 4 pages des autres sections, **session_active_page.dart** (écran de séance active).

## Chantier en cours : refactor de l'architecture
Objectif : code propre et architecture organisée, sans changer le comportement visible de l'appli.
Lots prévus (provisoire, à valider avec Yo) : 1 code mort ; 2 modèles ; 3 données de la salle ; 4 fiches regroupées par catégorie ; 5 pages ; 6 migration material_ui.

## Journal
- 23/11/2026 : commits 3287387 (GIF), dcd0fa0 (agents), f66b861 (retrait d'un GLB inutile). Inventaire de lib/ fait.
- 23/11/2026 : Lot 1 exécuté — suppression de `lib/echauffement_page.dart` (code mort, non importé). `flutter analyze` : 7 infos `deprecated_member_use`.
- 23/11/2026 : Lot 2 réclamé mais non vérifié — dossier `lib/models/` n'existe pas à ce jour. Incohérence entre ETAT_PROJET.md et état réel du dépôt.
- 23/11/2026 : `docs/MANIFESTE.md` créé — recense toutes les données du projet pour reprise de développement à distance (agents, architecture, assets, analyse). flutter analyze : 7 infos.
- 23/11/2026 : Manifeste enrichi avec détails navigation et patterns UI complets (Salle 3 niveaux avec ModelViewer→FichePage, autres sections 2 niveaux vers ExerciceDetailPage, SectionPage placeholder, système de filtrage materiel maison).
- 23/11/2026 : Mode Entraînement Actif — Phase 2 terminée. Ajout des modèles `lib/models/session.dart` (PerformedSet, PerformedExercise, WorkoutSession avec sérialisation JSON) et persistance `lib/data/session_hive.dart` (Hive via Map, singleton sessionStorage). `main.dart` initialisé en async avec `Hive.initFlutter()`. Dépendances ajoutées : `hive: ^2.2.3`, `hive_flutter: ^1.1.0`. flutter analyze : 7 infos deprecated_member_use.
- 23/11/2026 : Mode Entraînement Actif — Phase 3 terminée. Création de `lib/pages/session_active_page.dart` (~490 lignes). Fonctionnalités : écran de séance active avec sélection d'exercices hiérarchique (copie structure categoriesSalle), ajout de séries (poids en kg, répétitions), suppression par swiping (Dismissible), timer temps réel, sauvegarde automatique Hive à chaque set, terminaison avec confirmation et navigation vers bilan. `flutter analyze` : 8 infos deprecated_member_use attendues, zéro erreur.
- 24/11/2026 : Bug #3 corrigé — cohérence Étirements/Échauffement dans l'ajout à l'entraînement actif. Détection des exercices durée via `Set<String>` (62 noms uniques). Dialogue de saisie adapté (durée en secondes au lieu de poids/reps). Affichage UI harmonisé (série liste et bilan) : durée affichée pour ces exercices, poids+reps pour les autres. `flutter analyze` : 8 infos deprecated_member_use, zéro erreur.
- 24/11/2026 : Feature #2 — bouton "Ajouter à l'entraînement actif" (fitness_center) ajouté sur chaque fiche d'exercice des 5 sections. Pattern : `Row` avec `IconButton(fitness_center)` + `chevron_right` dans le trailing des ListTile / ExpansionTile ; `IconButton` dans les AppBar actions pour les pages détail. `lib/fiche_modele.dart` modifié (AppBar bouton). `lib/salle_page.dart` corrigé — syntaxe du for-comprehension réécrite proprement (plus de `yield` dans une fonction non-générateur). `flutter analyze` : 8 infos deprecated_member_use, zéro erreur.
- 23/11/2026 : Bug #1 corrigé — session_hive.dart : try/catch dans `chargerToutes()` et `charger()` + import `flutter/foundation.dart` ajouté pour `debugPrint`. models/session.dart : null-safety sur les 3 `fromJson` (defaults entiers, listes vides). pages/session_active_page.dart : singleton `sessionStorage` utilisé partout (remplacement `_storage`), try/catch autour de `.then()` dans `initState`. `flutter analyze` : 8 infos deprecated_member_use, zéro erreur.
- 24/11/2026 : `flutter analyze` exécuté à la demande — 0 erreurs, 0 warnings, 8 infos `deprecated_member_use` (connues, ignorées).
- 24/11/2026 : Champ `_sessionStartTime` supprimé de `lib/pages/session_active_page.dart` (jamais utilisé, déclenchait un warning `unused_element`). `flutter analyze` : 8 infos `deprecated_member_use`, zéro erreur, zéro warning.

## Mode Entraînement Actif — Phases restant à faire
- Phase 1 ✅ : Audit de l'existant terminé.
- Phase 2 ✅ : Modèles de données + persistance Hive terminée (PerformedSet, PerformedExercise, WorkoutSession, SessionStorage).
- Phase 3 ✅ : Écran de séance active — sélectionner exercices, ajouter des séries (poids, reps, timer), sauvegarde automatique (`lib/pages/session_active_page.dart`, ~490 lignes). `flutter analyze` : 8 infos deprecated_member_use.
- Phase 4 : Session bilan (écran résumé en fin de séance).
- Phase 5 : Vérification manuelle complète (correctness, UX, persistance).

## Chantier refactor (en pause)
- Lots 2 à 6 en attente après la Phase 3 du mode Entraînement Actif.