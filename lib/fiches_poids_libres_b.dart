import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesPoidsLibresB = {
  "Curl barre EZ": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Biceps",
    musclesSecondaires: "Avant-bras, brachial",
    etapes: [
      "Debout, saisis la barre EZ sur les courbures, mains à largeur d'épaules, bras le long du corps.",
      "Garde les coudes collés au corps.",
      "Plie les coudes pour monter la barre vers les épaules.",
      "Redescends lentement jusqu'à presque tendre les bras.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Balancer le dos pour monter la barre.",
      "Avancer les coudes.",
      "Laisser tomber la barre en bas sans contrôle.",
    ],
    conseils: [
      "La forme de la barre EZ ménage les poignets : profites-en.",
      "Reste sur une charge qui garde le dos immobile.",
    ],
  ),
  "Barre au front (triceps)": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Triceps",
    musclesSecondaires: "Avant-bras, épaules",
    etapes: [
      "Allongé sur un banc plat, saisis la barre EZ bras tendus au-dessus de la poitrine.",
      "Garde les coudes pointés vers le plafond, serrés.",
      "Plie les coudes pour descendre la barre vers le front, sans bouger les bras.",
      "Étends les coudes pour remonter jusqu'à bras tendus.",
    ],
    respiration: "Inspire en descendant, expire en tendant les bras.",
    erreurs: [
      "Écarter les coudes sur les côtés.",
      "Descendre la barre trop vite vers le front.",
      "Choisir une charge trop lourde qui fait forcer sur les coudes.",
    ],
    conseils: [
      "Reste léger et contrôle la descente : cet exercice sollicite les coudes.",
      "Demande un pareur dès que la charge augmente.",
    ],
  ),
  "Curl pupitre": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Biceps",
    musclesSecondaires: "Brachial, avant-bras",
    etapes: [
      "Assis au pupitre, règle la hauteur pour que les aisselles reposent en haut du coussin.",
      "Saisis la barre EZ, bras posés sur le pupitre.",
      "Plie les coudes pour monter la barre vers les épaules.",
      "Redescends lentement, sans tendre complètement les bras en bas.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Laisser tomber la barre en bas, bras verrouillés.",
      "Décoller les coudes du coussin.",
      "Utiliser une charge trop lourde.",
    ],
    conseils: [
      "Arrête la descente juste avant la tension totale pour protéger le tendon du biceps.",
      "Prends une charge plus légère qu'en curl debout.",
    ],
  ),
  "Swing": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 10 à 15 répétitions",
    musclesPrincipaux: "Fessiers, ischio-jambiers",
    musclesSecondaires: "Lombaires, épaules, abdominaux",
    etapes: [
      "Pieds un peu plus larges que les épaules, kettlebell au sol devant toi.",
      "Pousse les fesses vers l'arrière, saisis la kettlebell à deux mains et bascule-la entre les jambes.",
      "Propulse les hanches vers l'avant : la kettlebell monte jusqu'à hauteur de poitrine, bras tendus.",
      "Laisse-la redescendre en poussant à nouveau les hanches vers l'arrière.",
    ],
    respiration: "Expire en propulsant les hanches, inspire en redescendant.",
    erreurs: [
      "Faire un squat au lieu d'un mouvement de hanches.",
      "Lever la kettlebell avec les bras.",
      "Arrondir le dos au moment de la bascule.",
    ],
    conseils: [
      "Les bras ne sont que des cordes : c'est la poussée des hanches qui fait monter la charge.",
      "Commence avec une charge légère et apprends d'abord le mouvement de hanches sans kettlebell.",
    ],
  ),
  "Goblet squat": FicheExercice(
    niveau: "Débutant",
    seriesReps: "3 séries de 10 à 12 répétitions",
    musclesPrincipaux: "Quadriceps, fessiers",
    musclesSecondaires: "Abdominaux, haut du dos",
    etapes: [
      "Tiens la kettlebell contre la poitrine, par les cornes, coudes vers le bas.",
      "Pieds un peu plus larges que les épaules, pointes légèrement ouvertes.",
      "Descends en poussant les fesses vers l'arrière, coudes entre les genoux.",
      "Pousse dans le sol pour remonter.",
    ],
    respiration: "Inspire en descendant, expire en remontant.",
    erreurs: [
      "Laisser la kettlebell s'éloigner de la poitrine.",
      "Décoller les talons.",
      "Arrondir le dos en bas du mouvement.",
    ],
    conseils: [
      "C'est un excellent exercice pour apprendre le squat.",
      "Garde le regard devant toi pour rester droit.",
    ],
  ),
  "Turkish get-up": FicheExercice(
    niveau: "Avancé",
    seriesReps: "2 à 3 séries de 3 à 5 répétitions par côté",
    musclesPrincipaux: "Corps entier, épaules, abdominaux",
    musclesSecondaires: "Fessiers, cuisses",
    etapes: [
      "Allongé sur le dos, kettlebell tenue bras tendu au-dessus de l'épaule, genou du même côté plié, pied au sol.",
      "Roule sur le coude opposé, puis sur la main, en gardant les yeux sur la kettlebell.",
      "Lève le bassin, passe la jambe tendue derrière toi pour poser le genou au sol.",
      "Redresse-toi en fente, puis debout, et redescends en inversant chaque étape.",
    ],
    respiration: "Respire calmement, sans bloquer l'air, à chaque étape.",
    erreurs: [
      "Perdre le bras tendu au-dessus de l'épaule.",
      "Aller trop vite sans maîtriser chaque position.",
      "Démarrer avec une charge trop lourde.",
    ],
    conseils: [
      "Apprends d'abord le mouvement sans charge, ou avec un objet léger posé sur le poing.",
      "Prévois de la place et un sol plat, sans glissement.",
    ],
  ),
};