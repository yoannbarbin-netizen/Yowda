# Manifeste — Appli Muscu

Source de vérité pour reprise de développement à distance. Dernière mise à jour : 23/11/2026.

---

## 1. Vue d'ensemble

| Champ | Valeur |
|-------|--------|
| Nom | Appli Muscu |
| Type | Application mobile Flutter (Android d'abord, iOS plus tard) |
| Version | 1.0.0+1 |
| SDK Dart | ^3.14.0 |
| Git | Local uniquement, branche `refactor-architecture`, auteur Yowda <afgyowda@gmail.com> |
| Environnement développeur | Windows 11 |
| Utilisateur final (Yo) | Ne code pas — toutes les explications doivent être détaillées |

**But :** Appli d'entraînement de musculation avec 5 sections, modèles 3D interactifs et animations GIF.

---

## 2. Stack technique

### Dépendances runtime
| Package | Version | Rôle |
|---------|---------|------|
| `material_ui` | ^1.1.0 | UI (migration pas encore faite : lot 6) |
| `cupertino_icons` | ^1.0.8 | Icônes style iOS |
| `model_viewer_plus` | ^1.10.0 | Affichage des modèles 3D GLB interactifs |

### Dépendances de dev
| Package | Version | Rôle |
|---------|---------|------|
| `flutter_lints` | ^6.0.0 | Analyse statique et linting |

### Assets
- `assets/models/` — 33 fichiers `.glb` (modèles 3D), total ~73 Mo
- `assets/gifs/` — 88 fichiers `.gif` (animations d'exercices)

### Android (`android/app/src/main/AndroidManifest.xml`)
- Permission `INTERNET` requise pour charger les modèles 3D en release
- `usesCleartextTraffic="true"` activé
- `flutterEmbedding=2`
- Marge de sécurité bas : `SafeArea(top: false)` dans `lib/main.dart`

---

## 3. Architecture du code

### Structure actuelle (avant refactor)

```
lib/
├── main.dart                          (90 lignes) — Point d'entrée, HomePage avec 5 boutons FilledButton, _pageFor() switch vers les pages, SectionPage placeholder "Bientôt disponible"
├── salle_page.dart                    (345 l.) — 34 équipements, catégories, cartes 3D
├── fiche_modele.dart                  (133 l.) — Classe FicheExercice + FichePage UI
├── fiches.dart                        (29 l.)  — Fusionne les 12 fichiers de fiches en une map
├── gifs_exercices.dart                (93 l.)   — Map de 90 entrées → chemins GIF
│
├── fiches_machines.dart               (451 l.)
├── fiches_poulies_a.dart              (179 l.)
├── fiches_poulies_b.dart              (179 l.)
├── fiches_bancs_a.dart                (156 l.)
├── fiches_bancs_b.dart                (135 l.)
├── fiches_poids_libres_a.dart         (179 l.)
├── fiches_poids_libres_b.dart         (135 l.)
├── fiches_poids_libres_c.dart         (135 l.)
├── fiches_cardio_a.dart               (114 l.)
├── fiches_cardio_b.dart               (135 l.)
├── fiches_accessoires_a.dart          (135 l.)
├── fiches_accessoires_b.dart          (135 l.)
│
└── data/
    ├── echauffement.dart              (129 l.) — 14 exercices, classe Exercice locale
    ├── etirements.dart                (123 l.) — 15 étirements, importe Exercice de echauffement.dart
    ├── materiel_maison.dart           (373 l.) — ~28 exercices, classe ExerciceMaison
    └── sans_materiel.dart             (289 l.) — 35 exercices, classe Exercice importée de echauffement.dart

pages/
├── echauffement_page.dart             (64 l.)
├── etirements_page.dart               (36 l.)
├── materiel_maison_page.dart          (108 l.)
└── sans_materiel_page.dart            (79 l.)
```

**Total : 25 fichiers Dart, environ 3 900 lignes.**

### Classes principales

#### `FicheExercice` (`lib/fiche_modele.dart`)
Champs : `niveau`, `seriesReps`, `musclesPrincipaux`, `musclesSecondaires`, `etapes` (List<String>), `respiration`, `erreurs` (List<String>), `conseils` (List<String>).

#### `FichePage` (`lib/fiche_modele.dart`)
Widget affichant : GIF/Image de l'exercice, chips niveau/séries-reps, muscles, étapes numérotées, respiration, erreurs (icône X rouge), conseils (icône check vert).

#### `SallePage` (`lib/salle_page.dart`)
- `modeles3d` : Map <nom équipement, chemin GLB> — 34 entrées
- `Equipement` : classe {nom, muscles, exercices[]}
- `CategorieSalle` : classe {nom, icone, equipements[]}
- `categoriesSalle` : 5 catégories (Machines guidées, Poulies, Bancs, Poids libres, Cardio + Accessoires)
- Navigation : onTap sur un équipement → `EquipementPage` (ModelViewer 3D ou placeholder). Exercices cliquables uniquement si fiche existe (`fiches.containsKey`).

#### `SectionPage` (`lib/main.dart`)
- Widget placeholder affiché par défaut dans `_pageFor()` quand aucune section spécifique ne correspond.
- Affiche : une AppBar avec le titre de la section et le texte "Bientôt disponible" centré (pas d'icône ni de sous-titre).

#### Pages de détail

**ExerciceDetailPage** (`lib/pages/echauffement_page.dart`) : utilisé par échauffement et étirements. Affiche zone, durée, consigne ("Comment faire"), conseil. Titre de l'appBar = nom de l'exercice. Importée par `lib/pages/etirements_page.dart` et `lib/pages/sans_materiel_page.dart` (imports relatifs `echauffement_page.dart`).

**FichePage** (`lib/fiche_modele.dart`) : utilisé uniquement pour la salle. Vérifie `gifsExercices.containsKey(nom)` → affiche le GIF ou placeholder "Illustration / animation à venir". Affiche chips, muscles, étapes numérotées, erreurs (X rouge), conseils (check vert), respiration.

#### Données par section (la classe Exercice est définie dans data/echauffement.dart)
Champs communs : `nom`, `duree`, `zone`, `consigne`, `conseil`.

| Section | Fichier | Nb exercices | Classe |
|---------|---------|-------------|--------|
| Échauffement | `lib/data/echauffement.dart` | 14 | Exercice (locale) |
| Étirements | `lib/data/etirements.dart` | 15 | Exercice (importée) |
| Matériel maison | `lib/data/materiel_maison.dart` | ~28 | ExerciceMaison ({nom, muscles, auChoix/requis[], consigne, securite}) |
| Sans matériel | `lib/data/sans_materiel.dart` | 35 | Exercice (importée de echauffement.dart) — subdivisé cardioExercices (11), streetWorkoutExercices (10), homeWorkoutExercices (14) |

### Navigation et patterns UI

#### Salle de sport (3 niveaux)
```
HomePage → SallePage (5 catégories, cartes équipements)
        → EquipementPage (1 niveau par équipement : ModelViewer 3D interactif OU placeholder "Miniature 3D à venir")
        → FichePage (instructions détaillées avec GIF via gifsExercices)
```
- `EquipementPage` : si un GLB existe pour l'équipement, affiche `ModelViewer` interactif. Sinon, affiche un placeholder "Miniature 3D à venir".
- Les exercices d'un équipement sont cliquables SEULEMENT si une fiche existe (vérifie `fiches.containsKey(nom)`). Seul le titre affiche le chevron et `onTap` est actif.
- `FichePage` : vérifie `gifsExercices.containsKey(nom)` pour afficher l'image/GIF ou un placeholder "Illustration / animation à venir". Affiche chips niveau/séries-reps, muscles principaux/secondaires, étapes numérotées, erreurs (X rouge), conseils (check vert), respiration.

#### Autres sections (2 niveaux)
```
HomePage → EchauffementPage / EtirementsPage (liste de Cards avec ListTile)
        → ExerciceDetailPage (texte seul, pas de GIF ni 3D)
```
- Pattern identique dans échauffement_page.dart et etirements_page.dart : `ListView` de `Card(ListTile)` où onTap navigue vers `ExerciceDetailPage`.
- `ExerciceDetailPage` affiche : zone, durée, consigne ("Comment faire"), conseil. Titre de l'appBar = nom de l'exercice.

#### Matériel maison (2 niveaux, StatefulWidget)
```
HomePage → MaterielMaisonPage (2 onglets TabBar)
        ├── Onglet "Mon matériel" : checkboxes pour chaque matériel
        └── Onglet "Exercices" : liste ExpansionTile filtrée par _possede
```
- Système de filtrage dynamique : `_possede` (Set<String>) stocke les ID du matériel coché. `exercicesMaison.where((e) => e.estPossible(_possede))` filtre les exercices possibles.

#### Sans matériel (2 niveaux, StatelessWidget)
```
HomePage → SansMaterielPage (3 onglets TabBar : Cardio / Street workout / Home workout)
        └── _ListeExercices (widget réutilisé pour chaque onglet)
```
- Pattern identique aux autres sections : liste de Cards vers ExerciceDetailPage.

#### Pages non implémentées
- `SectionPage` dans `main.dart` (default du switch `_pageFor()`) affiche un texte "Bientôt disponible". C'est un filet de sécurité : les 5 sections ont leur page, donc le cas default n'est plus atteint.

### Règles métier critiques
- **Les clés des fiches doivent être identiques au caractère près aux noms d'exercices** définis dans `salle_page.dart`.
- 'Fractionné' et 'Course continue' partagent `course_continue.gif` (volontaire).
- 'Tirage bras tendus' réutilise `pull_over_poulie.gif`.

---

## 4. Inventaire des assets 3D (GLB)

| Fichier | Taille | Équipement associé |
|---------|--------|-------------------|
| low_pulley.glb | 252 Ko | |
| vertical_lat_pulldown.glb | 316 Ko | |
| chest_press.glb | 332 Ko | |
| shoulder_press.glb | 344 Ko | |
| pec_deck.glb | 368 Ko | |
| cable_crossover.glb | 400 Ko | |
| seated_hip_abductor.glb | 400 Ko | |
| seated_cable_row.glb | 420 Ko | |
| triceps_pushdown.glb | 432 Ko | |
| face_pull_station.glb | 488 Ko | |
| treadmill.glb | 576 Ko | |
| stationary_fitness_bike.glb | 640 Ko | |
| stair_stepper.glb | 648 Ko | |
| elliptical_cross_trainer.glb | 700 Ko | |
| pair_of_professional_hex_dumbbells.glb | 792 Ko | |
| indoor_rowing_machine.glb | 812 Ko | |
| ez_curl_bar.glb | 828 Ko | |
| professional_freestanding_pull_up_bar.glb | 896 Ko | |
| kettlebell.glb | 1284 Ko | |
| olympic_barbell_four_weight_plates.glb | 1300 Ko | |
| seated_leg_curl_trainer.glb | 1340 Ko | |
| fitness_jump_rope.glb | 1396 Ko | |
| resistance_bands.glb | 1444 Ko | |
| swiss_stability_ball.glb | 1540 Ko | |
| foam_roller.glb | 1960 Ko | |
| squat_rack.glb | 2000 Ko | |
| flat_weight_bench.glb | 3216 Ko | |
| abdominal_bench.glb | 3480 Ko | |
| decline_weight_bench.glb | 3484 Ko | |
| incline_bench.glb | 3628 Ko | Banc réglable (réutilisé) |
| leg_press_machine.glb | 4396 Ko | |
| lat_pulldown.glb | 11 732 Ko (**lourd**) | Allègement reporté |
| leg_extension.glb | 23 128 Ko (**très lourd**) | Allègement reporté |

**Total : 33 fichiers GLB, ~73 Mo.** Banc réglable réutilise `incline_bench.glb` (pas de fichier dédié).

### Décisions assets
- `straight_pull_up_station.glb` a été supprimé (commit f66b861) — non référencé.
- Allègement des GLB lourds (`leg_extension` 23 Mo, `lat_pulldown` 12 Mo) reporté à une grosse sortie de version.

---

## 5. Inventaire des GIF

88 fichiers dans `assets/gifs/`. Mappés via `lib/gifs_exercices.dart`.

### Partages volontaires
- `'Fractionné'` et `'Course continue'` → `course_continue.gif` (même GIF)
- `'Tirage bras tendus'` → `pull_over_poulie.gif` (réutilise le même fichier)

---

## 6. Agents Claude Code (.claude/agents/)

5 agents définis pour automatiser les tâches :

| Agent | Rôle | Outils |
|-------|------|--------|
| **dev-fonctionnalites** | Ajoute des fonctionnalités Flutter (state, navigation, UI) | Read, Grep, Glob, Edit, Write, Bash |
| **fiches-contenu** | Rédige/relit le contenu textuel des fiches d'exercices | Read, Grep, Glob, Edit, Write |
| **integrateur-assets** | Relie nouveaux GIF/GLB aux tables du projet | Read, Grep, Glob, Edit, Write, Bash |
| **nettoyeur-dette** | Réduit la dette technique (code mort, rangement, migration material_ui) | Read, Grep, Glob, Edit, Write, Bash |
| **verificateur** | Contrôle l'état du projet sans modifier (git, flutter analyze, cohérence tables) | Read, Grep, Glob, Bash |

### Règles communes à tous les agents
- Français, tutoiement (l'utilisateur ne code pas).
- **Règle de fiabilité obligatoire :** Si une commande échoue, recopier le message d'erreur exact et écrire « NON VÉRIFIÉ ». Ne jamais conclure « OK » sans avoir exécuté le contrôle. Chaque chiffre doit venir d'une commande exécutée ou fichier lu pendant la session.
- Sauvegarde dans `Documents\sauvegardes-gif` avant toute modification.
- Ne pas commiter sans demande explicite.

---

## 7. Prompts autorisés (`docs/prompts/`)

| Fichier | Description |
|---------|-------------|
| `lot-01-code-mort.md` | Prompt pour le lot 1 du refactor : détection et suppression de code mort |

*Les fichiers dans `docs/prompts/` listent les actions autorisées. Une suppression, déplacement ou migration n'est permis que s'il y est cité explicitement.*

---

## 8. Historique Git (branch `refactor-architecture`)

```
986f8b4 Docs: date corrigee et valeur attendue de flutter analyze (7 infos)
ee69b86 Nettoyage: suppression de lib/echauffement_page.dart (code mort)
04fc60f Docs: etat du projet et prompts Claude Code
f66b861 3D: retrait du GLB inutilise straight_pull_up_station
15472f3 Dependances: material_ui 1.11.1 et cupertino_ui 1.1.7
dcd0fa0 Claude Code: agents du projet
3287387 GIF: retrait des alias inutiles, Fractionne reprend course_continue
6212d87 3D: GLB des 15 equipements restants (barre, bancs, poids libres, accessoires)
8d708bf GIF: 53 nouveaux exercices, liaisons Tirage bras tendus et Fractionne
ea3eafc UI: marge de securite en bas pour la barre de navigation Android
af0bd2b Android: permission INTERNET pour les modeles 3D en release
d07ead0 3D: GLB des 19 machines de la salle et alt du ModelViewer
5b3e71a GIF: 16 nouveaux exercices (poids libres, cardio, accessoires, rowing) et corrections
908f7e9 GIF: ajout de l'adduction assise
1cf5bf8 GIF: animations des fiches d'exercices (salle de sport)
```

---

## 9. Refactor de l'architecture

**Objectif :** Code propre et architecture organisée, sans changer le comportement visible de l'appli.

### Lots prévus
| Lot | Titre | Statut |
|-----|-------|--------|
| 1 | Code mort | ✅ Exécuté — `lib/echauffement_page.dart` supprimé (non importé) |
| 2 | Modèles → `lib/models/` | ❌ **Non exécuté** — claimé dans ETAT_PROJET.md mais dossier `lib/models/` n'existe pas, aucun commit correspondant dans git log |
| 3 | Données de la salle → `lib/data/salle/` | ⏳ En attente |
| 4 | Fiches regroupées par catégorie | ⏳ En attente |
| 5 | Pages | ⏳ En attente |
| 6 | Migration material_ui | ⏳ En attente |

### Décision architecturale
- `flutter analyze` affiche **7 infos** `deprecated_member_use`, une par fichier qui importe `package:flutter/material.dart`. Ces infos disparaîtront avec la migration complète vers `material_ui`. Ce nombre change si un lot ajoute ou retire un fichier important `material.dart`.

---

## 10. flutter analyze — Ligne de base

```
7 issues found. (ran in 1.8s)
```

**Les 7 infos sont toutes `deprecated_member_use`** sur les fichiers suivants :
1. `lib\fiche_modele.dart:1:1`
2. `lib\main.dart:1:1`
3. `lib\pages\echauffement_page.dart:1:1`
4. `lib\pages\etirements_page.dart:1:1`
5. `lib\pages\materiel_maison_page.dart:1:1`
6. `lib\pages\sans_materiel_page.dart:1:1`
7. `lib\salle_page.dart:1:1`

Aucun warning, aucune erreur. Seulement ces 7 infos attendues.

---

## 11. Changelog (suivi des avancées)

> Ce registre est mis à jour après chaque tâche par Claude Code.

| Date | Tâche | Résultat | flutter analyze |
|------|-------|----------|-----------------|
| 23/11/2026 | Création du manifeste | `docs/MANIFESTE.md` créé — recense toutes les données du projet | 7 infos (identique) |

---

## 12. Prochaine tâche

**Lot 3 : Données de la salle dans `lib/data/salle/`**
- Déplacer `modeles3d`, `categoriesSalle`, et leurs classes (`Equipement`, `CategorieSalle`) depuis `salle_page.dart` vers un nouveau dossier `lib/data/salle/`.
- Garder `salle_page.dart` comme point d'entrée qui importe ces données.

---

*Ce document est auto-contenu : tout développeur (humain ou IA) peut reprendre le projet à partir de ici sans lire l'historique Git ni les fichiers externes.*
