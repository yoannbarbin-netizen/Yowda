import "../salle_page.dart";
import "crossfit.dart";
import "echauffement.dart";
import "etirements.dart";
import "materiel_maison.dart";
import "sans_materiel.dart";

/// Recommandation d'échauffement pour un exercice : durée + consigne.
/// Basée sur les standards professionnels : échauffement général court,
/// puis montée en charge spécifique selon le type de mouvement
/// (isolation : 2-3 min ; composés : 8 min ; haltérophilie : 12 min ;
/// cardio : 5 min ; sprints : 10 min...).
class RecoEchauffement {
  final int minutes;
  final String consigne;
  const RecoEchauffement(this.minutes, this.consigne);
}

/// Prescription imposée par la fiche d'un échauffement / étirement :
/// soit une durée (secondes), soit un nombre de répétitions.
class PrescriptionImposee {
  final int? secondes;
  final int? reps;
  const PrescriptionImposee({this.secondes, this.reps});
}

/// Lit la prescription d'un exercice d'échauffement ou d'étirement
/// (« 20 secondes par côté » → 20 s ; « 10 répétitions par jambe » → 10 reps).
/// Retourne null si l'exercice n'est pas concerné (pas de réglage imposé).
PrescriptionImposee? prescriptionImposee(String nom) {
  String? texte;
  for (final e in echauffement) {
    if (e.nom == nom) texte = e.duree;
  }
  for (final e in etirements) {
    if (e.nom == nom) texte = e.duree;
  }
  if (texte == null) return null;
  final sec = RegExp(r"^(\d+)\s+secondes?").firstMatch(texte);
  if (sec != null) {
    return PrescriptionImposee(secondes: int.parse(sec.group(1)!));
  }
  final rep = RegExp(r"^(\d+)\s+répétitions?").firstMatch(texte);
  if (rep != null) {
    return PrescriptionImposee(reps: int.parse(rep.group(1)!));
  }
  return null;
}

RecoEchauffement echauffementPour(String nom) {
  // Étirements et échauffement : par nature déjà « chauds ».
  if (etirements.any((e) => e.nom == nom)) {
    return const RecoEchauffement(0,
        "Pas d'échauffement nécessaire : c'est un étirement, à faire après la séance, muscles chauds.");
  }
  if (echauffement.any((e) => e.nom == nom)) {
    return const RecoEchauffement(0,
        "C'est déjà un exercice d'échauffement : aucun échauffement préalable.");
  }

  // CrossFit : règles par famille (le catalogue sert de référence).
  final cx = exerciceCrossfitParNom(nom);
  if (cx != null) {
    final cat = categoriesCrossfit
        .firstWhere((c) => c.exercices.any((e) => e.nom == nom))
        .nom;
    switch (cat) {
      case "Haltérophilie":
        if (cx.typeSaisie == "existant") {
          return const RecoEchauffement(8,
              "Mobilité ciblée + montées en charge progressives : barre à vide, puis 50 % et 70 %.");
        }
        return const RecoEchauffement(12,
            "Échauffement technique obligatoire : mobilité chevilles, hanches et épaules, puis montées progressives (bâton ou barre vide → 50 % → 70 %).");
      case "Gymnastique":
        if (cx.typeSaisie == "existant") {
          return const RecoEchauffement(5,
              "Épaules et omoplates + une série facile du mouvement.");
        }
        return const RecoEchauffement(8,
            "Poignets, épaules et omoplates, puis une série facile du mouvement (version assistée ou élastique).");
      case "Force fonctionnelle":
        return const RecoEchauffement(6,
            "Charnière de hanches + épaules, puis une série légère du mouvement.");
      case "Conditionnement":
        if (nom.contains("Sprint") || nom == "Shuttle Run") {
          return const RecoEchauffement(10,
              "Échauffement progressif + gammes + 2 accélérations avant les sprints.");
        }
        if (nom.contains("Box") || nom == "Burpee Broad Jump") {
          return const RecoEchauffement(8,
              "Chevilles, genoux et hanches + sauts bas progressifs.");
        }
        return const RecoEchauffement(5,
            "Démarre progressivement : 3 min faciles puis 2 min à l'allure cible.");
      default: // Core & stabilité
        return const RecoEchauffement(3,
            "Gainage facile + mobilité du dos avant de charger.");
    }
  }

  // Salle : règles par catégorie d'équipement.
  for (final cat in categoriesSalle) {
    for (final eq in cat.equipements) {
      if (!eq.exercices.contains(nom)) continue;
      switch (cat.nom) {
        case "Machines guidées":
          return const RecoEchauffement(3,
              "1 série légère à 50 % de 12 répétitions + mouvements articulaires.");
        case "Poulies":
          return const RecoEchauffement(4,
              "2 séries légères progressives (50 % puis 70 %) de 10 répétitions.");
        case "Bancs":
          return const RecoEchauffement(8,
              "Mobilité épaules + montées en charge : barre à vide, puis 50 % et 70 %.");
        case "Poids libres":
          if (eq.nom == "Barre de traction") {
            return const RecoEchauffement(5,
                "Épaules et omoplates + suspensions passives à la barre.");
          }
          if (eq.nom == "Kettlebell") {
            return const RecoEchauffement(6,
                "Hanches et épaules + une série légère de swing pour activer la chaîne postérieure.");
          }
          return const RecoEchauffement(8,
              "Mobilité ciblée + montées en charge progressives : barre à vide, puis 50 % et 70 %.");
        case "Cardio":
          if (nom == "Fractionné (30 s / 30 s)") {
            return const RecoEchauffement(10,
                "Échauffement progressif + 2 accélérations à l'allure des intervalles.");
          }
          return const RecoEchauffement(5,
              "Démarre progressivement : 3 min faciles puis 2 min à l'allure cible.");
        case "Accessoires":
          if (eq.nom == "Corde à sauter") {
            return const RecoEchauffement(5,
                "Chevilles + 2 min de sauts faciles avant les séries.");
          }
          if (eq.nom == "Rouleau de massage") {
            return const RecoEchauffement(0,
                "C'est un exercice de récupération : pas d'échauffement nécessaire.");
          }
          return const RecoEchauffement(3,
              "Mouvements articulaires + 1 série facile du mouvement.");
      }
    }
  }

  // Sans matériel et maison : heuristiques.
  final sansMateriel = [
    ...cardioExercices,
    ...streetWorkoutExercices,
    ...homeWorkoutExercices,
  ].any((e) => e.nom == nom);
  if (sansMateriel) {
    if (nom.startsWith("Planche") ||
        nom == "Hollow body" ||
        nom == "Dead bug" ||
        nom == "Bird dog") {
      return const RecoEchauffement(3, "Gainage facile + mobilité du dos.");
    }
    return const RecoEchauffement(5,
        "Échauffement articulaire complet + 1 série facile du mouvement.");
  }
  if (exercicesMaison.any((e) => e.nom == nom)) {
    return const RecoEchauffement(5,
        "Échauffement articulaire complet + 1 série légère avec la charge utilisée.");
  }

  return const RecoEchauffement(4,
      "Échauffement articulaire complet + une série légère du mouvement.");
}
