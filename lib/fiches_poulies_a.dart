import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesPouliesA = {
  "Tirage nuque / poitrine": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Grands dorsaux",
    musclesSecondaires: "Biceps, arrière des épaules, trapèzes",
    etapes: [
      "Règle le coussin pour bloquer les cuisses et assieds-toi bien calé.",
      "Saisis la barre un peu plus large que les épaules, bras tendus.",
      "Penche légèrement le buste et tire la barre vers le haut de la poitrine en abaissant les coudes.",
      "Remonte lentement jusqu'à bras tendus, sans lâcher la tension.",
    ],
    respiration: "Expire en tirant la barre, inspire en remontant.",
    erreurs: [
      "Se balancer pour aider le mouvement.",
      "Tirer avec les bras plutôt qu'avec les coudes.",
      "Descendre la barre derrière la nuque sans bonne mobilité d'épaule.",
    ],
    conseils: [
      "Privilégie le tirage vers la poitrine, plus sûr pour les épaules.",
      "Le tirage derrière la nuque n'est pas conseillé aux débutants ni en cas de gêne aux épaules.",
    ],
  ),
  "Pull-over à la poulie": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Grands dorsaux",
    musclesSecondaires: "Triceps, pectoraux, abdominaux",
    etapes: [
      "Debout face à la poulie haute, saisis la corde ou la barre, buste légèrement penché, abdominaux serrés.",
      "Garde les coudes très légèrement fléchis tout au long du mouvement.",
      "Tire la charge vers le bas en arc de cercle, jusqu'à hauteur des cuisses.",
      "Remonte lentement en gardant les dorsaux sous tension.",
    ],
    respiration: "Expire en descendant la charge, inspire en remontant.",
    erreurs: [
      "Plier les coudes comme pour un exercice de triceps.",
      "Cambrer le bas du dos pour aider.",
      "Charge trop lourde qui empêche de sentir les dorsaux.",
    ],
    conseils: [
      "Pense à amener les coudes vers les hanches.",
      "Reste gainé, sans balancer le buste.",
    ],
  ),
  "Tirage bras tendus": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Grands dorsaux",
    musclesSecondaires: "Triceps, arrière des épaules",
    etapes: [
      "Face à la poulie haute, pieds à largeur de hanches, genoux légèrement fléchis, buste un peu penché.",
      "Saisis la barre droite, bras tendus devant toi à hauteur du front.",
      "Descends la barre jusqu'aux cuisses en gardant les bras tendus.",
      "Remonte lentement jusqu'à la position de départ.",
    ],
    respiration: "Expire en descendant, inspire en remontant.",
    erreurs: [
      "Fléchir les coudes pendant le mouvement.",
      "Se redresser ou se pencher davantage en cours de série.",
      "Descendre la barre trop vite.",
    ],
    conseils: [
      "Commence avec une charge légère pour bien ressentir les dorsaux.",
      "Serre les abdominaux pour garder le bassin stable.",
    ],
  ),
  "Rowing à la poulie basse": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Dorsaux, rhomboïdes",
    musclesSecondaires: "Biceps, arrière des épaules, lombaires",
    etapes: [
      "Assis, pieds sur les appuis, genoux légèrement fléchis, dos droit.",
      "Saisis la poignée bras tendus, épaules basses.",
      "Tire la poignée vers le nombril en serrant les omoplates.",
      "Marque une courte pause, puis reviens lentement bras tendus, sans arrondir le dos.",
    ],
    respiration: "Expire en tirant, inspire en revenant.",
    erreurs: [
      "Balancer le buste d'avant en arrière.",
      "Hausser les épaules vers les oreilles.",
      "Arrondir le dos en fin d'extension.",
    ],
    conseils: [
      "Garde les coudes près du corps.",
      "Pense à rapprocher les omoplates plutôt qu'à tirer avec les bras.",
    ],
  ),
  "Curl biceps à la poulie": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Biceps",
    musclesSecondaires: "Avant-bras, brachial",
    etapes: [
      "Debout face à la poulie basse, barre droite ou EZ, mains à largeur d'épaules.",
      "Garde les coudes collés au corps, épaules basses.",
      "Plie les coudes pour monter la barre vers les épaules.",
      "Redescends lentement jusqu'à presque tendre les bras.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Balancer le dos pour monter la charge.",
      "Laisser les coudes avancer.",
      "Descendre trop vite et perdre la tension.",
    ],
    conseils: [
      "La poulie maintient la tension sur toute l'amplitude : profites-en en contrôlant la descente.",
      "Recule d'un pas pour garder le câble bien tendu.",
    ],
  ),
  "Élévations latérales à la poulie": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions par bras",
    musclesPrincipaux: "Épaules (faisceau latéral)",
    musclesSecondaires: "Trapèzes",
    etapes: [
      "Debout de côté près de la poulie basse, poignée dans la main éloignée, passée devant le corps.",
      "Garde le coude légèrement fléchi et le buste droit.",
      "Lève le bras sur le côté jusqu'à hauteur d'épaule.",
      "Redescends lentement, sans poser la charge.",
    ],
    respiration: "Expire en levant le bras, inspire en redescendant.",
    erreurs: [
      "Hausser l'épaule pour monter la charge.",
      "Balancer le corps pour aider.",
      "Monter le bras au-dessus de la hauteur d'épaule.",
    ],
    conseils: [
      "Utilise une charge légère et privilégie le contrôle.",
      "Garde le coude un peu plus haut que la main.",
    ],
  ),
};