import 'package:flutter/material.dart';
import '../data/echauffement.dart';
import '../data/sans_materiel.dart';
import 'echauffement_page.dart';

class SansMaterielPage extends StatelessWidget {
  const SansMaterielPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sans matériel'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Cardio'),
              Tab(text: 'Street workout'),
              Tab(text: 'Home workout'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ListeExercices(
              intro:
                  "Enchaîne 30 à 45 secondes d'effort et 15 secondes de repos, sur 3 à 4 tours. Si tu as mal aux genoux, choisis les versions sans saut.",
              exercices: cardioExercices,
            ),
            _ListeExercices(
              intro:
                  "Exercices au poids du corps, plutôt pour les gens qui ont déjà un peu de force. Avance par étapes et garde une bonne technique.",
              exercices: streetWorkoutExercices,
            ),
            _ListeExercices(
              intro:
                  "Exercices simples à faire chez toi, dans un petit espace. Idéal pour débuter ou entretenir sa forme.",
              exercices: homeWorkoutExercices,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListeExercices extends StatelessWidget {
  final String intro;
  final List<Exercice> exercices;
  const _ListeExercices({required this.intro, required this.exercices});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(intro),
        const SizedBox(height: 4),
        const Text("Arrête-toi en cas de douleur."),
        const SizedBox(height: 12),
        for (final e in exercices)
          Card(
            child: ListTile(
              title: Text(e.nom),
              subtitle: Text('${e.zone} · ${e.duree}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciceDetailPage(exercice: e),
                ),
              ),
            ),
          ),
      ],
    );
  }
}