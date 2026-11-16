import 'echauffement.dart';

const List<Exercice> cardioExercices = [
  Exercice(
    nom: "Jumping jacks",
    duree: "40 secondes",
    zone: "Corps entier",
    consigne:
        "Saute en écartant les jambes et en levant les bras au-dessus de la tête, puis reviens pieds joints, bras le long du corps.",
    conseil: "Version sans impact : fais un pas sur le côté à la place du saut.",
  ),
  Exercice(
    nom: "Montées de genoux",
    duree: "30 secondes",
    zone: "Jambes, cardio",
    consigne:
        "Sur place, monte les genoux alternativement à hauteur de hanches, à un rythme soutenu, en balançant les bras.",
    conseil: "Reste bien grand, sans te pencher en arrière.",
  ),
  Exercice(
    nom: "Talons-fesses",
    duree: "30 secondes",
    zone: "Cuisses (arrière), cardio",
    consigne:
        "Sur place, ramène les talons vers les fesses en alternant, en courant sur place, coudes pliés.",
    conseil: "Pose l'avant du pied, pas le talon, pour amortir.",
  ),
  Exercice(
    nom: "Mountain climbers",
    duree: "30 secondes",
    zone: "Abdominaux, épaules, cardio",
    consigne:
        "En position de pompe, bras tendus. Ramène un genou vers la poitrine puis l'autre, en alternance rapide, comme si tu courais à l'horizontale.",
    conseil: "Garde les épaules au-dessus des mains et le bassin bas.",
  ),
  Exercice(
    nom: "Burpees",
    duree: "8 à 10 répétitions",
    zone: "Corps entier, cardio",
    consigne:
        "Debout, accroupis-toi et pose les mains au sol. Envoie les pieds en arrière en position de pompe, ramène-les, puis saute en levant les bras.",
    conseil: "Version plus douce : sans pompe et sans saut final.",
  ),
  Exercice(
    nom: "Squats sautés",
    duree: "12 répétitions",
    zone: "Cuisses, fessiers, cardio",
    consigne:
        "Descends en squat, puis saute le plus haut possible en poussant dans le sol. Réceptionne-toi en douceur, genoux fléchis, et enchaîne.",
    conseil: "Les genoux restent dans l'axe des pieds à la réception.",
  ),
  Exercice(
    nom: "Patineur (skaters)",
    duree: "30 secondes",
    zone: "Jambes, fessiers, cardio",
    consigne:
        "Saute latéralement d'une jambe sur l'autre en gardant le buste légèrement penché, comme un patineur. La jambe arrière passe derrière, sans toucher le sol.",
    conseil: "Si c'est trop intense, pose le pied au sol à chaque appui.",
  ),
  Exercice(
    nom: "Boxe dans le vide",
    duree: "45 secondes",
    zone: "Épaules, bras, cardio",
    consigne:
        "Appuis légèrement fléchis, poings devant le visage. Enchaîne des coups droits en alternant les bras, puis ajoute des déplacements.",
    conseil: "Ne bloque pas le coude à l'extension, garde les poings serrés mais les épaules détendues.",
  ),
];

const List<Exercice> streetWorkoutExercices = [
  Exercice(
    nom: "Pompes classiques",
    duree: "3 séries de 8 à 15",
    zone: "Pectoraux, triceps, épaules",
    consigne:
        "Mains un peu plus larges que les épaules, corps gainé de la tête aux talons. Descends la poitrine vers le sol, puis repousse.",
    conseil: "Ne laisse pas le bassin s'affaisser ni remonter.",
  ),
  Exercice(
    nom: "Pompes diamant",
    duree: "3 séries de 6 à 12",
    zone: "Triceps, pectoraux",
    consigne:
        "Mains rapprochées sous la poitrine, pouces et index formant un losange. Descends en gardant les coudes près du corps, puis repousse.",
    conseil: "Trop dur ? Fais-les sur les genoux.",
  ),
  Exercice(
    nom: "Pompes archer",
    duree: "3 séries de 5 par côté",
    zone: "Pectoraux, épaules, triceps",
    consigne:
        "Mains très écartées. Descends vers une main en gardant l'autre bras tendu, puis remonte et change de côté.",
    conseil: "Avance doucement, c'est un exercice avancé.",
  ),
  Exercice(
    nom: "Pompes pike",
    duree: "3 séries de 6 à 10",
    zone: "Épaules, triceps",
    consigne:
        "Bassin en l'air, corps en V inversé, mains et pieds au sol. Plie les coudes pour amener le sommet de la tête vers le sol, puis repousse.",
    conseil: "Avance les pieds vers les mains pour augmenter la difficulté.",
  ),
  Exercice(
    nom: "Planche (gainage)",
    duree: "3 séries de 30 à 45 secondes",
    zone: "Abdominaux, dos, épaules",
    consigne:
        "Appuyé sur les avant-bras et la pointe des pieds, corps aligné de la tête aux talons. Serre les abdominaux et les fessiers.",
    conseil: "Respire normalement, arrête-toi si le bas du dos se creuse.",
  ),
  Exercice(
    nom: "Planche latérale",
    duree: "3 séries de 20 à 30 secondes par côté",
    zone: "Obliques, hanches",
    consigne:
        "Sur le côté, appuyé sur l'avant-bras, pieds empilés. Lève le bassin pour aligner la tête, le bassin et les pieds.",
    conseil: "Pose le genou du dessous au sol pour une version plus facile.",
  ),
  Exercice(
    nom: "Hollow body",
    duree: "3 séries de 20 à 30 secondes",
    zone: "Abdominaux profonds",
    consigne:
        "Allongé sur le dos, bras tendus derrière la tête. Décolle les épaules et les jambes tendues du sol, bas du dos plaqué au sol.",
    conseil: "Si ton dos décolle, plie les genoux ou lève les jambes plus haut.",
  ),
  Exercice(
    nom: "Squat pistol assisté",
    duree: "3 séries de 5 par jambe",
    zone: "Cuisses, fessiers, équilibre",
    consigne:
        "Tiens-toi à un mur ou un cadre de porte. Sur une jambe, descends en squat, l'autre jambe tendue devant, puis remonte en t'aidant au besoin.",
    conseil: "Va doucement, tout le contrôle vient de la jambe d'appui.",
  ),
  Exercice(
    nom: "Fentes sautées",
    duree: "3 séries de 10 par jambe",
    zone: "Cuisses, fessiers, cardio",
    consigne:
        "En position de fente, saute et change de jambe en l'air, puis réceptionne-toi en fente de l'autre côté.",
    conseil: "Version plus douce : fentes alternées sans saut.",
  ),
];

