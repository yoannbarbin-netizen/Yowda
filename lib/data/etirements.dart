import 'echauffement.dart';

const List<Exercice> etirements = [
  Exercice(
    nom: "Étirement des mollets",
    duree: "30 secondes par jambe",
    zone: "Mollets",
    consigne:
        "Face à un mur, mains appuyées dessus. Place une jambe en arrière, talon au sol, et avance le bassin vers le mur jusqu'à sentir l'étirement dans le mollet.",
    conseil: "Garde la jambe arrière tendue et le talon bien posé.",
  ),
  Exercice(
    nom: "Étirement des quadriceps",
    duree: "30 secondes par jambe",
    zone: "Avant de la cuisse",
    consigne:
        "Debout, attrape ta cheville derrière toi et rapproche le talon du fessier. Garde les genoux proches l'un de l'autre. Appuie-toi à un mur si besoin.",
    conseil: "Ne cambre pas le dos, serre légèrement les abdominaux.",
  ),
  Exercice(
    nom: "Étirement des fléchisseurs de hanche",
    duree: "30 secondes par côté",
    zone: "Avant de la hanche, haut de la cuisse",
    consigne:
        "Mets un genou au sol, sur un coussin ou une serviette pliée, et l'autre pied devant toi. Garde le buste droit et avance doucement le bassin jusqu'à sentir l'étirement à l'avant de la hanche arrière.",
    conseil: "Serre la fesse du côté du genou au sol et ne creuse pas le bas du dos.",
  ),
  Exercice(
    nom: "Étirement des ischio-jambiers",
    duree: "30 secondes par jambe",
    zone: "Arrière de la cuisse",
    consigne:
        "Assis au sol, une jambe tendue, l'autre pliée. Penche le buste vers le pied de la jambe tendue, dos le plus droit possible.",
    conseil: "Va jusqu'à une tension légère, jamais jusqu'à la douleur.",
  ),
  Exercice(
    nom: "Étirement des adducteurs (papillon)",
    duree: "30 secondes",
    zone: "Intérieur des cuisses",
    consigne:
        "Assis au sol, plantes des pieds l'une contre l'autre, genoux écartés. Tiens tes chevilles, garde le dos droit et laisse les genoux descendre doucement vers le sol.",
    conseil: "Laisse la gravité agir, sans appuyer sur les genoux avec les mains.",
  ),
  Exercice(
    nom: "Étirement des fessiers",
    duree: "30 secondes par côté",
    zone: "Fessiers, hanches",
    consigne:
        "Allongé sur le dos, croise une cheville sur le genou opposé. Tire doucement la cuisse de la jambe du dessous vers ta poitrine.",
    conseil: "Garde la tête et les épaules posées au sol.",
  ),
  Exercice(
    nom: "Torsion lombaire allongée",
    duree: "30 secondes par côté",
    zone: "Bas du dos, hanches",
    consigne:
        "Allongé sur le dos, genoux pliés, bras écartés en croix. Laisse les deux genoux tomber doucement d'un côté, en gardant les épaules au sol, et tourne la tête de l'autre côté.",
    conseil: "La torsion reste douce, et tu arrêtes si tu ressens une douleur dans le bas du dos.",
  ),
  Exercice(
    nom: "Posture de l'enfant",
    duree: "45 secondes",
    zone: "Dos, hanches",
    consigne:
        "À genoux, assieds-toi sur les talons et avance les bras loin devant toi en posant le front au sol. Respire lentement.",
    conseil: "Laisse le dos se relâcher à chaque expiration.",
  ),
  Exercice(
    nom: "Posture du cobra",
    duree: "20 secondes",
    zone: "Abdominaux, devant du tronc",
    consigne:
        "Allongé sur le ventre, mains posées sous les épaules. Pousse doucement dans les mains pour relever la poitrine, en gardant le bassin au sol et les coudes légèrement fléchis.",
    conseil: "Monte seulement jusqu'à une tension douce, sans pincement dans le bas du dos.",
  ),
  Exercice(
    nom: "Étirement latéral du tronc",
    duree: "30 secondes par côté",
    zone: "Flanc, grands dorsaux",
    consigne:
        "Debout, pieds écartés à la largeur des épaules. Lève un bras au-dessus de la tête et penche doucement le buste du côté opposé, sans tourner le corps.",
    conseil: "Reste bien dans l'axe, comme entre deux vitres, sans pencher vers l'avant.",
  ),
  Exercice(
    nom: "Étirement des pectoraux",
    duree: "30 secondes par côté",
    zone: "Poitrine, épaules",
    consigne:
        "Debout près d'un mur ou d'un encadrement de porte. Pose l'avant-bras contre le mur, coude à hauteur d'épaule, et tourne doucement le buste dans le sens opposé.",
    conseil: "Ne force pas sur l'épaule, la tension reste dans la poitrine.",
  ),
  Exercice(
    nom: "Étirement des épaules (bras croisé)",
    duree: "30 secondes par bras",
    zone: "Arrière de l'épaule",
    consigne:
        "Passe un bras tendu devant ta poitrine. Avec l'autre main, appuie doucement sur ce bras, au niveau du coude, pour le rapprocher de toi.",
    conseil: "Garde l'épaule basse, sans la remonter vers l'oreille.",
  ),
  Exercice(
    nom: "Étirement du triceps",
    duree: "30 secondes par bras",
    zone: "Arrière du bras",
    consigne:
        "Lève un bras, plie le coude pour amener la main derrière la tête. Avec l'autre main, appuie doucement sur le coude.",
    conseil: "Garde le cou droit, sans pencher la tête en avant.",
  ),
  Exercice(
    nom: "Étirement des avant-bras",
    duree: "20 secondes par bras",
    zone: "Avant-bras, poignets",
    consigne:
        "Tends un bras devant toi, paume vers l'avant, doigts vers le haut. Avec l'autre main, ramène doucement les doigts vers toi. Puis tourne la paume vers le sol et ramène les doigts vers le bas.",
    conseil: "Garde le coude tendu mais pas bloqué, et reste sur une tension légère.",
  ),
  Exercice(
    nom: "Étirement du cou",
    duree: "20 secondes par côté",
    zone: "Cou, trapèzes",
    consigne:
        "Assis ou debout, penche doucement la tête vers une épaule, comme pour rapprocher l'oreille de l'épaule. Garde l'autre épaule basse.",
    conseil: "Pas de mouvement brusque, la main peut guider sans tirer.",
  ),
];