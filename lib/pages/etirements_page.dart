import 'package:flutter/material.dart';
import '../data/etirements.dart';
import 'echauffement_page.dart';
import 'session_active_page.dart';

class EtirementsPage extends StatelessWidget {
  const EtirementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Étirements')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "À faire après la séance, muscles chauds. Reste en tension légère, sans rebondir, en respirant calmement. Arrête-toi en cas de douleur.",
          ),
          const SizedBox(height: 12),
          for (final e in etirements)
            Card(
              child: ListTile(
                title: Text(e.nom),
                subtitle: Text('${e.zone} · ${e.duree}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fitness_center, color: Colors.deepOrange),
                      tooltip: 'Ajouter à l\'entraînement actif',
                      onPressed: () => SessionActivePage.ajouterEtOuvrir(context, e.nom),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciceDetailPage(exercice: e),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}