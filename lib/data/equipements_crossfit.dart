import "package:flutter/material.dart";

/// Équipements CrossFit : modèle 3D (assets/models/) + utilisation.
/// Les noms correspondent EXACTEMENT au champ « equipement » du catalogue
/// CrossFit : les exercices se rattachent automatiquement.
class EquipementCrossfit {
  final String nom;
  final String modele; // chemin du fichier .glb
  final String utilisation;
  final IconData icone;
  const EquipementCrossfit({
    required this.nom,
    required this.modele,
    required this.utilisation,
    required this.icone,
  });
}

const List<EquipementCrossfit> equipementsCrossfit = [
  EquipementCrossfit(
    nom: "Box pliométrique",
    modele: "assets/models/box_pliometrique.glb",
    icone: Icons.view_in_ar_rounded,
    utilisation:
        "Sauts (box jump, box jump over, step-over) et burpee box jump over. Choisis une hauteur que tu maîtrises à 100 % et descends toujours en marchant.",
  ),
  EquipementCrossfit(
    nom: "Anneaux de gymnastique",
    modele: "assets/models/anneaux_gymnastique.glb",
    icone: Icons.radio_button_unchecked,
    utilisation:
        "Ring rows, ring dips et muscle-ups. L'instabilité des anneaux renforce épaules et gainage : parfait après les barres fixes.",
  ),
  EquipementCrossfit(
    nom: "Wall Ball / Médecine-ball",
    modele: "assets/models/wall_ball.glb",
    icone: Icons.sports_volleyball_rounded,
    utilisation:
        "Wall ball shots contre une cible (2,5 à 3 m). Poids courants : 4 à 9 kg. Un des meilleurs mouvements complets du CrossFit.",
  ),
  EquipementCrossfit(
    nom: "Corde d'escalade",
    modele: "assets/models/corde_escalade.glb",
    icone: Icons.arrow_upward_rounded,
    utilisation:
        "Montées avec clé de pied, puis sans les jambes. Apprends la clé de pied au sol avant de monter.",
  ),
  EquipementCrossfit(
    nom: "SkiErg",
    modele: "assets/models/skierg.glb",
    icone: Icons.downhill_skiing_rounded,
    utilisation:
        "Tirage double bras debout : cardio sans impact, très utilisé en intervalles (30 à 60 s ou 250 m).",
  ),
  EquipementCrossfit(
    nom: "Air Bike",
    modele: "assets/models/air_bike.glb",
    icone: Icons.directions_bike_rounded,
    utilisation:
        "Assault bike : bras + jambes ensemble. Une des machines les plus dures du CrossFit, idéale pour les sprints courts.",
  ),
  EquipementCrossfit(
    nom: "Machine GHD",
    modele: "assets/models/machine_ghd.glb",
    icone: Icons.event_seat_rounded,
    utilisation:
        "Glute-ham developer : sit-ups, extensions de dos et de hanches. Progression obligatoire, jamais de volume brutal.",
  ),
  EquipementCrossfit(
    nom: "Traîneau de poussée (Sled)",
    modele: "assets/models/traineau_sled.glb",
    icone: Icons.arrow_forward_rounded,
    utilisation:
        "Poussées et tirages de traîneau : puissance des jambes et du dos, sans impact. Pas courts et rapides.",
  ),
  EquipementCrossfit(
    nom: "Sandbag",
    modele: "assets/models/sandbag.glb",
    icone: Icons.shopping_bag_rounded,
    utilisation:
        "Cleans et portages avec un sac de sable : charge instable, travail complet du corps.",
  ),
  EquipementCrossfit(
    nom: "Barres parallèles",
    modele: "assets/models/barres_paralleles.glb",
    icone: Icons.view_week_rounded,
    utilisation:
        "Dips et L-sit : force des épaules, des triceps et du gainage. Base de la gymnastique CrossFit.",
  ),
];
