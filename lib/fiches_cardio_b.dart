import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesCardioB = {
  "Rame continue 10 à 20 min": FicheExercice(
    niveau: "Débutant",
    seriesReps: "10 à 20 minutes à allure modérée",
    musclesPrincipaux: "Dorsaux, quadriceps, fessiers",
    musclesSecondaires: "Biceps, abdominaux, lombaires",
    etapes: [
      "Assieds-toi, pieds sanglés sur les repose-pieds, saisis la poignée bras tendus, buste légèrement penché en avant.",
      "Pousse d'abord avec les jambes, bras tendus.",
      "Quand les jambes sont presque tendues, incline le buste légèrement en arrière et tire la poignée vers le bas de la poitrine.",
      "Reviens dans l'ordre inverse : bras, buste, puis jambes, en contrôlant.",
    ],
    respiration: "Expire pendant la poussée, inspire pendant le retour.",
    erreurs: [
      "Tirer avec les bras avant d'avoir poussé avec les jambes.",
      "Arrondir le dos.",
      "Revenir trop vite, en se précipitant sur les genoux.",
    ],
    conseils: [
      "Règle la résistance à un niveau modéré : plus fort ne veut pas dire plus efficace.",
      "Commence par apprendre la technique pendant 5 minutes, à un rythme lent, d'environ 20 à 24 coups par minute.",
    ],
  ),
  "Intervalles 500 m": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "4 à 6 fois 500 m, avec 1 à 2 minutes de récupération",
    musclesPrincipaux: "Dorsaux, quadriceps, fessiers",
    musclesSecondaires: "Biceps, abdominaux, lombaires",
    etapes: [
      "Fais 5 à 10 minutes d'échauffement à rythme facile.",
      "Rame 500 m à une allure soutenue, en gardant une technique propre.",
      "Récupère 1 à 2 minutes en ramant très doucement ou en faisant une pause.",
      "Répète 4 à 6 fois, puis fais 5 minutes de retour au calme.",
    ],
    respiration: "Garde une respiration rythmée pendant l'effort et récupère profondément entre les séries.",
    erreurs: [
      "Partir trop vite sur le premier 500 m.",
      "Laisser la technique se dégrader en fin d'effort.",
      "Raccourcir la récupération quand on débute.",
    ],
    conseils: [
      "Essaie de garder le même temps sur chaque 500 m plutôt que de tout donner au début.",
      "Arrête la série si le dos s'arrondit ou si la technique se perd.",
    ],
  ),
  "Séance continue": FicheExercice(
    niveau: "Débutant",
    seriesReps: "20 à 40 minutes à allure modérée",
    musclesPrincipaux: "Quadriceps, fessiers, mollets",
    musclesSecondaires: "Épaules, bras, dos",
    etapes: [
      "Monte sur l'elliptique avec précaution, pieds à plat sur les pédales, mains sur les poignées.",
      "Démarre doucement, en poussant avec les jambes et en accompagnant avec les bras.",
      "Garde le buste droit, regard devant, épaules basses.",
      "Règle une résistance modérée et maintiens une cadence régulière.",
    ],
    respiration: "Respire de façon régulière : tu dois pouvoir parler en phrases courtes.",
    erreurs: [
      "S'appuyer sur les poignées avec tout le poids du corps.",
      "Décoller les talons des pédales.",
      "Aller vite avec une résistance nulle, sans vraiment travailler.",
    ],
    conseils: [
      "L'elliptique convient bien quand les genoux sont sensibles aux chocs.",
      "Change de temps en temps de résistance pour varier l'effort.",
    ],
  ),
  "Pédalage inversé": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "5 à 10 minutes, en alternance avec le sens normal",
    musclesPrincipaux: "Ischio-jambiers, fessiers",
    musclesSecondaires: "Mollets, quadriceps",
    etapes: [
      "Pédale d'abord dans le sens normal pendant quelques minutes pour t'échauffer.",
      "Inverse le sens de pédalage, en pédalant vers l'arrière.",
      "Garde une cadence lente et une résistance légère, buste droit.",
      "Reviens au sens normal pour terminer ta séance.",
    ],
    respiration: "Respire de façon régulière, sans retenir ton souffle.",
    erreurs: [
      "Pédaler trop vite à l'envers, en perdant le contrôle.",
      "Se pencher en arrière.",
      "Régler une résistance trop forte pour cette position inhabituelle.",
    ],
    conseils: [
      "Cette variante sollicite davantage l'arrière des cuisses et les fessiers.",
      "Si ton modèle ne permet pas de pédaler à l'envers, passe à un autre exercice.",
    ],
  ),
  "Montée continue": FicheExercice(
    niveau: "Débutant",
    seriesReps: "10 à 20 minutes",
    musclesPrincipaux: "Fessiers, quadriceps",
    musclesSecondaires: "Mollets, ischio-jambiers",
    etapes: [
      "Monte sur le stepper, pieds à plat sur les pédales, mains posées légèrement sur les poignées.",
      "Appuie à tour de rôle sur chaque pédale, à une cadence régulière.",
      "Garde le buste droit et les épaules relâchées.",
      "Règle une résistance modérée, avec des pas de bonne amplitude.",
    ],
    respiration: "Respire de façon régulière : tu dois pouvoir parler en phrases courtes.",
    erreurs: [
      "S'appuyer sur les barres avec tout le poids du corps.",
      "Faire de tout petits pas, uniquement sur la pointe des pieds.",
      "Se pencher en avant sur la console.",
    ],
    conseils: [
      "Garde les pieds à plat et pousse dans les talons pour solliciter les fessiers.",
      "Commence par 10 minutes et augmente progressivement.",
    ],
  ),
  "Montée par intervalles": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "8 à 10 cycles (30 secondes rapides, 60 secondes lentes)",
    musclesPrincipaux: "Fessiers, quadriceps",
    musclesSecondaires: "Mollets, système cardio-respiratoire",
    etapes: [
      "Fais 5 minutes d'échauffement à cadence tranquille.",
      "Monte 30 secondes à une cadence rapide, avec des pas bien amples.",
      "Récupère 60 secondes à cadence lente.",
      "Répète 8 à 10 cycles, puis fais 5 minutes de retour au calme.",
    ],
    respiration: "Garde une respiration profonde pendant la récupération.",
    erreurs: [
      "Aller si vite que les pas deviennent minuscules.",
      "S'accrocher aux barres pendant les phases rapides.",
      "Sauter les phases de récupération.",
    ],
    conseils: [
      "Privilégie des pas amples et contrôlés plutôt que la vitesse pure.",
      "Commence par 5 cycles et augmente progressivement.",
    ],
  ),
};