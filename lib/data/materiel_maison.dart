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
    charge: "Sert de poignée ou de tirage, sans charge propre.",
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
  ExerciceMaison(
    nom: "Curl biceps",
    muscles: "Biceps",
    auChoix: ['bidon5l', 'packEau', 'bouteilles', 'sacLeste'],
    consigne:
        "Debout, tiens ta charge le long du corps, coudes collés aux côtés. Plie les coudes pour monter la charge vers les épaules, puis redescends lentement.",
    securite: "Dos droit, sans balancer le corps pour aider le mouvement.",
  ),
  ExerciceMaison(
    nom: "Développé épaules",
    muscles: "Épaules, triceps",
    auChoix: ['bidon5l', 'bouteilles', 'packEau'],
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
    securite: "Garde les coudes légèrement fléchis et évite de hausser les épaules.",
  ),
  ExerciceMaison(
    nom: "Squat goblet",
    muscles: "Cuisses, fessiers",
    auChoix: ['sacLeste', 'bidon5l', 'packEau'],
    consigne:
        "Tiens la charge contre la poitrine. Pieds écartés à la largeur des épaules, descends en poussant les fesses en arrière, puis remonte en poussant dans les talons.",
    securite: "Dos droit et genoux dans l'axe des pieds.",
  ),
  ExerciceMaison(
    nom: "Soulevé de terre roumain",
    muscles: "Ischio-jambiers, fessiers, bas du dos",
    auChoix: ['packEau', 'bidon5l', 'sacLeste'],
    consigne:
        "Debout, charge devant les cuisses. Pousse les fesses vers l'arrière en gardant le dos plat, descends jusqu'aux genoux, puis remonte.",
    securite: "Ne ronde jamais le dos. Allège si tu ne sens pas les cuisses arrière.",
  ),
  ExerciceMaison(
    nom: "Tractions",
    muscles: "Dos, biceps",
    requis: ['barreTraction'],
    consigne:
        "Suspendu à la barre, mains un peu plus larges que les épaules. Tire jusqu'à passer le menton au-dessus de la barre, puis redescends lentement.",
    securite: "Descends toujours en contrôle et vérifie la barre avant de commencer.",
  ),
  ExerciceMaison(
    nom: "Tractions lestées",
    muscles: "Dos, biceps",
    requis: ['barreTraction'],
    auChoix: ['sacLeste'],
    consigne:
        "Mets le sac lesté sur le dos, bien serré, puis fais des tractions comme d'habitude, en commençant avec une charge légère.",
    securite:
        "Le sac ne doit pas bouger pendant le mouvement. Augmente la charge très progressivement.",
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
    nom: "Développé pectoraux avec élastique",
    muscles: "Pectoraux, triceps",
    requis: ['elastique'],
    consigne:
        "Passe l'élastique dans ton dos, une extrémité dans chaque main. Pousse les mains vers l'avant jusqu'à bras tendus, puis reviens doucement.",
    securite: "Garde l'élastique bien à plat dans le dos, sans qu'il remonte au cou.",
  ),
  ExerciceMaison(
    nom: "Dips sur chaise",
    muscles: "Triceps, épaules",
    requis: ['chaise'],
    consigne:
        "Assis au bord d'une chaise, mains de chaque côté des hanches. Glisse le bassin devant la chaise, plie les coudes pour descendre, puis repousse.",
    securite: "Chaise calée contre un mur. Ne descends pas trop bas si ça tire dans l'épaule.",
  ),
  ExerciceMaison(
    nom: "Rowing inversé sous la table",
    muscles: "Dos, biceps",
    requis: ['table'],
    consigne:
        "Allonge-toi sous la table, saisis le bord et tire la poitrine vers le plateau, corps gainé, puis redescends doucement.",
    securite:
        "Table très stable et lourde, sinon renonce. Garde la tête sous contrôle pour ne pas cogner le plateau.",
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
    nom: "Montées sur chaise",
    muscles: "Cuisses, fessiers",
    requis: ['chaise'],
    consigne:
        "Face à la chaise, pose un pied dessus et monte en poussant dans ce pied. Redescends doucement, puis change de jambe.",
    securite: "Chaise stable et calée contre un mur. Pose le pied entier sur l'assise.",
  ),
];