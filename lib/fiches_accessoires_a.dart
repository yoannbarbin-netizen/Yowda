import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesAccessoiresA = {
  "Rotations d'épaules": FicheExercice(
    niveau: "Débutant",
    seriesReps: "2 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Coiffe des rotateurs, arrière des épaules",
    musclesSecondaires: "Trapèzes, haut du dos",
    etapes: [
      "Debout, tiens l'élastique à deux mains devant les cuisses, avec une prise large, bras tendus.",
      "Monte les bras tendus au-dessus de la tête, en gardant l'élastique tendu.",
      "Passe doucement les bras vers l'arrière, jusqu'à hauteur des hanches derrière toi, si ta mobilité le permet.",
      "Reviens lentement par le même chemin.",
    ],
    respiration: "Respire calmement, sans bloquer l'air pendant le mouvement.",
    erreurs: [
      "Tenir l'élastique avec une prise trop serrée, ce qui force sur les épaules.",
      "Cambrer le bas du dos en passant derrière la tête.",
      "Faire le mouvement brusquement.",
    ],
    conseils: [
      "Écarte les mains plus largement tant que tu ne passes pas confortablement.",
      "Exercice idéal en échauffement, arrête-toi si tu ressens une douleur à l'épaule.",
    ],
  ),
  "Tirage élastique": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Dorsaux, rhomboïdes",
    musclesSecondaires: "Biceps, arrière des épaules",
    etapes: [
      "Assis au sol, jambes tendues devant toi, passe l'élastique autour de la plante des pieds, une extrémité dans chaque main.",
      "Garde le dos droit, bras tendus, épaules basses.",
      "Tire les coudes vers l'arrière en serrant les omoplates.",
      "Reviens lentement, bras tendus, en gardant l'élastique tendu.",
    ],
    respiration: "Expire en tirant, inspire en revenant.",
    erreurs: [
      "Arrondir le dos.",
      "Hausser les épaules vers les oreilles.",
      "Relâcher l'élastique d'un coup au retour.",
    ],
    conseils: [
      "Vérifie que l'élastique est en bon état et qu'il ne glisse pas de tes pieds.",
      "Choisis une résistance qui te permet de garder le dos droit pendant toute la série.",
    ],
  ),
  "Marche latérale (fessiers)": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 15 pas de chaque côté",
    musclesPrincipaux: "Fessiers (moyen fessier), hanches",
    musclesSecondaires: "Cuisses, abdominaux",
    etapes: [
      "Passe l'élastique autour des cuisses, au-dessus des genoux.",
      "Pieds écartés à largeur d'épaules, genoux légèrement fléchis, buste droit.",
      "Fais un pas latéral en gardant l'élastique tendu, puis ramène l'autre pied sans qu'ils se touchent.",
      "Enchaîne les pas dans un sens, puis reviens dans l'autre.",
    ],
    respiration: "Respire de façon régulière tout au long de l'exercice.",
    erreurs: [
      "Laisser les genoux rentrer vers l'intérieur.",
      "Pencher le buste d'un côté.",
      "Rejoindre les pieds entre chaque pas, ce qui détend l'élastique.",
    ],
    conseils: [
      "Pose l'élastique plus bas, sur les chevilles, pour augmenter la difficulté.",
      "Garde les pas petits et contrôlés.",
    ],
  ),
  "Saut simple": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 à 5 séries de 30 à 60 secondes",
    musclesPrincipaux: "Mollets, épaules",
    musclesSecondaires: "Cuisses, avant-bras, système cardio-respiratoire",
    etapes: [
      "Choisis la bonne longueur : debout sur la corde, les poignées doivent arriver sous les aisselles.",
      "Tiens les poignées près des hanches, coudes proches du corps.",
      "Fais tourner la corde avec les poignets et saute en petits sauts bas, sur l'avant des pieds.",
      "Réceptionne-toi en douceur, genoux souples.",
    ],
    respiration: "Respire de façon régulière, sans bloquer l'air.",
    erreurs: [
      "Sauter trop haut.",
      "Faire tourner la corde avec tout le bras au lieu des poignets.",
      "Atterrir sur les talons.",
    ],
    conseils: [
      "Saute sur une surface qui amortit, pas sur du béton.",
      "Arrête-toi si tu ressens une douleur aux tibias, aux chevilles ou aux genoux.",
    ],
  ),
  "Double saut": FicheExercice(
    niveau: "Avancé",
    seriesReps: "5 à 10 séries de 5 à 15 répétitions, selon ton niveau",
    musclesPrincipaux: "Mollets, épaules",
    musclesSecondaires: "Cuisses, avant-bras, abdominaux",
    etapes: [
      "Maîtrise d'abord le saut simple, de façon fluide, pendant plus d'une minute.",
      "Saute un peu plus haut que d'habitude, en gardant le corps gainé.",
      "Fais tourner la corde plus vite, d'un coup de poignets, pour qu'elle passe deux fois sous les pieds.",
      "Réceptionne-toi en douceur, puis reviens à un saut simple pour récupérer.",
    ],
    respiration: "Respire normalement entre les doubles sauts, sans retenir l'air pendant l'effort.",
    erreurs: [
      "Plier les genoux vers l'arrière pour laisser passer la corde.",
      "Tirer avec les bras au lieu d'accélérer avec les poignets.",
      "Ne pas sauter assez haut pour laisser passer deux tours de corde.",
    ],
    conseils: [
      "Exercice exigeant pour les mollets et les tendons d'Achille : augmente le volume progressivement.",
      "Utilise une corde légère et rapide.",
    ],
  ),
  "Alternance de pieds": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 à 5 séries de 30 à 60 secondes",
    musclesPrincipaux: "Mollets, cuisses",
    musclesSecondaires: "Épaules, système cardio-respiratoire",
    etapes: [
      "Tiens la corde comme pour le saut simple, poignées près des hanches.",
      "Fais tourner la corde et pose un pied après l'autre, comme si tu courais sur place.",
      "Garde les sauts bas, un pied léger au sol à chaque tour de corde.",
      "Garde le buste droit, regard devant toi.",
    ],
    respiration: "Respire de façon régulière à mesure que le rythme s'installe.",
    erreurs: [
      "Lever les genoux trop haut.",
      "Crisper les épaules.",
      "Accélérer le rythme avant d'être à l'aise.",
    ],
    conseils: [
      "Cette variante est moins éprouvante pour les articulations que les sauts à pieds joints.",
      "Commence par de courtes séries et augmente la durée progressivement.",
    ],
  ),
};