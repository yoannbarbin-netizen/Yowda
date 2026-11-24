import 'package:flutter/material.dart';
import '../data/echauffement.dart';
import 'session_active_page.dart';

class EchauffementPage extends StatelessWidget {
  const EchauffementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Échauffement')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Prends 5 à 10 minutes avant ta séance. Arrête-toi en cas de douleur.",
          ),
          const SizedBox(height: 12),
          for (final e in echauffement)
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

class ExerciceDetailPage extends StatelessWidget {
  final Exercice exercice;
  const ExerciceDetailPage({super.key, required this.exercice});

  @override
  Widget build(BuildContext context) {
    final titre = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(exercice.nom),
        actions: [
          IconButton(
            icon: const Icon(Icons.fitness_center, color: Colors.deepOrange),
            tooltip: 'Ajouter à l\'entraînement actif',
            onPressed: () => SessionActivePage.ajouterEtOuvrir(context, exercice.nom),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Zone : ${exercice.zone}', style: titre),
          const SizedBox(height: 8),
          Text('Durée : ${exercice.duree}', style: titre),
          const SizedBox(height: 16),
          Text('Comment faire', style: titre),
          const SizedBox(height: 4),
          Text(exercice.consigne),
          const SizedBox(height: 16),
          Text('Conseil', style: titre),
          const SizedBox(height: 4),
          Text(exercice.conseil),
        ],
      ),
    );
  }
}