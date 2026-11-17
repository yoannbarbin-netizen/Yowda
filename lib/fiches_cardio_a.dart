import 'package:appli_muscu/fiche_modele.dart';

const Map<String, FicheExercice> fichesCardioA = {
  "Marche inclinée": FicheExercice(
    niveau: "Débutant",
    seriesReps: "15 à 30 minutes",
    musclesPrincipaux: "Fessiers, ischio-jambiers, mollets",
    musclesSecondaires: "Quadriceps, système cardio-respiratoire",
    etapes: [
      "Monte sur le tapis, attache le clip de sécurité à ton vêtement et démarre à vitesse lente pendant 2 à 3 minutes.",
      "Règle l'inclinaison entre 5 et 10 %, en commençant plus bas si tu n'as pas l'habitude.",
      "Marche d'un pas régulier, buste droit, regard devant toi, bras qui balancent naturellement.",
      "Termine par 2 à 3 minutes plus lentes, avec l'inclinaison revenue à zéro.",
    ],
    respiration: "Respire de façon régulière : tu dois pouvoir parler en phrases courtes.",
    erreurs: [
      "S'accrocher aux barres avec tout le poids du corps.",
      "Se pencher en avant.",
      "Régler d'emblée une vitesse et une inclinaison trop élevées.",
    ],
    conseils: [
      "Augmente d'abord l'inclinaison avant la vitesse : c'est plus doux pour les articulations.",
      "Garde les mains libres ou posées légèrement sur les barres, sans t'y appuyer.",
    ],
  ),
  "Course continue": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "20 à 40 minutes à allure modérée",
    musclesPrincipaux: "Quadriceps, mollets, fessiers",
    musclesSecondaires: "Ischio-jambiers, abdominaux",
    etapes: [
      "Commence par 5 minutes de marche rapide pour t'échauffer.",
      "Passe à un petit trot, à une allure où tu peux encore parler.",
      "Pose le pied sous le corps, buste droit, bras pliés à 90° qui accompagnent la course.",
      "Termine par 5 minutes de marche pour redescendre progressivement.",
    ],
    respiration: "Garde un rythme régulier, par le nez et la bouche, sans te mettre en apnée.",
    erreurs: [
      "Partir trop vite dès les premières minutes.",
      "Allonger la foulée en posant le pied loin devant le corps.",
      "Regarder ses pieds, ce qui arrondit le dos.",
    ],
    conseils: [
      "Augmente la durée par paliers de 5 minutes plutôt que la vitesse.",
      "Porte des chaussures adaptées et arrête-toi en cas de douleur.",
    ],
  ),
  "Fractionné (30 s / 30 s)": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "8 à 12 cycles (10 à 15 minutes), après un échauffement",
    musclesPrincipaux: "Quadriceps, fessiers, mollets",
    musclesSecondaires: "Ischio-jambiers, système cardio-respiratoire",
    etapes: [
      "Fais 5 à 10 minutes d'échauffement progressif, en marchant puis en trottant.",
      "Cours 30 secondes à une allure soutenue, où parler devient difficile.",
      "Récupère 30 secondes en marchant ou en trottant très lentement.",
      "Enchaîne 8 à 12 cycles, puis fais 5 minutes de retour au calme.",
    ],
    respiration: "Respire profondément pendant la récupération pour faire redescendre le rythme cardiaque.",
    erreurs: [
      "Sprinter à fond dès le premier cycle.",
      "Sauter l'échauffement.",
      "Raccourcir la récupération quand on débute.",
    ],
    conseils: [
      "Commence par 6 cycles et augmente progressivement.",
      "Limite ce type de séance à 1 ou 2 fois par semaine.",
      "Arrête-toi en cas de vertige ou de douleur dans la poitrine, et demande un avis médical avant les séances intenses si tu as un doute sur ton cœur.",
    ],
  ),
  "Pédalage régulier": FicheExercice(
    niveau: "Débutant",
    seriesReps: "20 à 40 minutes",
    musclesPrincipaux: "Quadriceps, fessiers, mollets",
    musclesSecondaires: "Ischio-jambiers, système cardio-respiratoire",
    etapes: [
      "Règle la selle pour que la jambe reste légèrement fléchie quand la pédale est au point bas.",
      "Règle le guidon à une hauteur confortable, dos droit, épaules relâchées.",
      "Pédale à une cadence régulière, autour de 70 à 90 tours par minute, avec une résistance légère à modérée.",
      "Termine par 3 à 5 minutes de pédalage facile.",
    ],
    respiration: "Respire de façon régulière, sans bloquer l'air.",
    erreurs: [
      "Régler la selle trop bas, ce qui fatigue les genoux.",
      "Pédaler très lentement avec une résistance trop forte.",
      "Crisper les épaules et arrondir le dos.",
    ],
    conseils: [
      "Règle la selle avant chaque séance si plusieurs personnes utilisent le vélo.",
      "Garde les mains relâchées sur le guidon.",
    ],
  ),
  "Intervalles de résistance": FicheExercice(
    niveau: "Intermédiaire",
    seriesReps: "8 à 10 cycles (15 à 20 minutes), après un échauffement",
    musclesPrincipaux: "Quadriceps, fessiers",
    musclesSecondaires: "Mollets, ischio-jambiers, système cardio-respiratoire",
    etapes: [
      "Fais 5 minutes d'échauffement à résistance faible.",
      "Augmente la résistance pendant 30 à 60 secondes en gardant une cadence stable.",
      "Baisse la résistance et pédale facilement pendant 60 à 90 secondes.",
      "Répète les cycles, puis termine par 5 minutes de retour au calme.",
    ],
    respiration: "Garde une respiration profonde pendant la récupération.",
    erreurs: [
      "Régler une résistance si forte que la cadence s'effondre et que les genoux souffrent.",
      "Supprimer les phases de récupération.",
      "Se crisper sur le guidon pendant l'effort.",
    ],
    conseils: [
      "Tu dois pouvoir tenir une cadence régulière pendant tout l'effort.",
      "Augmente d'abord la durée des intervalles avant d'augmenter la résistance.",
    ],
  ),
};