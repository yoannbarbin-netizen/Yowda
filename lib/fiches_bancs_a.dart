import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesBancsA = {
  "Développé couché barre": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 6 à 10 répétitions",
    musclesPrincipaux: "Pectoraux",
    musclesSecondaires: "Triceps, avant des épaules",
    etapes: [
      "Allonge-toi sur le banc plat, les yeux sous la barre, pieds bien à plat au sol.",
      "Serre les omoplates et garde-les en arrière pendant tout l'exercice.",
      "Saisis la barre un peu plus large que les épaules, décroche-la et descends-la en contrôlant jusqu'au milieu de la poitrine.",
      "Pousse pour remonter la barre jusqu'à bras tendus, au-dessus des épaules.",
    ],
    respiration: "Inspire à la descente, expire pendant la poussée.",
    erreurs: [
      "Décoller les fesses du banc pour aider la poussée.",
      "Faire rebondir la barre sur la poitrine.",
      "Écarter les coudes à 90° du corps, ce qui sollicite trop l'épaule.",
      "Charger lourd sans butées de sécurité ni pareur.",
    ],
    conseils: [
      "Règle les butées du rack ou demande un pareur dès que la charge devient lourde.",
      "Garde les poignets droits, dans le prolongement des avant-bras.",
    ],
  ),
  "Développé couché haltères": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Pectoraux",
    musclesSecondaires: "Triceps, avant des épaules",
    etapes: [
      "Assis au bord du banc, haltères posés sur les cuisses, allonge-toi en les montant vers les épaules.",
      "Place les haltères à hauteur de poitrine, paumes vers les pieds, omoplates serrées.",
      "Pousse les haltères vers le haut en les rapprochant légèrement, jusqu'à bras tendus.",
      "Redescends lentement jusqu'à ce que les coudes soient un peu sous la ligne du banc.",
    ],
    respiration: "Inspire en descendant, expire en poussant.",
    erreurs: [
      "Descendre trop bas en forçant sur les épaules.",
      "Cambrer exagérément le bas du dos.",
      "Laisser les haltères partir dans des directions différentes.",
    ],
    conseils: [
      "Commence plus léger qu'avec la barre, pour apprendre à contrôler chaque haltère.",
      "En fin de série, ramène les haltères sur les cuisses avant de t'asseoir.",
    ],
  ),
  "Pull-over haltère": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Pectoraux, grands dorsaux",
    musclesSecondaires: "Triceps, épaules",
    etapes: [
      "Allongé sur le banc, tiens un haltère à deux mains, bras presque tendus au-dessus de la poitrine.",
      "Garde les coudes très légèrement fléchis.",
      "Descends l'haltère derrière la tête en arc de cercle, jusqu'à sentir l'étirement du buste.",
      "Ramène l'haltère au-dessus de la poitrine en contractant les pectoraux et les dorsaux.",
    ],
    respiration: "Inspire à la descente, expire à la remontée.",
    erreurs: [
      "Plier les coudes et transformer l'exercice en extension du triceps.",
      "Descendre trop bas en cambrant le dos.",
      "Choisir un haltère trop lourd.",
    ],
    conseils: [
      "Tiens l'haltère fermement, à deux mains, en le soutenant par un des disques.",
      "Garde un mouvement lent et reste léger.",
    ],
  ),
  "Développé incliné haltères": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Pectoraux (partie haute)",
    musclesSecondaires: "Avant des épaules, triceps",
    etapes: [
      "Règle le banc entre 30 et 45° et assieds-toi, dos et tête bien calés.",
      "Monte les haltères à hauteur de poitrine, paumes vers l'avant.",
      "Pousse vers le haut jusqu'à bras tendus, sans verrouiller les coudes.",
      "Redescends lentement, coudes à environ 45° du corps.",
    ],
    respiration: "Inspire en descendant, expire en poussant.",
    erreurs: [
      "Régler le banc trop haut : le travail passe sur les épaules.",
      "Faire rebondir les haltères en bas.",
      "Écarter les coudes à l'extrême.",
    ],
    conseils: [
      "Une inclinaison d'environ 30° suffit pour cibler le haut des pectoraux.",
      "Garde les omoplates serrées sur le dossier.",
    ],
  ),
  "Écartés inclinés": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Pectoraux (partie haute)",
    musclesSecondaires: "Avant des épaules",
    etapes: [
      "Sur un banc incliné à environ 30°, tiens les haltères bras tendus au-dessus de la poitrine, coudes légèrement fléchis.",
      "Ouvre les bras en arc de cercle, jusqu'à sentir l'étirement des pectoraux.",
      "Ramène les haltères au-dessus de la poitrine en serrant les pectoraux.",
    ],
    respiration: "Inspire à l'ouverture, expire en rapprochant les bras.",
    erreurs: [
      "Plier les coudes et faire un développé.",
      "Descendre trop bas, ce qui tire sur l'épaule.",
      "Charge trop lourde.",
    ],
    conseils: [
      "Utilise des haltères légers : le mouvement est de l'isolation.",
      "Imagine que tu enlaces un gros arbre.",
    ],
  ),
  "Développé décliné barre": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 8 à 10 répétitions",
    musclesPrincipaux: "Pectoraux (partie basse)",
    musclesSecondaires: "Triceps, avant des épaules",
    etapes: [
      "Allonge-toi sur le banc décliné, pieds bien calés sous les coussins.",
      "Saisis la barre un peu plus large que les épaules et décroche-la bras tendus.",
      "Descends la barre en contrôlant jusqu'au bas de la poitrine.",
      "Pousse pour remonter jusqu'à bras tendus.",
    ],
    respiration: "Inspire en descendant, expire en poussant.",
    erreurs: [
      "Mal caler les pieds sous les coussins.",
      "Faire rebondir la barre sur la poitrine.",
      "Charger lourd sans pareur ni butées.",
    ],
    conseils: [
      "Utilise un pareur ou des butées, car il est difficile de se dégager de cette position.",
      "Redresse-toi doucement en fin de série pour éviter les vertiges.",
    ],
  ),
  "Écartés déclinés": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 12 à 15 répétitions",
    musclesPrincipaux: "Pectoraux (partie basse)",
    musclesSecondaires: "Avant des épaules",
    etapes: [
      "Allongé sur le banc décliné, pieds calés, haltères au-dessus de la poitrine, coudes légèrement fléchis.",
      "Ouvre les bras en arc de cercle jusqu'à sentir l'étirement.",
      "Ramène les haltères au-dessus de la poitrine en serrant les pectoraux.",
    ],
    respiration: "Inspire à l'ouverture, expire en refermant.",
    erreurs: [
      "Plier les coudes pour faire un développé.",
      "Descendre trop bas en forçant sur l'épaule.",
      "Utiliser des haltères trop lourds.",
    ],
    conseils: [
      "Reste léger et contrôle chaque répétition.",
      "Redresse-toi doucement en fin de série pour éviter les vertiges.",
    ],
  ),
};