import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesPouliesB = {
  "Écartés poulies hautes": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Pectoraux (partie basse)",
    musclesSecondaires: "Avant des épaules",
    etapes: [
      "Entre les deux poulies hautes, une poignée dans chaque main, un pas en avant, buste légèrement penché.",
      "Garde les coudes légèrement fléchis, bras ouverts de chaque côté.",
      "Ramène les mains vers le bas, devant le bassin, en serrant les pectoraux.",
      "Reviens lentement en contrôlant l'ouverture.",
    ],
    respiration: "Expire en rapprochant les mains, inspire à l'ouverture.",
    erreurs: [
      "Plier et tendre les coudes comme un développé.",
      "Ouvrir trop loin avec une charge lourde.",
      "Faire monter les épaules.",
    ],
    conseils: [
      "Charge modérée : l'objectif est de sentir les pectoraux.",
      "Arrête l'ouverture quand tu sens l'étirement, sans forcer.",
    ],
  ),
  "Écartés poulies basses": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Pectoraux (partie haute)",
    musclesSecondaires: "Avant des épaules",
    etapes: [
      "Entre les deux poulies basses, une poignée dans chaque main, un pas en avant, buste droit.",
      "Garde les coudes légèrement fléchis, bras ouverts le long du corps.",
      "Monte les mains en arc de cercle jusqu'à hauteur du visage, en serrant les pectoraux.",
      "Redescends lentement en contrôlant.",
    ],
    respiration: "Expire en montant les mains, inspire en redescendant.",
    erreurs: [
      "Fléchir les coudes et transformer l'exercice en développé.",
      "Monter les épaules vers les oreilles.",
      "Se servir de l'élan du dos.",
    ],
    conseils: [
      "Imagine que tu ramènes les bras comme pour serrer un grand ballon.",
      "Garde le buste stable, sans te pencher en arrière.",
    ],
  ),
  "Développé à une main": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions par bras",
    musclesPrincipaux: "Pectoraux",
    musclesSecondaires: "Triceps, avant des épaules, abdominaux",
    etapes: [
      "Dos à la poulie réglée à hauteur de poitrine, poignée dans une main, un pied devant l'autre.",
      "Garde le coude plié, la main près de la poitrine.",
      "Pousse la poignée vers l'avant jusqu'à bras presque tendu.",
      "Reviens lentement en gardant le buste bien droit.",
    ],
    respiration: "Expire en poussant, inspire en revenant.",
    erreurs: [
      "Laisser le buste tourner sous la charge.",
      "Cambrer le bas du dos.",
      "Pousser trop vite sans contrôler le retour.",
    ],
    conseils: [
      "Serre les abdominaux pour rester stable.",
      "Fais le même nombre de répétitions de chaque côté.",
    ],
  ),
  "Extension corde vers le bas": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Triceps",
    musclesSecondaires: "Avant-bras, abdominaux",
    etapes: [
      "Face à la poulie haute, saisis la corde, coudes collés au corps.",
      "Garde les avant-bras à l'horizontale, épaules basses.",
      "Étends les bras vers le bas et écarte légèrement la corde en bas du mouvement.",
      "Remonte lentement jusqu'à ce que les avant-bras reviennent à l'horizontale.",
    ],
    respiration: "Expire en tendant les bras, inspire en remontant.",
    erreurs: [
      "Laisser les coudes s'écarter ou avancer.",
      "Se pencher sur la corde pour pousser avec le poids du corps.",
      "Remonter trop haut et perdre la tension.",
    ],
    conseils: [
      "Seuls les avant-bras bougent, les coudes restent fixes.",
      "Marque une courte pause en bas pour bien contracter les triceps.",
    ],
  ),
  "Extension à la barre": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Triceps",
    musclesSecondaires: "Avant-bras, abdominaux",
    etapes: [
      "Face à la poulie haute, barre droite ou en V, mains rapprochées, coudes collés au corps.",
      "Commence avec les avant-bras à l'horizontale.",
      "Pousse la barre vers le bas jusqu'à tendre les bras.",
      "Remonte lentement en gardant les coudes immobiles.",
    ],
    respiration: "Expire en poussant vers le bas, inspire en remontant.",
    erreurs: [
      "Lever les coudes ou les éloigner du corps.",
      "Hausser les épaules.",
      "Se servir du poids du corps pour pousser.",
    ],
    conseils: [
      "Choisis une charge qui permet de garder les coudes fixes.",
      "Contrôle bien la remontée, c'est là que le muscle travaille.",
    ],
  ),
  "Extension nuque à la corde": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Triceps (longue portion)",
    musclesSecondaires: "Épaules, abdominaux",
    etapes: [
      "Dos à la poulie haute, corde passée derrière la tête, un pied devant l'autre.",
      "Garde les coudes pointés vers l'avant, serrés près de la tête.",
      "Étends les bras vers l'avant et vers le haut jusqu'à les tendre.",
      "Reviens lentement derrière la tête, en contrôlant.",
    ],
    respiration: "Expire en tendant les bras, inspire en revenant.",
    erreurs: [
      "Laisser les coudes s'écarter.",
      "Cambrer le bas du dos.",
      "Choisir une charge trop lourde qui force sur les épaules.",
    ],
    conseils: [
      "Reste gainé, le buste bien droit.",
      "Arrête si tu ressens une gêne à l'épaule ou au coude.",
    ],
  ),
  "Face pull à la corde": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Arrière des épaules, trapèzes",
    musclesSecondaires: "Rotateurs externes, rhomboïdes",
    etapes: [
      "Face à la poulie réglée à hauteur du visage, corde saisie à deux mains, pouces vers toi.",
      "Recule d'un pas pour garder le câble tendu, abdominaux serrés.",
      "Tire la corde vers le visage en écartant les mains de chaque côté de la tête.",
      "Marque une pause, puis reviens lentement bras tendus.",
    ],
    respiration: "Expire en tirant, inspire en revenant.",
    erreurs: [
      "Utiliser une charge trop lourde qui oblige à se pencher en arrière.",
      "Tirer vers le cou plutôt que vers le visage.",
      "Laisser les coudes retomber sous les mains.",
    ],
    conseils: [
      "Garde les coudes à hauteur des mains.",
      "C'est un bon exercice de prévention pour les épaules : reste léger et propre.",
    ],
  ),
  "Oiseau à la poulie": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Arrière des épaules",
    musclesSecondaires: "Trapèzes, rhomboïdes",
    etapes: [
      "Entre les deux poulies hautes, saisis la poignée de gauche de la main droite et inversement, bras croisés.",
      "Garde les bras presque tendus, légèrement fléchis aux coudes.",
      "Écarte les bras vers l'arrière jusqu'à l'alignement des épaules.",
      "Reviens lentement en croisant à nouveau les bras.",
    ],
    respiration: "Expire en écartant les bras, inspire en revenant.",
    erreurs: [
      "Plier les coudes pour tirer vers l'arrière.",
      "Hausser les épaules vers les oreilles.",
      "Se servir de l'élan du buste.",
    ],
    conseils: [
      "Charge légère : l'arrière des épaules est un petit muscle.",
      "Pense à ouvrir la poitrine et à rapprocher les omoplates.",
    ],
  ),
};