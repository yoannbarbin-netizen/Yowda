class Exercice {
  final String nom;
  final String duree;
  final String zone;
  final String consigne;
  final String conseil;

  const Exercice({
    required this.nom,
    required this.duree,
    required this.zone,
    required this.consigne,
    required this.conseil,
  });
}

const List<Exercice> echauffement = [
  Exercice(
    nom: "Cercles de poignets",
    duree: "20 secondes",
    zone: "Poignets",
    consigne:
        "Lève les bras devant toi, mains en avant. Fais des cercles avec les poignets dans un sens, puis dans l'autre.",
    conseil: "Fais des mouvements lents et contrôlés pour éviter les tensions.",
  ),
  Exercice(
    nom: "Rotations du cou",
    duree: "30 secondes",
    zone: "Cou",
    consigne:
        "Debout, épaules relâchées. Incline doucement la tête d'un côté, puis fais un demi-cercle vers l'avant jusqu'à l'autre côté, en passant par le bas.",
    conseil: "Va lentement et ne renverse pas la tête vers l'arrière.",
  ),
  Exercice(
    nom: "Rotations des épaules",
    duree: "30 secondes",
    zone: "Épaules",
    consigne:
        "Debout, bras le long du corps. Fais de grands cercles avec les épaules, d'abord vers l'arrière, puis vers l'avant.",
    conseil: "Garde le cou détendu et respire calmement.",
  ),
  Exercice(
    nom: "Moulinets de bras",
    duree: "30 secondes",
    zone: "Épaules, haut du dos",
    consigne:
        "Debout, bras tendus sur les côtés. Fais des cercles avec les bras, petits au début puis de plus en plus grands, dans un sens puis dans l'autre.",
    conseil: "Commence doucement pour ne pas tirer sur l'épaule.",
  ),
  Exercice(
    nom: "Rotations du tronc",
    duree: "30 secondes",
    zone: "Taille, colonne",
    consigne:
        "Pieds écartés à la largeur des épaules, mains sur les hanches ou bras croisés. Tourne le buste à gauche puis à droite, bassin stable.",
    conseil: "Le mouvement vient du buste, pas des genoux.",
  ),
  Exercice(
    nom: "Chat-vache",
    duree: "10 répétitions",
    zone: "Colonne, dos",
    consigne:
        "À quatre pattes, mains sous les épaules, genoux sous les hanches. Creuse le dos en regardant devant toi, puis arrondis-le en rentrant le menton vers la poitrine.",
    conseil: "Fais le mouvement lentement, en inspirant en creusant et en expirant en arrondissant.",
  ),
  Exercice(
    nom: "Rotation thoracique",
    duree: "8 répétitions par côté",
    zone: "Haut du dos, thorax",
    consigne:
        "À quatre pattes, une main derrière la tête. Tourne le buste pour amener le coude vers le plafond en suivant ton coude du regard, puis reviens. Change de côté.",
    conseil: "Les hanches restent bien en place, seul le haut du dos tourne.",
  ),
  Exercice(
    nom: "Rotations des hanches",
    duree: "30 secondes",
    zone: "Hanches, bassin",
    consigne:
        "Mains sur les hanches, dessine de grands cercles avec le bassin, comme avec un cerceau. Change de sens à mi-parcours.",
    conseil: "Garde les pieds bien posés au sol.",
  ),
  Exercice(
    nom: "Rotations des chevilles",
    duree: "15 secondes par cheville",
    zone: "Chevilles",
    consigne:
        "Debout sur une jambe, avec un appui léger si besoin. Fais des cercles avec la pointe du pied dans un sens, puis dans l'autre. Change de jambe.",
    conseil: "Bouge uniquement la cheville, le genou reste immobile.",
  ),
  Exercice(
    nom: "Pont fessier léger",
    duree: "10 répétitions",
    zone: "Fessiers, bas du dos",
    consigne:
        "Allongé sur le dos, genoux fléchis, pieds à plat. Pousse dans les talons pour lever le bassin jusqu'à aligner genoux, hanches et épaules, puis redescends doucement.",
    conseil: "Serre les fessiers en haut, sans cambrer le bas du dos.",
  ),
  Exercice(
    nom: "Squats au poids du corps",
    duree: "10 répétitions",
    zone: "Cuisses, fessiers",
    consigne:
        "Pieds écartés à la largeur des épaules. Descends en poussant les fesses vers l'arrière, dos droit, puis remonte en poussant dans les talons.",
    conseil: "Les genoux restent dans l'axe des pieds.",
  ),
  Exercice(
    nom: "Fentes alternées",
    duree: "10 répétitions par jambe",
    zone: "Cuisses, fessiers",
    consigne:
        "Fais un grand pas en avant, descends le genou arrière vers le sol, puis reviens à la position de départ et change de jambe.",
    conseil: "Garde le buste droit et le genou avant au-dessus du pied.",
  ),
  Exercice(
    nom: "Montées de genoux",
    duree: "30 secondes",
    zone: "Jambes, cardio",
    consigne:
        "Sur place, monte les genoux alternativement vers la poitrine, à un rythme régulier, en balançant les bras.",
    conseil: "Commence tranquillement, puis augmente le rythme.",
  ),
  Exercice(
    nom: "Jumping jacks",
    duree: "30 secondes",
    zone: "Corps entier, cardio",
    consigne:
        "Saute en écartant les jambes et en levant les bras au-dessus de la tête, puis reviens pieds joints, bras le long du corps.",
    conseil: "Si les sauts te gênent, fais la version sans saut : un pied à la fois.",
  ),
];