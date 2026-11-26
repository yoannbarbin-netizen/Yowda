import "package:flutter/material.dart";
import "package:model_viewer_plus/model_viewer_plus.dart";

import "../data/crossfit.dart";
import "../data/equipements_crossfit.dart";
import "../fiches.dart";
import "../theme/app_theme.dart";
import "session_active_page.dart";

/// Détail d'un équipement CrossFit : modèle 3D, utilisation et exercices.
class EquipementCrossfitPage extends StatelessWidget {
  final EquipementCrossfit equipement;
  const EquipementCrossfitPage({super.key, required this.equipement});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final exercices = tousExercicesCrossfit
        .where((e) => e.equipement == equipement.nom)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(equipement.nom)),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          SizedBox(
            height: 300,
            child: ModelViewer(
              src: equipement.modele,
              alt: "Modèle 3D : ${equipement.nom}",
              autoPlay: true,
              cameraControls: true,
              backgroundColor: const Color(0xFFEEEEEE),
            ),
          ),
          const SizedBox(height: Sp.lg),
          Text("Utilisation", style: t.textTheme.titleMedium),
          const SizedBox(height: Sp.xs),
          Text(equipement.utilisation),
          const SizedBox(height: Sp.xl),
          Text("Exercices avec cet équipement (${exercices.length})",
              style: t.textTheme.titleMedium),
          const SizedBox(height: Sp.sm),
          for (final ex in exercices)
            Card(
              child: ListTile(
                title: Text(ex.nom),
                subtitle: Text(ex.niveau),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fitness_center,
                          color: Colors.deepOrange),
                      tooltip: "Ajouter à l'entraînement actif",
                      onPressed: () => SessionActivePage.ajouterEtOuvrir(
                          context, ex.nom,
                          estDuree: null),
                    ),
                    if (fiches.containsKey(ex.nom))
                      const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: fiches.containsKey(ex.nom)
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FichePage(
                              nom: ex.nom,
                              fiche: fiches[ex.nom]!,
                              estDuree: null,
                            ),
                          ),
                        )
                    : null,
              ),
            ),
          const SizedBox(height: Sp.xl),
        ],
      ),
    );
  }
}
