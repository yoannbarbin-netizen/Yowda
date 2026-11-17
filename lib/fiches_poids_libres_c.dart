import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesPoidsLibresC = {
  "Squat arrière": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 6 à 10 répétitions",
    musclesPrincipaux: "Quadriceps, fessiers",
    musclesSecondaires: "Ischio-jambiers, lombaires, abdominaux",
    etapes: [
      "Règle la barre du rack à hauteur du milieu de la poitrine et les butées de sécurité sous ta profondeur de squat.",
      "Passe sous la barre, place-la sur les trapèzes, soulève-la du support et fais un ou deux pas en arrière.",
      "Descends en poussant les fesses vers l'arrière, jusqu'à avoir les cuisses au moins parallèles au sol.",
      "Remonte en poussant dans le sol, puis repose la barre sur le support en fin de série.",
    ],
    respiration: "Inspire et gaine avant de descendre, expire en remontant.",
    erreurs: [
      "Oublier de régler les butées de sécurité.",
      "Se pencher en avant et arrondir le dos.",
      "Faire rentrer les genoux vers l'intérieur.",
    ],
    conseils: [
      "Apprends d'abord avec la barre vide.",
      "En cas de difficulté, descends la barre sur les butées au lieu de t'accrocher à la série.",
    ],
  ),
  "Squat avant": FicheExercice(
    niveau: "Avancé",
    seriesReps: "3 séries de 6 à 8 répétitions",
    musclesPrincipaux: "Quadriceps",
    musclesSecondaires: "Fessiers, abdominaux, haut du dos",
    etapes: [
      "Place la barre sur l'avant des épaules, appuyée contre la gorge sans l'écraser, coudes hauts.",
      "Pieds à largeur d'épaules, buste droit.",
      "Descends en gardant le buste vertical, jusqu'à avoir les cuisses au moins parallèles au sol.",
      "Remonte en poussant dans le sol, coudes toujours hauts.",
    ],
    respiration: "Inspire et gaine avant de descendre, expire en remontant.",
    erreurs: [
      "Laisser les coudes descendre, ce qui fait tomber la barre.",
      "Pencher le buste vers l'avant.",
      "Charger trop avant d'avoir assez de mobilité de poignets et d'épaules.",
    ],
    conseils: [
      "Commence avec une barre vide ou très légère.",
      "Si la prise sur l'avant des épaules te gêne, travaille d'abord le goblet squat.",
    ],
  ),
  "Développé militaire debout": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 à 4 séries de 6 à 10 répétitions",
    musclesPrincipaux: "Épaules",
    musclesSecondaires: "Triceps, haut des pectoraux, abdominaux",
    etapes: [
      "Barre sur l'avant des épaules, au niveau des clavicules, prise un peu plus large que les épaules.",
      "Serre les fessiers et les abdominaux, pieds à largeur de hanches.",
      "Pousse la barre vers le haut, en reculant légèrement la tête pour la laisser passer, puis place-la au-dessus de la tête.",
      "Redescends lentement sur l'avant des épaules.",
    ],
    respiration: "Inspire avant de pousser, expire en montant.",
    erreurs: [
      "Cambrer le bas du dos pour aider la poussée.",
      "Pousser la barre vers l'avant au lieu de la verticale.",
      "Verrouiller violemment les coudes en haut.",
    ],
    conseils: [
      "Reste gainé : les abdominaux et les fessiers protègent le dos.",
      "Règle la barre du rack à hauteur de poitrine pour la décrocher sans effort.",
    ],
  ),
  "Tractions pronation": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 5 à 8 répétitions (selon ton niveau)",
    musclesPrincipaux: "Grands dorsaux",
    musclesSecondaires: "Biceps, arrière des épaules, abdominaux",
    etapes: [
      "Suspendu à la barre, paumes vers l'avant, mains un peu plus larges que les épaules.",
      "Active les épaules en les abaissant, abdominaux serrés.",
      "Tire les coudes vers le bas pour monter le menton au-dessus de la barre.",
      "Redescends lentement jusqu'à bras tendus.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Se balancer pour prendre de l'élan.",
      "Ne pas descendre complètement entre les répétitions.",
      "Hausser les épaules vers les oreilles.",
    ],
    conseils: [
      "Si tu n'y arrives pas encore, travaille avec un élastique d'assistance ou les descentes lentes.",
      "Vérifie que la barre est bien fixée avant de te suspendre.",
    ],
  ),
  "Tractions supination (chin-up)": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 5 à 8 répétitions (selon ton niveau)",
    musclesPrincipaux: "Grands dorsaux, biceps",
    musclesSecondaires: "Arrière des épaules, abdominaux",
    etapes: [
      "Suspendu à la barre, paumes vers toi, mains à largeur d'épaules.",
      "Active les épaules en les abaissant, abdominaux serrés.",
      "Tire les coudes vers le bas pour monter le menton au-dessus de la barre.",
      "Redescends lentement jusqu'à bras tendus.",
    ],
    respiration: "Expire en montant, inspire en descendant.",
    erreurs: [
      "Se balancer pour prendre de l'élan.",
      "Rester à mi-course sans passer le menton.",
      "Forcer sur les coudes si tu ressens une douleur.",
    ],
    conseils: [
      "Cette prise sollicite davantage les biceps, donc elle est souvent un peu plus facile.",
      "Arrête-toi en cas de douleur au coude ou à l'épaule.",
    ],
  ),
  "Relevés de genoux suspendu": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "3 séries de 8 à 12 répétitions",
    musclesPrincipaux: "Abdominaux",
    musclesSecondaires: "Fléchisseurs de hanche, avant-bras",
    etapes: [
      "Suspendu à la barre, épaules actives, jambes pendantes.",
      "Monte les genoux vers la poitrine en enroulant le bassin.",
      "Marque une courte pause en haut.",
      "Redescends lentement, sans te balancer.",
    ],
    respiration: "Expire en montant les genoux, inspire en descendant.",
    erreurs: [
      "Se balancer pour prendre de l'élan.",
      "Lever seulement les cuisses sans enrouler le bassin.",
      "Laisser les épaules remonter vers les oreilles.",
    ],
    conseils: [
      "Si tes avant-bras fatiguent avant tes abdominaux, utilise des sangles ou une station de dips.",
      "Plie les genoux pour une version plus facile, tends les jambes pour augmenter la difficulté.",
    ],
  ),
};