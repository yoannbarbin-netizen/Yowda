import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'fiches.dart';
import 'pages/session_active_page.dart';

const Map<String, String> modeles3d = {
  'Tirage vertical': 'assets/models/lat_pulldown.glb',
  'Leg Press': 'assets/models/leg_press_machine.glb',
  'Leg extension': 'assets/models/leg_extension.glb',
  'Leg curl': 'assets/models/seated_leg_curl_trainer.glb',
  'Chest press': 'assets/models/chest_press.glb',
  'Pec deck': 'assets/models/pec_deck.glb',
  'Shoulder press': 'assets/models/shoulder_press.glb',
  'Tirage horizontal': 'assets/models/seated_cable_row.glb',
  'Abducteurs / adducteurs': 'assets/models/seated_hip_abductor.glb',
  'Poulie haute (tirage)': 'assets/models/vertical_lat_pulldown.glb',
  'Poulie basse': 'assets/models/low_pulley.glb',
  'Vis-à-vis (câbles croisés)': 'assets/models/cable_crossover.glb',
  'Extension triceps à la corde': 'assets/models/triceps_pushdown.glb',
  'Face pull': 'assets/models/face_pull_station.glb',
  'Tapis de course': 'assets/models/treadmill.glb',
  'Vélo': 'assets/models/stationary_fitness_bike.glb',
  'Rameur': 'assets/models/indoor_rowing_machine.glb',
  'Elliptique': 'assets/models/elliptical_cross_trainer.glb',
  'Stepper': 'assets/models/stair_stepper.glb',
  'Barre droite': 'assets/models/olympic_barbell_four_weight_plates.glb',
  'Haltères': 'assets/models/pair_of_professional_hex_dumbbells.glb',
  'Barre de traction': 'assets/models/professional_freestanding_pull_up_bar.glb',
  'Rack à squat': 'assets/models/squat_rack.glb',
  'Élastiques': 'assets/models/resistance_bands.glb',
  'Barre EZ': 'assets/models/ez_curl_bar.glb',
  'Kettlebell': 'assets/models/kettlebell.glb',
  'Banc plat': 'assets/models/flat_weight_bench.glb',
  'Banc incliné': 'assets/models/incline_bench.glb',
  'Banc décliné': 'assets/models/decline_weight_bench.glb',
  'Banc réglable (dossier)': 'assets/models/incline_bench.glb',
  'Banc à abdos': 'assets/models/abdominal_bench.glb',
  'Corde à sauter': 'assets/models/fitness_jump_rope.glb',
  'Swiss ball': 'assets/models/swiss_stability_ball.glb',
  'Rouleau de massage': 'assets/models/foam_roller.glb',
};

class Equipement {
  final String nom;
  final String muscles;
  final List<String> exercices;
  const Equipement(this.nom, this.muscles, this.exercices);
}

class CategorieSalle {
  final String nom;
  final IconData icone;
  final List<Equipement> equipements;
  const CategorieSalle(this.nom, this.icone, this.equipements);
}

