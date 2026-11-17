import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesAccessoiresB = {
  "Planche sur ballon": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 20 à 40 secondes",
    musclesPrincipaux: "Abdominaux, épaules",
    musclesSecondaires: "Fessiers, dos",
    etapes: [
      "À genoux devant le ballon, pose les avant-bras dessus, coudes sous les épaules.",
      "Étends les jambes derrière toi, pieds au sol, corps aligné de la tête aux talons.",
      "Serre les abdominaux et les fessiers, et garde la position.",
      "Respire calmement, puis repose-toi à genoux.",
    ],
    respiration: "Respire de façon régulière, sans retenir ton souffle.",
    erreurs: [
      "Laisser le bassin s'affaisser ou remonter.",
      "Hausser les épaules vers les oreilles.",
      "Se balancer d'avant en arrière.",
    ],
    conseils: [
      "Écarte les pieds pour être plus stable.",
      "Utilise un sol non glissant et un ballon bien gonflé.",
    ],
  ),
  "Crunch sur ballon": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 12 à 20 répétitions",
    musclesPrincipaux: "Abdominaux",
    musclesSecondaires: "Obliques",
    etapes: [
      "Assieds-toi sur le ballon, puis avance les pieds jusqu'à ce que le bas du dos repose sur le ballon.",
      "Pieds à largeur d'épaules, mains près des tempes ou croisées sur la poitrine.",
      "Enroule le haut du buste vers l'avant en contractant les abdominaux.",
      "Redescends lentement en t'étirant légèrement sur le ballon, sans perdre l'équilibre.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Tirer sur la nuque avec les mains.",
      "Laisser le ballon rouler pendant le mouvement.",
      "Faire un mouvement trop ample, qui sollicite le bas du dos.",
    ],
    conseils: [
      "Écarte les pieds pour gagner en stabilité.",
      "Choisis un ballon adapté à ta taille : assis dessus, les cuisses doivent être à peu près à l'horizontale.",
    ],
  ),
  "Hip thrust, pieds sur ballon": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Fessiers, ischio-jambiers",
    musclesSecondaires: "Lombaires, abdominaux",
    etapes: [
      "Allongé sur le dos, bras le long du corps, talons posés sur le ballon, jambes presque tendues.",
      "Pousse dans les talons pour lever le bassin jusqu'à aligner épaules, hanches et pieds.",
      "Marque une courte pause en haut en serrant les fessiers.",
      "Redescends lentement sans poser complètement le bassin.",
    ],
    respiration: "Expire en montant le bassin, inspire en redescendant.",
    erreurs: [
      "Cambrer le bas du dos en haut du mouvement.",
      "Laisser le ballon glisser sur le côté.",
      "Redescendre trop vite.",
    ],
    conseils: [
      "Si c'est trop difficile, pose les pieds au sol pour faire un pont fessier classique.",
      "Utilise un tapis antidérapant ou place le ballon contre un mur pour limiter son glissement.",
    ],
  ),
  "Cuisses": FicheExercice(
    niveau: "Débutant",
    seriesReps: "30 à 60 secondes par jambe",
    musclesPrincipaux: "Quadriceps (avant des cuisses)",
    musclesSecondaires: "Ischio-jambiers (variante arrière)",
    etapes: [
      "Allongé face au sol, appuyé sur les avant-bras, place le rouleau sous le haut des cuisses.",
      "Fais rouler le rouleau lentement vers les genoux, en t'arrêtant avant l'articulation.",
      "Ralentis sur les zones sensibles et respire pendant quelques secondes.",
      "Pour l'arrière des cuisses, assieds-toi, rouleau sous les cuisses, et fais-le rouler vers les genoux.",
    ],
    respiration: "Respire lentement et profondément pour relâcher les muscles.",
    erreurs: [
      "Rouler directement sur le genou ou sur l'articulation.",
      "Aller trop vite.",
      "Appuyer jusqu'à ressentir une douleur vive.",
    ],
    conseils: [
      "La sensation doit rester supportable : inconfort léger, pas de douleur.",
      "Évite de rouler sur une zone blessée, enflée ou inflammée.",
    ],
  ),
  "Dos (haut)": FicheExercice(
    niveau: "Débutant",
    seriesReps: "30 à 60 secondes",
    musclesPrincipaux: "Haut du dos, trapèzes, rhomboïdes",
    musclesSecondaires: "Épaules",
    etapes: [
      "Allongé sur le dos, place le rouleau sous le haut du dos, au niveau des omoplates.",
      "Genoux pliés, pieds au sol, mains croisées derrière la tête pour soutenir la nuque.",
      "Lève légèrement le bassin et fais rouler le rouleau du bas des omoplates jusqu'au haut du dos.",
      "Reviens lentement en gardant le contrôle.",
    ],
    respiration: "Respire lentement pendant que tu fais rouler le rouleau.",
    erreurs: [
      "Rouler sur le bas du dos (les lombaires).",
      "Tirer sur la nuque ou cambrer le cou.",
      "Aller trop vite.",
    ],
    conseils: [
      "Reste sur le haut du dos, entre les omoplates et la base du cou.",
      "Garde la tête soutenue par tes mains.",
    ],
  ),
  "Mollets": FicheExercice(
    niveau: "Débutant",
    seriesReps: "30 à 60 secondes par jambe",
    musclesPrincipaux: "Mollets",
    musclesSecondaires: "Tendon d'Achille (zone voisine)",
    etapes: [
      "Assis au sol, jambes tendues, place le rouleau sous les mollets, mains posées au sol derrière toi.",
      "Soulève légèrement les fesses du sol.",
      "Fais rouler le rouleau du bas du mollet jusqu'en dessous du genou.",
      "Pour plus de pression, croise une jambe sur l'autre.",
    ],
    respiration: "Respire lentement et profondément pour relâcher le muscle.",
    erreurs: [
      "Rouler sur l'arrière du genou.",
      "Aller trop vite.",
      "Appuyer jusqu'à ressentir une douleur vive.",
    ],
    conseils: [
      "Tourne légèrement le pied vers l'intérieur puis vers l'extérieur pour varier la zone.",
      "Évite de rouler sur une zone blessée ou douloureuse.",
    ],
  ),
};