const List<Exercice> homeWorkoutExercices = [
  Exercice(
    nom: "Squats",
    duree: "3 séries de 15",
    zone: "Cuisses, fessiers",
    consigne:
        "Pieds écartés à la largeur des épaules. Descends en poussant les fesses vers l'arrière, dos droit, puis remonte.",
    conseil: "Les genoux restent dans l'axe des pieds.",
  ),
  Exercice(
    nom: "Fentes arrière",
    duree: "3 séries de 10 par jambe",
    zone: "Cuisses, fessiers",
    consigne:
        "Fais un grand pas en arrière, descends le genou arrière vers le sol, puis reviens à la position de départ et change de jambe.",
    conseil: "Buste droit, genou avant au-dessus du pied.",
  ),
  Exercice(
    nom: "Pont fessier",
    duree: "3 séries de 15",
    zone: "Fessiers, ischio-jambiers",
    consigne:
        "Allongé sur le dos, genoux pliés, pieds au sol. Lève le bassin en serrant les fessiers, puis redescends lentement.",
    conseil: "Ne cambre pas le dos en haut du mouvement.",
  ),
  Exercice(
    nom: "Pont fessier une jambe",
    duree: "3 séries de 10 par jambe",
    zone: "Fessiers, ischio-jambiers",
    consigne:
        "Comme le pont fessier, mais une jambe tendue en l'air. Pousse avec le pied au sol pour lever le bassin.",
    conseil: "Garde le bassin bien horizontal.",
  ),
  Exercice(
    nom: "Pompes sur les genoux",
    duree: "3 séries de 10",
    zone: "Pectoraux, triceps",
    consigne:
        "Mains sous les épaules, genoux au sol, corps aligné des genoux à la tête. Descends la poitrine vers le sol, puis repousse.",
    conseil: "Garde le dos plat, sans cambrer ni arrondir.",
  ),
  Exercice(
    nom: "Dead bug",
    duree: "3 séries de 10 par côté",
    zone: "Abdominaux profonds",
    consigne:
        "Allongé sur le dos, bras tendus vers le plafond, genoux à 90°. Étends lentement un bras et la jambe opposée, puis reviens et change de côté.",
    conseil: "Le bas du dos reste collé au sol.",
  ),
  Exercice(
    nom: "Bird dog",
    duree: "3 séries de 10 par côté",
    zone: "Dos, fessiers, abdominaux",
    consigne:
        "À quatre pattes, étends un bras vers l'avant et la jambe opposée vers l'arrière, puis reviens et change de côté.",
    conseil: "Garde le bassin stable, sans balancer.",
  ),
  Exercice(
    nom: "Superman",
    duree: "3 séries de 12",
    zone: "Bas du dos, fessiers",
    consigne:
        "Allongé sur le ventre, bras tendus devant. Lève en même temps les bras et les jambes, tiens une seconde, puis redescends.",
    conseil: "Regarde le sol pour garder la nuque dans l'axe.",
  ),
  Exercice(
    nom: "Chaise contre un mur",
    duree: "3 séries de 30 à 45 secondes",
    zone: "Cuisses, fessiers",
    consigne:
        "Dos contre un mur, descends jusqu'à avoir les cuisses parallèles au sol, comme assis sur une chaise invisible. Tiens la position.",
    conseil: "Les genoux restent au-dessus des chevilles.",
  ),
  Exercice(
    nom: "Crunchs",
    duree: "3 séries de 15",
    zone: "Abdominaux",
    consigne:
        "Allongé sur le dos, genoux pliés, mains près des tempes. Soulève les épaules du sol en contractant les abdominaux, puis redescends lentement.",
    conseil: "Ne tire pas sur la nuque, regarde vers le plafond.",
  ),
];