const categoriesSalle = [
  CategorieSalle('Machines guidées', Icons.settings, [
    Equipement('Leg Press', 'Quadriceps, fessiers', [
      'Presse jambes classique',
      'Presse pieds hauts (fessiers)',
      'Presse pieds serrés (quadriceps)',
    ]),
    Equipement('Leg extension', 'Quadriceps', [
      'Extension de jambes à deux jambes',
      'Extension unilatérale',
    ]),
    Equipement('Leg curl', 'Ischio-jambiers', [
      'Curl assis',
      'Curl allongé',
    ]),
    Equipement('Chest press', 'Pectoraux, triceps', [
      'Développé machine prise neutre',
      'Développé machine prise large',
    ]),
    Equipement('Pec deck', 'Pectoraux', [
      'Écartés à la machine',
      'Écartés inversés (arrière d\'épaules)',
    ]),
    Equipement('Shoulder press', 'Épaules, triceps', [
      'Développé épaules assis',
      'Développé unilatéral',
    ]),
    Equipement('Tirage vertical', 'Dos, biceps', [
      'Tirage prise large',
      'Tirage prise serrée neutre',
      'Tirage unilatéral',
    ]),
    Equipement('Tirage horizontal', 'Dos, biceps', [
      'Rowing assis prise neutre',
      'Rowing assis prise large',
    ]),
    Equipement('Abducteurs / adducteurs', 'Hanches, cuisses', [
      'Abduction assise',
      'Adduction assise',
    ]),
  ]),
  CategorieSalle('Poulies', Icons.compare_arrows, [
    Equipement('Poulie haute (tirage)', 'Dorsaux, biceps', [
      'Tirage nuque / poitrine',
      'Pull-over à la poulie',
      'Tirage bras tendus',
    ]),
    Equipement('Poulie basse', 'Dos, biceps, épaules', [
      'Rowing à la poulie basse',
      'Curl biceps à la poulie',
      'Élévations latérales à la poulie',
    ]),
    Equipement('Vis-à-vis (câbles croisés)', 'Pectoraux', [
      'Écartés poulies hautes',
      'Écartés poulies basses',
      'Développé à une main',
    ]),
    Equipement('Extension triceps à la corde', 'Triceps', [
      'Extension corde vers le bas',
      'Extension à la barre',
      'Extension nuque à la corde',
    ]),
    Equipement('Face pull', "Arrière d'épaules, trapèzes", [
      'Face pull à la corde',
      'Oiseau à la poulie',
    ]),
  ]),
  CategorieSalle('Bancs', Icons.event_seat, [
    Equipement('Banc plat', 'Pectoraux, triceps', [
      'Développé couché barre',
      'Développé couché haltères',
      'Pull-over haltère',
    ]),
    Equipement('Banc incliné', 'Haut des pectoraux, épaules', [
      'Développé incliné haltères',
      'Écartés inclinés',
    ]),
    Equipement('Banc décliné', 'Bas des pectoraux', [
      'Développé décliné barre',
      'Écartés déclinés',
    ]),
    Equipement('Banc réglable (dossier)', 'Épaules, bras', [
      'Développé militaire assis',
      'Curl incliné haltères',
      'Rowing buste penché (appui)',
    ]),
    Equipement('Banc à abdos', 'Abdominaux', [
      'Crunch incliné',
      'Relevé de jambes',
      'Crunch lesté',
    ]),
  ]),
  CategorieSalle('Poids libres', Icons.fitness_center, [
    Equipement('Haltères', 'Tout le corps', [
      'Curl biceps',
      'Élévations latérales',
      'Fentes marchées',
      'Soulevé de terre roumain',
    ]),
    Equipement('Barre droite', 'Pectoraux, dos, jambes', [
      'Squat',
      'Soulevé de terre',
      'Développé couché',
      'Rowing buste penché',
    ]),
    Equipement('Barre EZ', 'Biceps, triceps', [
      'Curl barre EZ',
      'Barre au front (triceps)',
      'Curl pupitre',
    ]),
    Equipement('Kettlebell', 'Corps entier, explosivité', [
      'Swing',
      'Goblet squat',
      'Turkish get-up',
    ]),
    Equipement('Rack à squat', 'Jambes, fessiers, dos', [
      'Squat arrière',
      'Squat avant',
      'Développé militaire debout',
    ]),
    Equipement('Barre de traction', 'Dos, biceps', [
      'Tractions pronation',
      'Tractions supination (chin-up)',
      'Relevés de genoux suspendu',
    ]),
  ]),
  CategorieSalle('Cardio', Icons.directions_run, [
    Equipement('Tapis de course', 'Jambes, endurance', [
      'Marche inclinée',
      'Course continue',
      'Fractionné (30 s / 30 s)',
    ]),
    Equipement('Vélo', 'Jambes, endurance', [
      'Pédalage régulier',
      'Intervalles de résistance',
    ]),
    Equipement('Rameur', 'Dos, jambes, bras', [
      'Rame continue 10 à 20 min',
      'Intervalles 500 m',
    ]),
    Equipement('Elliptique', 'Corps entier, faible impact', [
      'Séance continue',
      'Pédalage inversé',
    ]),
    Equipement('Stepper', 'Fessiers, cuisses', [
      'Montée continue',
      'Montée par intervalles',
    ]),
  ]),
  CategorieSalle('Accessoires', Icons.sports_gymnastics, [
    Equipement('Élastiques', 'Échauffement, renfo', [
      'Rotations d\'épaules',
      'Tirage élastique',
      'Marche latérale (fessiers)',
    ]),
    Equipement('Corde à sauter', 'Cardio, coordination', [
      'Saut simple',
      'Double saut',
      'Alternance de pieds',
    ]),
    Equipement('Swiss ball', 'Gainage, abdos', [
      'Planche sur ballon',
      'Crunch sur ballon',
      'Hip thrust, pieds sur ballon',
    ]),
    Equipement('Rouleau de massage', 'Récupération', [
      'Cuisses',
      'Dos (haut)',
      'Mollets',
    ]),
  ]),
];

class SallePage extends StatelessWidget {
  const SallePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salle de sport')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final c in categoriesSalle)
            Card(
              child: ExpansionTile(
                leading: Icon(c.icone),
                title: Text(c.nom),
                subtitle: Text('${c.equipements.length} équipements'),
                children: [
                  for (final e in c.equipements)
                    ListTile(
                      title: Text(e.nom),
                      subtitle: Text(e.muscles),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EquipementPage(equipement: e, icone: c.icone),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class EquipementPage extends StatelessWidget {
  final Equipement equipement;
  final IconData icone;
  const EquipementPage({
    super.key,
    required this.equipement,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final couleurs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(equipement.nom)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
         if (modeles3d.containsKey(equipement.nom))
            SizedBox(
              height: 300,
              child: ModelViewer(
                src: modeles3d[equipement.nom]!,
                alt: 'Modèle 3D : ${equipement.nom}',
                autoPlay: true,
                cameraControls: true,
                backgroundColor: const Color(0xFFEEEEEE),
              ),
            )
          else
            Container(
            height: 200,
            decoration: BoxDecoration(
              color: couleurs.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icone, size: 64, color: couleurs.primary),
                const SizedBox(height: 8),
                const Text('Miniature 3D à venir'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Muscles travaillés',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(equipement.muscles),
          const SizedBox(height: 24),
          Text('Exercices possibles',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          for (var i = 0; i < equipement.exercices.length; i++)
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(equipement.exercices[i]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fitness_center, color: Colors.deepOrange),
                      tooltip: 'Ajouter à l\'entraînement actif',
                      onPressed: () => SessionActivePage.ajouterEtOuvrir(context, equipement.exercices[i], estDuree: false),
                    ),
                    if (fiches.containsKey(equipement.exercices[i])) const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: fiches.containsKey(equipement.exercices[i])
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FichePage(
                              nom: equipement.exercices[i],
                              fiche: fiches[equipement.exercices[i]]!,
                            ),
                          ),
                        )
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}