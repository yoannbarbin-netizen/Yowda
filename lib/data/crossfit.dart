import "package:flutter/material.dart";

/// Bibliothèque CrossFit : un mouvement = une seule fiche, partagée entre les
/// disciplines. Les exercices marqués "existant" réutilisent une fiche déjà
/// présente dans l'app (aucun doublon) — leurs noms sont EXACTEMENT ceux de
/// la base existante (graphies vérifiées par audit).
///
/// typeSaisie :
///   "existant"   -> l'exercice existe déjà : sa saisie ne change pas.
///   "poids_reps" -> poids + répétitions (dialogue force classique).
///   "reps"       -> répétitions seules (poids du corps).
///   "temps"      -> durée en secondes (dialogue durée classique).
///
/// Note : "Single Unders" n'est pas créé — c'est le "Saut simple" existant.

class ExerciceCrossfit {
  final String nom;
  final String equipement;
  final String niveau;
  final String muscles;
  final String typeSaisie;
  final List<String> tags;

  const ExerciceCrossfit({
    required this.nom,
    required this.equipement,
    required this.niveau,
    required this.muscles,
    this.typeSaisie = "existant",
    this.tags = const [],
  });
}

class CategorieCrossfit {
  final String nom;
  final IconData icone;
  final String objectif;
  final List<ExerciceCrossfit> exercices;

  const CategorieCrossfit({
    required this.nom,
    required this.icone,
    required this.objectif,
    required this.exercices,
  });
}

