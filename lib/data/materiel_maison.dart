class Materiel {
  final String id;
  final String nom;
  final String categorie;
  final String charge;
  final String securite;

  const Materiel({
    required this.id,
    required this.nom,
    required this.categorie,
    required this.charge,
    required this.securite,
  });
}

class ExerciceMaison {
  final String nom;
  final String muscles;
  final List<String> requis;
  final List<String> auChoix;
  final String consigne;
  final String securite;

  const ExerciceMaison({
    required this.nom,
    required this.muscles,
    this.requis = const [],
    this.auChoix = const [],
    required this.consigne,
    required this.securite,
  });

  bool estPossible(Set<String> possede) {
    final toutLeRequis = requis.every(possede.contains);
    final unChoix = auChoix.isEmpty || auChoix.any(possede.contains);
    return toutLeRequis && unChoix;
  }
}

String nomMateriel(String id) =>
    materiels.firstWhere((m) => m.id == id).nom;

const List<Materiel> materiels = [
  Materiel(
    id: 'bidon5l',
    nom: "Bidon d'eau 5 L",
    categorie: "Poids improvisés",
    charge: "Environ 5 kg, avec une anse pour la prise.",
    securite: "Ferme bien le bouchon et évite un bidon fissuré ou glissant.",
  ),
  Materiel(
    id: 'packEau',
    nom: "Pack d'eau (6 × 1,5 L)",
    categorie: "Poids improvisés",
    charge: "Environ 9 kg, à tenir par le film ou sous le bras.",
    securite: "Vérifie que le film est solide avant de soulever.",
  ),
  Materiel(
    id: 'bouteilles',
    nom: "Bouteilles d'eau 1,5 L",
    categorie: "Poids improvisés",
    charge: "Environ 1,5 kg chacune, à prendre une par main.",
    securite: "Bien fermées, sans fuite, pour ne pas glisser.",
  ),
  Materiel(
    id: 'sacLeste',
    nom: "Sac à dos lesté",
    categorie: "Poids improvisés",
    charge: "Charge réglable : bouteilles d'eau, livres ou sable.",
    securite:
        "Commence léger. Serre les bretelles et place le poids contre le dos. Ne dépasse jamais une charge que tu contrôles.",
  ),
  Materiel(
    id: 'elastique',
    nom: "Élastique de musculation",
    categorie: "Accessoires",
    charge: "Résistance selon l'élastique et la longueur étirée.",
    securite: "Vérifie qu'il n'est pas abîmé et fixe-le solidement.",
  ),
  Materiel(
    id: 'serviette',
    nom: "Grande serviette",
    categorie: "Accessoires",
    charge: "Sert de glisseur sur sol lisse, sans charge propre.",
    securite: "Choisis une serviette solide, sans trou ni déchirure.",
  ),
  Materiel(
    id: 'barreTraction',
    nom: "Barre de traction (porte ou murale)",
    categorie: "Supports",
    charge: "Supporte ton poids du corps, selon le modèle.",
    securite:
        "Vérifie la fixation avant chaque séance. Ne l'utilise pas si le cadre de porte ou le mur est fragile.",
  ),
  Materiel(
    id: 'chaise',
    nom: "Chaise solide",
    categorie: "Mobilier",
    charge: "Sert d'appui, sans charge propre.",
    securite:
        "Sans roulettes, stable, appuyée contre un mur. Teste-la avant de lui confier ton poids.",
  ),
  Materiel(
    id: 'table',
    nom: "Table solide et lourde",
    categorie: "Mobilier",
    charge: "Sert de support pour les tirages au poids du corps.",
    securite:
        "Elle doit être très stable et ne pas bouger ni basculer. Si tu as un doute, ne t'en sers pas.",
  ),
];

