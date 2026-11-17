import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesPoidsLibresA = {
  "Curl biceps": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Biceps",
    musclesSecondaires: "Avant-bras, brachial",
    etapes: [
      "Debout, un haltère dans chaque main, bras le long du corps, paumes vers l'avant.",
      "Garde les coudes collés au corps, épaules basses.",
      "Plie les coudes pour monter les haltères vers les épaules.",
      "Redescends lentement jusqu'à presque tendre les bras.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Balancer le dos pour monter la charge.",
      "Laisser les coudes avancer.",
      "Descendre trop vite et perdre la tension.",
    ],
    conseils: [
      "Choisis une charge qui te permet 10 répétitions propres.",
      "Tu peux alterner un bras puis l'autre pour mieux te concentrer.",
    ],
  ),
  "Élévations latérales": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Épaules (faisceau latéral)",
    musclesSecondaires: "Trapèzes",
    etapes: [
      "Debout, un haltère léger dans chaque main, genoux et coudes très légèrement fléchis.",
      "Lève les bras sur les côtés jusqu'à hauteur d'épaules.",
      "Garde les coudes un peu plus hauts que les mains.",
      "Redescends lentement, sans laisser les haltères retomber.",
    ],
    respiration: "Expire en levant les bras, inspire en redescendant.",
    erreurs: [
      "Hausser les épaules vers les oreilles.",
      "Balancer le corps pour monter les haltères.",
      "Monter les bras au-dessus de la hauteur d'épaule.",
    ],
    conseils: [
      "Prends des haltères légers : les épaules sont fragiles.",
      "Contrôle surtout la descente.",
    ],
  ),
  "Fentes marchées": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 pas par jambe",
    musclesPrincipaux: "Quadriceps, fessiers",
    musclesSecondaires: "Ischio-jambiers, mollets, abdominaux",
    etapes: [
      "Debout, un haltère dans chaque main (ou sans charge au début), buste droit.",
      "Fais un grand pas en avant et descends jusqu'à ce que le genou arrière frôle le sol.",
      "Pousse dans le pied avant pour te redresser et amener l'autre jambe en avant.",
      "Enchaîne en marchant, en alternant les jambes.",
    ],
    respiration: "Inspire à la descente, expire en remontant.",
    erreurs: [
      "Faire des pas trop courts : le genou avant dépasse trop les orteils.",
      "Pencher le buste vers l'avant.",
      "Laisser le genou avant s'effondrer vers l'intérieur.",
    ],
    conseils: [
      "Prévois 8 à 10 mètres d'espace dégagé.",
      "Commence sans charge pour trouver ton équilibre.",
    ],
  ),
  "Soulevé de terre roumain": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Ischio-jambiers, fessiers",
    musclesSecondaires: "Lombaires, avant-bras",
    etapes: [
      "Debout, un haltère dans chaque main devant les cuisses, genoux très légèrement fléchis.",
      "Pousse les fesses vers l'arrière, dos plat, et laisse les haltères glisser le long des jambes.",
      "Descends jusqu'à sentir l'étirement à l'arrière des cuisses, vers mi-tibias.",
      "Remonte en poussant les hanches vers l'avant, jusqu'à être debout.",
    ],
    respiration: "Inspire en descendant, expire en remontant.",
    erreurs: [
      "Arrondir le dos.",
      "Fléchir trop les genoux et faire un squat.",
      "Laisser les haltères s'éloigner des jambes.",
    ],
    conseils: [
      "Regarde le sol à quelques mètres devant toi pour garder la nuque neutre.",
      "Allège si tu ne sens pas l'arrière des cuisses travailler.",
    ],
  ),
  "Squat": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 6 à 10 répétitions",
    musclesPrincipaux: "Quadriceps, fessiers",
    musclesSecondaires: "Ischio-jambiers, lombaires, abdominaux",
    etapes: [
      "Place la barre sur le haut du dos, sur les trapèzes et non sur la nuque, mains un peu plus larges que les épaules.",
      "Pieds à largeur d'épaules, pointes légèrement ouvertes, abdominaux serrés.",
      "Descends en poussant les fesses vers l'arrière, jusqu'à avoir les cuisses au moins parallèles au sol.",
      "Pousse dans le sol pour remonter, genoux dans l'axe des pieds.",
    ],
    respiration: "Inspire et gaine avant de descendre, expire en remontant.",
    erreurs: [
      "Décoller les talons.",
      "Arrondir le bas du dos en bas du mouvement.",
      "Laisser les genoux rentrer vers l'intérieur.",
    ],
    conseils: [
      "Commence avec une barre vide pour apprendre la technique.",
      "Règle les butées de sécurité du rack à hauteur adaptée avant de charger.",
    ],
  ),
  "Soulevé de terre": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 5 à 8 répétitions",
    musclesPrincipaux: "Fessiers, ischio-jambiers, lombaires",
    musclesSecondaires: "Trapèzes, quadriceps, avant-bras",
    etapes: [
      "Barre au-dessus du milieu des pieds, pieds à largeur de hanches.",
      "Pousse les fesses vers l'arrière, saisis la barre à l'extérieur des jambes, dos plat, poitrine ouverte.",
      "Pousse dans le sol et monte la barre au plus près des jambes, jusqu'à être debout.",
      "Redescends la barre en la faisant glisser le long des jambes, en commençant par les hanches.",
    ],
    respiration: "Inspire et gaine avant de tirer, expire une fois debout.",
    erreurs: [
      "Arrondir le dos.",
      "Laisser la barre s'éloigner des jambes.",
      "Se pencher en arrière pour finir le mouvement.",
    ],
    conseils: [
      "Commence avec une barre légère et demande l'avis d'un coach ou d'une personne expérimentée sur ta technique.",
      "Pose la barre complètement entre chaque répétition au début.",
    ],
  ),
  "Développé couché": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 6 à 10 répétitions",
    musclesPrincipaux: "Pectoraux",
    musclesSecondaires: "Triceps, avant des épaules",
    etapes: [
      "Allonge-toi sur le banc plat, pieds au sol, omoplates serrées, les yeux sous la barre.",
      "Saisis la barre un peu plus large que les épaules et décroche-la bras tendus.",
      "Descends en contrôlant jusqu'au milieu de la poitrine, coudes à environ 45° du corps.",
      "Pousse pour remonter la barre jusqu'à bras tendus.",
    ],
    respiration: "Inspire en descendant, expire en poussant.",
    erreurs: [
      "Décoller les fesses du banc.",
      "Faire rebondir la barre sur la poitrine.",
      "Charger lourd sans pareur ni butées.",
    ],
    conseils: [
      "Demande un pareur ou règle les butées dès que la charge devient lourde.",
      "Garde les poignets droits, dans le prolongement des avant-bras.",
    ],
  ),
  "Rowing buste penché": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Dorsaux, rhomboïdes",
    musclesSecondaires: "Biceps, lombaires, arrière des épaules",
    etapes: [
      "Debout, barre en prise large, genoux fléchis, buste penché à environ 45°, dos plat.",
      "Laisse la barre pendre devant tes genoux, bras tendus.",
      "Tire la barre vers le bas du ventre en serrant les omoplates.",
      "Redescends lentement en contrôlant.",
    ],
    respiration: "Expire en tirant, inspire en redescendant.",
    erreurs: [
      "Arrondir le dos.",
      "Se servir de l'élan du buste pour monter la barre.",
      "Tirer la barre trop haut, vers la poitrine.",
    ],
    conseils: [
      "Choisis une charge modérée pour garder le dos plat.",
      "Garde les abdominaux serrés pendant toute la série.",
    ],
  ),
};