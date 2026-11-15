import 'package:flutter/material.dart';

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
  const FichePage({super.key, required this.nom, required this.fiche});

  Widget _titre(BuildContext context, String texte) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(texte, style: Theme.of(context).textTheme.titleMedium),
      );

  @override
  Widget build(BuildContext context) {
    final couleurs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(nom)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
                const Text('Illustration / animation � venir'),
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
          _titre(context, 'Ex�cution'),
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
          _titre(context, 'Erreurs fr�quentes'),
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