const List<ExerciceMaison> exercicesMaison = [
  // ---------- Jambes ----------
  ExerciceMaison(
    nom: "Squat goblet",
    muscles: "Cuisses, fessiers",
    auChoix: ['sacLeste', 'bidon5l', 'packEau'],
    consigne:
        "Tiens la charge contre la poitrine. Pieds écartés à la largeur des épaules, descends en poussant les fesses en arrière, puis remonte en poussant dans les talons.",
    securite: "Dos droit et genoux dans l'axe des pieds.",
  ),
  ExerciceMaison(
    nom: "Squat bulgare",
    muscles: "Cuisses, fessiers",
    requis: ['chaise'],
    consigne:
        "Debout, dos à la chaise, pose le dessus d'un pied sur l'assise derrière toi. Descends en pliant la jambe avant, buste droit, puis remonte. Tu peux tenir un bidon ou une bouteille contre la poitrine pour augmenter la difficulté.",
    securite:
        "Chaise calée contre un mur. Garde le genou avant au-dessus du pied et commence sans charge.",
  ),
  ExerciceMaison(
    nom: "Fentes avec charge",
    muscles: "Cuisses, fessiers",
    auChoix: ['bouteilles', 'bidon5l', 'sacLeste'],
    consigne:
        "Tiens une charge dans chaque main (ou le bidon contre la poitrine, ou le sac sur le dos). Fais un grand pas en avant, descends le genou arrière vers le sol, puis reviens et change de jambe.",
    securite: "Buste droit, genou avant au-dessus du pied. Commence léger.",
  ),
  ExerciceMaison(
    nom: "Montées sur chaise",
    muscles: "Cuisses, fessiers",
    requis: ['chaise'],
    consigne:
        "Face à la chaise, pose un pied dessus et monte en poussant dans ce pied. Redescends doucement, puis change de jambe.",
    securite:
        "Chaise stable et calée contre un mur. Pose le pied entier sur l'assise.",
  ),
  ExerciceMaison(
    nom: "Soulevé de terre roumain",
    muscles: "Ischio-jambiers, fessiers, bas du dos",
    auChoix: ['packEau', 'bidon5l', 'sacLeste'],
    consigne:
        "Debout, charge devant les cuisses. Pousse les fesses vers l'arrière en gardant le dos plat, descends jusqu'aux genoux, puis remonte.",
    securite:
        "Ne ronde jamais le dos. Allège si tu ne sens pas les cuisses arrière.",
  ),
  ExerciceMaison(
    nom: "Hip thrust sur chaise",
    muscles: "Fessiers, ischio-jambiers",
    requis: ['chaise'],
    auChoix: ['sacLeste', 'bidon5l', 'packEau'],
    consigne:
        "Assis au sol, haut du dos appuyé contre le bord de l'assise, charge posée sur le bassin. Pousse dans les talons pour lever le bassin jusqu'à aligner épaules, hanches et genoux, puis redescends doucement.",
    securite:
        "Chaise calée contre un mur. Garde le menton rentré et ne cambre pas le bas du dos en haut du mouvement.",
  ),
  ExerciceMaison(
    nom: "Curl ischio-jambiers glissé",
    muscles: "Ischio-jambiers, fessiers",
    requis: ['serviette'],
    consigne:
        "Allongé sur le dos, talons posés sur la serviette, sur un sol lisse. Lève le bassin, puis glisse les pieds vers l'avant en gardant le bassin haut, et ramène-les vers les fesses.",
    securite:
        "Sol lisse et sec, sans tapis. Si les cuisses arrière crampent, arrête et recommence plus doucement.",
  ),
  ExerciceMaison(
    nom: "Montées sur pointes lestées",
    muscles: "Mollets",
    auChoix: ['bidon5l', 'sacLeste', 'bouteilles'],
    consigne:
        "Debout, charge tenue le long du corps ou sac sur le dos. Monte sur la pointe des pieds le plus haut possible, marque une pause, puis redescends lentement.",
    securite:
        "Appuie-toi à un mur pour l'équilibre et garde les chevilles bien droites.",
  ),

  // ---------- Pousser ----------
  ExerciceMaison(
    nom: "Développé pectoraux avec élastique",
    muscles: "Pectoraux, triceps",
    requis: ['elastique'],
    consigne:
        "Passe l'élastique dans ton dos, une extrémité dans chaque main. Pousse les mains vers l'avant jusqu'à bras tendus, puis reviens doucement.",
    securite:
        "Garde l'élastique bien à plat dans le dos, sans qu'il remonte au cou.",
  ),
  ExerciceMaison(
    nom: "Pompes pieds surélevés",
    muscles: "Haut des pectoraux, épaules, triceps",
    requis: ['chaise'],
    consigne:
        "Mains au sol sous les épaules, pieds posés sur l'assise de la chaise. Corps gainé de la tête aux talons, descends la poitrine vers le sol puis repousse.",
    securite:
        "Chaise calée contre un mur. Si le dos se creuse, remets les pieds au sol.",
  ),
  ExerciceMaison(
    nom: "Pompes lestées",
    muscles: "Pectoraux, triceps, épaules",
    auChoix: ['sacLeste'],
    consigne:
        "Mets le sac lesté sur le dos, bien serré. Fais des pompes mains sous les épaules, corps gainé de la tête aux talons.",
    securite:
        "Commence avec peu de poids. Si le dos se creuse, enlève du poids ou retire le sac.",
  ),
  ExerciceMaison(
    nom: "Dips sur chaise",
    muscles: "Triceps, épaules",
    requis: ['chaise'],
    consigne:
        "Assis au bord d'une chaise, mains de chaque côté des hanches. Glisse le bassin devant la chaise, plie les coudes pour descendre, puis repousse.",
    securite:
        "Chaise calée contre un mur. Ne descends pas sous un angle de 90° aux coudes et arrête si l'épaule tire ou pince.",
  ),
  ExerciceMaison(
    nom: "Développé épaules",
    muscles: "Épaules, triceps",
    auChoix: ['bidon5l', 'bouteilles'],
    consigne:
        "Debout ou assis, charge à hauteur d'épaules. Pousse vers le haut jusqu'à bras tendus, puis redescends en contrôlant.",
    securite: "Ne cambre pas le dos. Si ça tire dans le bas du dos, allège.",
  ),
  ExerciceMaison(
    nom: "Élévations latérales",
    muscles: "Épaules",
    requis: ['bouteilles'],
    consigne:
        "Une bouteille par main, bras le long du corps. Monte les bras sur les côtés jusqu'à hauteur d'épaules, puis redescends doucement.",
    securite:
        "Garde les coudes légèrement fléchis et évite de hausser les épaules.",
  ),
  ExerciceMaison(
    nom: "Extension triceps au-dessus de la tête",
    muscles: "Triceps",
    auChoix: ['bidon5l', 'bouteilles'],
    consigne:
        "Debout, tiens la charge à deux mains derrière la tête, coudes pointés vers le plafond. Tends les bras vers le haut, puis redescends lentement derrière la tête.",
    securite:
        "Garde les coudes près des oreilles, sans cambrer. Choisis une charge que tu tiens fermement.",
  ),

  // ---------- Tirer ----------
  ExerciceMaison(
    nom: "Tractions",
    muscles: "Dos, biceps",
    requis: ['barreTraction'],
    consigne:
        "Suspendu à la barre, mains un peu plus larges que les épaules. Tire jusqu'à passer le menton au-dessus de la barre, puis redescends lentement.",
    securite:
        "Descends toujours en contrôle et vérifie la barre avant de commencer.",
  ),
  ExerciceMaison(
    nom: "Tractions lestées",
    muscles: "Dos, biceps",
    requis: ['barreTraction'],
    auChoix: ['sacLeste'],
    consigne:
        "Mets le sac lesté sur le dos, bien serré, puis fais des tractions comme d'habitude, en commençant avec une charge légère.",
    securite:
        "Réservé à ceux qui enchaînent déjà plusieurs tractions propres sans charge. Le sac ne doit pas bouger pendant le mouvement. Augmente la charge très progressivement.",
  ),
  ExerciceMaison(
    nom: "Rowing avec élastique",
    muscles: "Dos, biceps",
    requis: ['elastique'],
    consigne:
        "Fixe l'élastique devant toi à hauteur de poitrine. Tire les coudes vers l'arrière en serrant les omoplates, puis reviens lentement.",
    securite: "Vérifie que l'attache de l'élastique est solide.",
  ),
  ExerciceMaison(
    nom: "Rowing inversé sous la table",
    muscles: "Dos, biceps",
    requis: ['table'],
    consigne:
        "Allonge-toi sous la table, saisis le bord et tire la poitrine vers le plateau, corps gainé, puis redescends doucement.",
    securite:
        "Table très stable et lourde, sinon renonce. Pas de table en verre ni à rallonges. Garde la tête sous contrôle pour ne pas cogner le plateau.",
  ),
  ExerciceMaison(
    nom: "Rowing unilatéral",
    muscles: "Dos, biceps",
    requis: ['chaise'],
    auChoix: ['bidon5l', 'bouteilles'],
    consigne:
        "Une main et un genou sur l'assise de la chaise, dos plat. De l'autre main, tiens la charge le bras tendu vers le sol, puis tire le coude vers le plafond en serrant l'omoplate, et redescends.",
    securite:
        "Chaise calée contre un mur. Garde le dos plat et évite de tourner le buste pour aider le mouvement.",
  ),
  ExerciceMaison(
    nom: "Haussements d'épaules",
    muscles: "Trapèzes",
    auChoix: ['bouteilles', 'bidon5l'],
    consigne:
        "Debout, une charge dans chaque main (ou le bidon devant toi à deux mains), bras le long du corps. Monte les épaules vers les oreilles, marque une pause, puis redescends lentement.",
    securite:
        "Fais le mouvement vers le haut, sans rouler les épaules. Garde le cou détendu.",
  ),

  // ---------- Bras ----------
  ExerciceMaison(
    nom: "Curl biceps",
    muscles: "Biceps",
    auChoix: ['bidon5l', 'packEau', 'bouteilles', 'sacLeste'],
    consigne:
        "Debout, tiens ta charge le long du corps, coudes collés aux côtés. Plie les coudes pour monter la charge vers les épaules, puis redescends lentement.",
    securite: "Dos droit, sans balancer le corps pour aider le mouvement.",
  ),
  ExerciceMaison(
    nom: "Curl biceps avec élastique",
    muscles: "Biceps",
    requis: ['elastique'],
    consigne:
        "Debout, un pied (ou les deux) posé sur le milieu de l'élastique, une extrémité dans chaque main. Plie les coudes pour monter les mains vers les épaules, puis redescends lentement.",
    securite:
        "Garde les coudes contre le corps et vérifie que l'élastique est bien calé sous le pied.",
  ),

  // ---------- Abdominaux et gainage ----------
  ExerciceMaison(
    nom: "Crunch lesté",
    muscles: "Abdominaux",
    auChoix: ['bouteilles', 'bidon5l'],
    consigne:
        "Allongé sur le dos, genoux pliés, charge tenue contre la poitrine. Soulève les épaules du sol en contractant les abdominaux, puis redescends lentement.",
    securite:
        "Ne tire pas sur la nuque. Commence avec la charge la plus légère.",
  ),
  ExerciceMaison(
    nom: "Relevés de genoux suspendu",
    muscles: "Abdominaux, fléchisseurs de hanche",
    requis: ['barreTraction'],
    consigne:
        "Suspendu à la barre, épaules actives. Monte les genoux vers la poitrine en enroulant le bassin, puis redescends lentement sans te balancer.",
    securite:
        "Vérifie la fixation de la barre. Arrête si les poignets ou les épaules tirent.",
  ),
  ExerciceMaison(
    nom: "Mountain climbers glissés",
    muscles: "Abdominaux, épaules, cardio",
    requis: ['serviette'],
    consigne:
        "En position de pompe, pieds posés sur la serviette, sur un sol lisse. Ramène un genou vers la poitrine en glissant le pied, puis l'autre, en alternance.",
    securite:
        "Sol lisse et sec, sans tapis. Commence lentement et arrête si les pieds filent trop.",
  ),
  ExerciceMaison(
    nom: "Marche du fermier",
    muscles: "Avant-bras, trapèzes, gainage",
    auChoix: ['bidon5l', 'packEau', 'bouteilles'],
    consigne:
        "Debout, tiens une charge dans chaque main (ou une seule, puis change de main). Marche 20 à 30 pas, buste droit et épaules basses.",
    securite:
        "Prends une charge que tu tiens fermement. Dégage le passage et évite les sols glissants.",
  ),
  ExerciceMaison(
    nom: "Marche latérale avec élastique",
    muscles: "Fessiers, hanches",
    requis: ['elastique'],
    consigne:
        "Passe l'élastique autour des cuisses, au-dessus des genoux. Pieds écartés, genoux légèrement fléchis, fais des pas latéraux en gardant l'élastique tendu.",
    securite:
        "Les genoux restent dans l'axe des pieds et le buste droit. Vérifie que l'élastique est en bon état.",
  ),
];