const List<CategorieCrossfit> categoriesCrossfit = [
  // ─────────────────────────── 01. GYMNASTIQUE ───────────────────────────
  CategorieCrossfit(
    nom: "Gymnastique",
    icone: Icons.sports_gymnastics,
    objectif: "Force relative, coordination, mobilité et maîtrise corporelle.",
    exercices: [
      // Existants (réutilisés tels quels)
      ExerciceCrossfit(nom: "Tractions pronation", equipement: "Barre de traction", niveau: "Débutant à avancé", muscles: "Dos, biceps"),
      ExerciceCrossfit(nom: "Tractions supination (chin-up)", equipement: "Barre de traction", niveau: "Débutant à avancé", muscles: "Dos, biceps"),
      ExerciceCrossfit(nom: "Pompes classiques", equipement: "Aucun", niveau: "Débutant à avancé", muscles: "Pectoraux, triceps, épaules"),
      ExerciceCrossfit(nom: "Dips sur chaise", equipement: "Chaise", niveau: "Débutant", muscles: "Triceps, pectoraux"),
      ExerciceCrossfit(nom: "Squat pistol assisté", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Quadriceps, fessiers"),
      // Nouveaux
      ExerciceCrossfit(nom: "Toes to Bar", equipement: "Barre de traction", niveau: "Avancé", muscles: "Abdos, dos, avant-bras", typeSaisie: "reps", tags: ["Core"]),
      ExerciceCrossfit(nom: "Knees to Elbows", equipement: "Barre de traction", niveau: "Intermédiaire", muscles: "Abdos, fléchisseurs de hanches", typeSaisie: "reps", tags: ["Core"]),
      ExerciceCrossfit(nom: "Chest to Bar Pull-up", equipement: "Barre de traction", niveau: "Intermédiaire à avancé", muscles: "Dos, biceps", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Bar Muscle-up", equipement: "Barre de traction", niveau: "Avancé", muscles: "Dos, épaules, triceps", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Ring Muscle-up", equipement: "Anneaux de gymnastique", niveau: "Avancé", muscles: "Dos, épaules, triceps", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Ring Dips", equipement: "Anneaux de gymnastique", niveau: "Intermédiaire à avancé", muscles: "Pectoraux, triceps, épaules", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Ring Rows", equipement: "Anneaux de gymnastique", niveau: "Débutant à intermédiaire", muscles: "Dos, biceps", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Handstand Hold", equipement: "Mur", niveau: "Intermédiaire", muscles: "Épaules, gainage", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Handstand Push-up", equipement: "Mur", niveau: "Avancé", muscles: "Épaules, triceps", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Handstand Walk", equipement: "Sol", niveau: "Avancé", muscles: "Épaules, gainage", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Wall Walk", equipement: "Mur", niveau: "Intermédiaire à avancé", muscles: "Épaules, gainage", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "L-Sit Hold", equipement: "Barres parallèles", niveau: "Avancé", muscles: "Abdos, quadriceps", typeSaisie: "temps", tags: ["Core"]),
      ExerciceCrossfit(nom: "Rope Climb", equipement: "Corde d'escalade", niveau: "Intermédiaire à avancé", muscles: "Dos, biceps, avant-bras", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Legless Rope Climb", equipement: "Corde d'escalade", niveau: "Avancé", muscles: "Dos, biceps, abdos", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Hand Release Push-up", equipement: "Aucun", niveau: "Débutant à intermédiaire", muscles: "Pectoraux, triceps", typeSaisie: "reps"),
    ],
  ),

  // ─────────────────────────── 02. HALTÉROPHILIE ───────────────────────────
  CategorieCrossfit(
    nom: "Haltérophilie",
    icone: Icons.fitness_center,
    objectif: "Puissance, force explosive, coordination et technique de levage.",
    exercices: [
      // Existants (réutilisés tels quels)
      ExerciceCrossfit(nom: "Soulevé de terre", equipement: "Barre droite", niveau: "Débutant à avancé", muscles: "Dos, fessiers, jambes"),
      ExerciceCrossfit(nom: "Squat avant", equipement: "Barre droite", niveau: "Débutant à avancé", muscles: "Quadriceps, gainage"),
      ExerciceCrossfit(nom: "Squat arrière", equipement: "Barre droite", niveau: "Débutant à avancé", muscles: "Quadriceps, fessiers"),
      ExerciceCrossfit(nom: "Développé militaire debout", equipement: "Barre droite", niveau: "Débutant à avancé", muscles: "Épaules, triceps", tags: ["Force fonctionnelle"]),
      // Nouveaux
      ExerciceCrossfit(nom: "Power Clean", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, jambes, trapèzes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Squat Clean (Clean)", equipement: "Barre droite", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Hang Power Clean", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, trapèzes, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Hang Squat Clean", equipement: "Barre droite", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Clean & Jerk", equipement: "Barre droite", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Power Snatch", equipement: "Barre droite", niveau: "Intermédiaire à avancé", muscles: "Dos, épaules, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Squat Snatch (Snatch)", equipement: "Barre droite", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Hang Power Snatch", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, épaules", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Hang Squat Snatch", equipement: "Barre droite", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Overhead Squat", equipement: "Barre droite", niveau: "Intermédiaire à avancé", muscles: "Jambes, épaules, gainage", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Push Press", equipement: "Barre droite", niveau: "Débutant à intermédiaire", muscles: "Épaules, triceps, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Push Jerk", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Épaules, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Split Jerk", equipement: "Barre droite", niveau: "Avancé", muscles: "Épaules, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Thruster", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Jambes, épaules", typeSaisie: "poids_reps", tags: ["Force fonctionnelle"]),
      ExerciceCrossfit(nom: "Clean Pull", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, trapèzes, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Snatch Pull", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, trapèzes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Hang Clean Pull", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, trapèzes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Muscle Clean", equipement: "Barre droite", niveau: "Avancé", muscles: "Dos, trapèzes, biceps", typeSaisie: "poids_reps"),
    ],
  ),

  // ─────────────────────── 03. FORCE FONCTIONNELLE ───────────────────────
  CategorieCrossfit(
    nom: "Force fonctionnelle",
    icone: Icons.sports_kabaddi,
    objectif: "Force générale, puissance, stabilité et déplacements avec charge.",
    exercices: [
      // Existants (réutilisés tels quels)
      ExerciceCrossfit(nom: "Swing", equipement: "Kettlebell", niveau: "Débutant à avancé", muscles: "Fessiers, dos, épaules", tags: ["Conditionnement"]),
      ExerciceCrossfit(nom: "Goblet squat", equipement: "Kettlebell", niveau: "Débutant à intermédiaire", muscles: "Quadriceps, fessiers"),
      ExerciceCrossfit(nom: "Turkish get-up", equipement: "Kettlebell", niveau: "Intermédiaire", muscles: "Corps entier"),
      ExerciceCrossfit(nom: "Soulevé de terre roumain", equipement: "Haltères", niveau: "Débutant à intermédiaire", muscles: "Ischio-jambiers, fessiers"),
      ExerciceCrossfit(nom: "Fentes marchées", equipement: "Haltères", niveau: "Débutant", muscles: "Jambes, fessiers"),
      ExerciceCrossfit(nom: "Marche du fermier", equipement: "Haltères", niveau: "Débutant à intermédiaire", muscles: "Gainage, avant-bras, dos", tags: ["Core"]),
      // Nouveaux
      ExerciceCrossfit(nom: "Kettlebell Clean", equipement: "Kettlebell", niveau: "Intermédiaire", muscles: "Dos, trapèzes, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Kettlebell Snatch", equipement: "Kettlebell", niveau: "Intermédiaire à avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Kettlebell Push Press", equipement: "Kettlebell", niveau: "Intermédiaire", muscles: "Épaules, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Kettlebell Goblet Lunge", equipement: "Kettlebell", niveau: "Débutant à intermédiaire", muscles: "Jambes, fessiers", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Dumbbell Snatch", equipement: "Haltères", niveau: "Intermédiaire", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Dumbbell Clean", equipement: "Haltères", niveau: "Intermédiaire", muscles: "Dos, trapèzes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Dumbbell Clean & Jerk", equipement: "Haltères", niveau: "Intermédiaire à avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Dumbbell Thruster", equipement: "Haltères", niveau: "Intermédiaire", muscles: "Jambes, épaules", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Devil Press", equipement: "Haltères", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Dumbbell Walking Lunges", equipement: "Haltères", niveau: "Débutant à intermédiaire", muscles: "Jambes, fessiers", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Sumo Deadlift High Pull", equipement: "Barre droite", niveau: "Intermédiaire", muscles: "Dos, trapèzes, jambes", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "Front Rack Carry", equipement: "Barre droite / kettlebells", niveau: "Intermédiaire", muscles: "Gainage, épaules, jambes", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Overhead Carry", equipement: "Kettlebell / haltère", niveau: "Intermédiaire", muscles: "Épaules, gainage", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Bear Hug Sandbag Carry", equipement: "Sandbag", niveau: "Intermédiaire", muscles: "Corps entier, gainage", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sandbag Clean", equipement: "Sandbag", niveau: "Intermédiaire à avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
    ],
  ),

  // ───────────────────────── 04. CONDITIONNEMENT ─────────────────────────
  CategorieCrossfit(
    nom: "Conditionnement",
    icone: Icons.monitor_heart,
    objectif: "Endurance cardiovasculaire, capacité respiratoire, résistance à l'effort.",
    exercices: [
      // Existants (réutilisés tels quels)
      ExerciceCrossfit(nom: "Course continue", equipement: "Tapis de course", niveau: "Débutant", muscles: "Jambes, endurance"),
      ExerciceCrossfit(nom: "Fractionné (30 s / 30 s)", equipement: "Tapis de course", niveau: "Intermédiaire", muscles: "Jambes, endurance"),
      ExerciceCrossfit(nom: "Rame continue 10 à 20 min", equipement: "Rameur", niveau: "Débutant", muscles: "Dos, jambes, bras"),
      ExerciceCrossfit(nom: "Intervalles 500 m", equipement: "Rameur", niveau: "Intermédiaire", muscles: "Dos, jambes, bras"),
      ExerciceCrossfit(nom: "Pédalage régulier", equipement: "Vélo", niveau: "Débutant", muscles: "Jambes, endurance"),
      ExerciceCrossfit(nom: "Intervalles de résistance", equipement: "Vélo", niveau: "Intermédiaire", muscles: "Jambes, endurance"),
      ExerciceCrossfit(nom: "Double saut", equipement: "Corde à sauter", niveau: "Intermédiaire", muscles: "Mollets, coordination"),
      ExerciceCrossfit(nom: "Saut simple", equipement: "Corde à sauter", niveau: "Débutant", muscles: "Mollets, coordination"),
      ExerciceCrossfit(nom: "Burpees", equipement: "Aucun", niveau: "Débutant à avancé", muscles: "Corps entier", tags: ["Gymnastique"]),
      ExerciceCrossfit(nom: "Mountain climbers", equipement: "Aucun", niveau: "Débutant à avancé", muscles: "Abdos, épaules, jambes"),
      ExerciceCrossfit(nom: "Squats sautés", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Jambes, explosivité"),
      ExerciceCrossfit(nom: "Sprint sur place", equipement: "Aucun", niveau: "Débutant à intermédiaire", muscles: "Jambes, cardio"),
      // Nouveaux
      ExerciceCrossfit(nom: "Burpee Broad Jump", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Corps entier", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Shuttle Run", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Jambes, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sprint 100 m", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Jambes, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sprint 200 m", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Jambes, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sprint 400 m", equipement: "Aucun", niveau: "Avancé", muscles: "Jambes, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Box Jump", equipement: "Box pliométrique", niveau: "Débutant à intermédiaire", muscles: "Jambes, explosivité", typeSaisie: "reps", tags: ["Gymnastique"]),
      ExerciceCrossfit(nom: "Box Jump Over", equipement: "Box pliométrique", niveau: "Intermédiaire", muscles: "Jambes, explosivité", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Box Step-over", equipement: "Box pliométrique", niveau: "Débutant", muscles: "Jambes, fessiers", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Wall Ball Shot", equipement: "Wall Ball / Médecine-ball", niveau: "Débutant à avancé", muscles: "Corps entier", typeSaisie: "poids_reps"),
      ExerciceCrossfit(nom: "SkiErg", equipement: "SkiErg", niveau: "Débutant à avancé", muscles: "Dos, bras, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Assault Bike", equipement: "Air Bike", niveau: "Débutant à avancé", muscles: "Corps entier, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sled Push", equipement: "Traîneau de poussée (Sled)", niveau: "Intermédiaire", muscles: "Jambes, cardio", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Sled Pull", equipement: "Traîneau de poussée (Sled)", niveau: "Intermédiaire", muscles: "Dos, jambes", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Burpee Box Jump Over", equipement: "Box pliométrique", niveau: "Avancé", muscles: "Corps entier", typeSaisie: "reps"),
    ],
  ),

  // ──────────────────────── 05. CORE & STABILITÉ ────────────────────────
  CategorieCrossfit(
    nom: "Core & stabilité",
    icone: Icons.sports_mma,
    objectif: "Sangle abdominale, gainage, transmission de force, contrôle du bassin.",
    exercices: [
      // Existants (réutilisés tels quels)
      ExerciceCrossfit(nom: "Planche (gainage)", equipement: "Aucun", niveau: "Débutant", muscles: "Abdos, gainage", tags: ["Gymnastique"]),
      ExerciceCrossfit(nom: "Planche latérale", equipement: "Aucun", niveau: "Débutant", muscles: "Obliques, gainage"),
      ExerciceCrossfit(nom: "Hollow body", equipement: "Aucun", niveau: "Débutant à intermédiaire", muscles: "Abdos, gainage", tags: ["Gymnastique"]),
      ExerciceCrossfit(nom: "Relevé de jambes", equipement: "Aucun", niveau: "Débutant", muscles: "Abdos"),
      ExerciceCrossfit(nom: "Relevés de genoux suspendu", equipement: "Barre de traction", niveau: "Débutant à intermédiaire", muscles: "Abdos, fléchisseurs de hanches", tags: ["Gymnastique"]),
      ExerciceCrossfit(nom: "Crunchs", equipement: "Aucun", niveau: "Débutant", muscles: "Abdos"),
      ExerciceCrossfit(nom: "Dead bug", equipement: "Aucun", niveau: "Débutant", muscles: "Abdos profonds, gainage"),
      ExerciceCrossfit(nom: "Bird dog", equipement: "Aucun", niveau: "Débutant", muscles: "Lombaires, gainage"),
      // Nouveaux
      ExerciceCrossfit(nom: "V-Ups", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Abdos", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Hollow Rocks", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Abdos, gainage", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Sit-ups CrossFit", equipement: "Aucun", niveau: "Débutant à intermédiaire", muscles: "Abdos", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "GHD Sit-ups", equipement: "Machine GHD", niveau: "Avancé", muscles: "Abdos, fléchisseurs de hanches", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "GHD Back Extensions", equipement: "Machine GHD", niveau: "Intermédiaire", muscles: "Lombaires, fessiers", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "GHD Hip Extensions", equipement: "Machine GHD", niveau: "Intermédiaire", muscles: "Fessiers, ischio-jambiers", typeSaisie: "reps"),
      ExerciceCrossfit(nom: "Plank Shoulder Taps", equipement: "Aucun", niveau: "Débutant à intermédiaire", muscles: "Abdos, épaules", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Arch Hold", equipement: "Aucun", niveau: "Débutant", muscles: "Lombaires, fessiers", typeSaisie: "temps"),
      ExerciceCrossfit(nom: "Arch Rocks", equipement: "Aucun", niveau: "Intermédiaire", muscles: "Lombaires, fessiers", typeSaisie: "reps"),
    ],
  ),
];

/// Tous les exercices CrossFit, toutes familles confondues.
List<ExerciceCrossfit> get tousExercicesCrossfit =>
    [for (final c in categoriesCrossfit) ...c.exercices];

/// Recherche un exercice CrossFit par son nom exact.
ExerciceCrossfit? exerciceCrossfitParNom(String nom) {
  for (final e in tousExercicesCrossfit) {
    if (e.nom == nom) return e;
  }
  return null;
}
