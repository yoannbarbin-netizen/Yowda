import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesBancsB = {
  "Développé militaire assis": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Épaules",
    musclesSecondaires: "Triceps, haut des pectoraux",
    etapes: [
      "Règle le dossier presque à la verticale (80 à 90°) et assieds-toi, dos bien calé.",
      "Tiens les haltères à hauteur d'épaules, paumes vers l'avant.",
      "Pousse vers le haut jusqu'à bras presque tendus, sans verrouiller les coudes.",
      "Redescends lentement jusqu'à hauteur des oreilles.",
    ],
    respiration: "Expire en poussant, inspire en redescendant.",
    erreurs: [
      "Cambrer le bas du dos pour aider la poussée.",
      "Laisser les coudes partir trop en arrière.",
      "Verrouiller violemment les coudes en haut.",
    ],
    conseils: [
      "Serre les abdominaux et les fessiers pour garder le dos plaqué.",
      "Commence léger : les épaules sont fragiles.",
    ],
  ),
  "Curl incliné haltères": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Biceps (partie longue)",
    musclesSecondaires: "Avant-bras",
    etapes: [
      "Règle le banc à environ 45 à 60° et assieds-toi, dos et tête appuyés.",
      "Laisse les bras pendre derrière le buste, haltères en main, paumes vers l'avant.",
      "Plie les coudes pour monter les haltères vers les épaules, sans avancer les coudes.",
      "Redescends lentement jusqu'à presque tendre les bras.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Avancer les coudes pour tricher.",
      "Balancer les haltères.",
      "Descendre trop vite et perdre la tension.",
    ],
    conseils: [
      "Utilise des haltères plus légers qu'en curl debout, l'étirement est plus intense.",
      "Prends toute l'amplitude, sans forcer en bas si tu sens une tension vive dans le biceps.",
    ],
  ),
  "Rowing buste penché (appui)": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Dorsaux, rhomboïdes",
    musclesSecondaires: "Biceps, arrière des épaules",
    etapes: [
      "Règle le banc à environ 30 à 45° et allonge-toi face contre le dossier, poitrine appuyée.",
      "Laisse pendre les bras avec un haltère dans chaque main.",
      "Tire les coudes vers l'arrière en serrant les omoplates.",
      "Redescends lentement en contrôlant.",
    ],
    respiration: "Expire en tirant, inspire en redescendant.",
    erreurs: [
      "Décoller la poitrine du banc.",
      "Hausser les épaules vers les oreilles.",
      "Utiliser des haltères trop lourds.",
    ],
    conseils: [
      "L'appui sur le banc protège le bas du dos.",
      "Marque une courte pause en serrant les omoplates.",
    ],
  ),
  "Crunch incliné": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 20 répétitions",
    musclesPrincipaux: "Abdominaux",
    musclesSecondaires: "Obliques",
    etapes: [
      "Allonge-toi sur le banc à abdos incliné, pieds calés sous les coussins, genoux légèrement fléchis.",
      "Croise les mains sur la poitrine.",
      "Enroule le haut du buste vers les genoux en contractant les abdominaux.",
      "Redescends lentement, sans poser complètement le dos.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Tirer sur la nuque avec les mains.",
      "Se hisser avec les cuisses plutôt qu'avec les abdominaux.",
      "Descendre trop vite.",
    ],
    conseils: [
      "Augmente l'inclinaison progressivement.",
      "Regarde vers le plafond pour garder la nuque dans l'axe.",
    ],
  ),
  "Relevé de jambes": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Abdominaux (partie basse)",
    musclesSecondaires: "Fléchisseurs de hanche",
    etapes: [
      "Allonge-toi sur le banc, mains tenant le haut du banc derrière la tête, jambes tendues ou légèrement fléchies.",
      "Plaque le bas du dos contre le banc.",
      "Monte les jambes vers le plafond en enroulant le bassin.",
      "Redescends lentement, sans laisser le bas du dos se cambrer.",
    ],
    respiration: "Expire en montant les jambes, inspire en redescendant.",
    erreurs: [
      "Cambrer le bas du dos en bas du mouvement.",
      "Balancer les jambes pour prendre de l'élan.",
      "Descendre les jambes trop bas pour ta force.",
    ],
    conseils: [
      "Plie les genoux pour une version plus facile.",
      "Arrête la descente dès que ton dos commence à se décoller.",
    ],
  ),
  "Crunch lesté": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Abdominaux",
    musclesSecondaires: "Obliques",
    etapes: [
      "Installe-toi comme pour le crunch incliné, pieds calés.",
      "Tiens un disque ou un haltère léger contre la poitrine.",
      "Enroule le haut du buste vers les genoux en contractant les abdominaux.",
      "Redescends lentement en contrôlant la charge.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Choisir une charge trop lourde qui oblige à tirer sur la nuque.",
      "Prendre de l'élan pour monter.",
      "Placer la charge derrière la tête sans en avoir l'habitude.",
    ],
    conseils: [
      "Commence avec une charge légère, tenue contre la poitrine.",
      "Augmente la charge seulement quand tu maîtrises le crunch simple.",
    ],
  ),
};