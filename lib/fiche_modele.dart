import 'package:flutter/material.dart';
import 'data/echauffements.dart';
import 'gifs_exercices.dart';
import 'pages/session_active_page.dart';

class FicheExercice {
  final String niveau;
  final String seriesReps;
  final String musclesPrincipaux;
  final String musclesSecondaires;
  final List<String> etapes;
  final String respiration;
  final List<String> erreurs;
  final List<String> conseils;

  const FicheExercice({
    required this.niveau,
    required this.seriesReps,
    required this.musclesPrincipaux,
    required this.musclesSecondaires,
    required this.etapes,
    required this.respiration,
    required this.erreurs,
    required this.conseils,
  });
}

class FichePage extends StatelessWidget {
  final String nom;
  final FicheExercice fiche;
  /// Type de saisie pour le bouton « Ajouter » : true = durée, false = poids/reps
  /// (défaut, comportement historique de la salle), null = déduire du nom (CrossFit).
  final bool? estDuree;
  const FichePage({super.key, required this.nom, required this.fiche, this.estDuree = false});

  Widget _titre(BuildContext context, String texte) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(texte, style: Theme.of(context).textTheme.titleMedium),
      );

  @override
  Widget build(BuildContext context) {
    final couleurs = Theme.of(context).colorScheme;
    final recoEchauffement = echauffementPour(nom);
    return Scaffold(
      appBar: AppBar(
        title: Text(nom),
        actions: [
          IconButton(
            icon: const Icon(Icons.fitness_center, color: Colors.deepOrange),
            tooltip: 'Ajouter à l\'entraînement actif',
            onPressed: () => SessionActivePage.ajouterEtOuvrir(context, nom, estDuree: estDuree),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (gifsExercices.containsKey(nom))
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 260,
                width: double.infinity,
                color: const Color(0xFFEEEEEE),
                child: Image.asset(
                  gifsExercices[nom]!,
                  fit: BoxFit.contain,
                  gaplessPlayback: true,
                  errorBuilder: (context, error, stack) =>
                      const Center(child: Text('Animation indisponible')),
                ),
              ),
            )
          else
            Container(
            height: 180,
            decoration: BoxDecoration(
              color: couleurs.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_circle_outline,
                    size: 56, color: couleurs.primary),
                const SizedBox(height: 8),
                const Text('Illustration / animation à venir'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(fiche.niveau)),
              Chip(label: Text(fiche.seriesReps)),
            ],
          ),
          _titre(context, 'Muscles principaux'),
          Text(fiche.musclesPrincipaux),
          _titre(context, 'Muscles secondaires'),
          Text(fiche.musclesSecondaires),
          _titre(context, 'Échauffement conseillé'),
          Card(
            child: ListTile(
              leading: const Icon(Icons.local_fire_department_rounded,
                  color: Colors.deepOrange),
              title: Text(
                recoEchauffement.minutes == 0
                    ? 'Aucun échauffement nécessaire'
                    : '${recoEchauffement.minutes} min',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(recoEchauffement.consigne),
            ),
          ),
          _titre(context, 'Exécution'),
          for (var i = 0; i < fiche.etapes.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 12, child: Text('${i + 1}')),
                  const SizedBox(width: 12),
                  Expanded(child: Text(fiche.etapes[i])),
                ],
              ),
            ),
          _titre(context, 'Respiration'),
          Text(fiche.respiration),
          _titre(context, 'Erreurs fréquentes'),
          for (final e in fiche.erreurs)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.close, size: 18, color: couleurs.error),
                  const SizedBox(width: 8),
                  Expanded(child: Text(e)),
                ],
              ),
            ),
          _titre(context, 'Conseils'),
          for (final c in fiche.conseils)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check, size: 18, color: couleurs.primary),
                  const SizedBox(width: 8),
                  Expanded(child: Text(c)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}