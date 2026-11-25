import 'package:flutter/material.dart';

import '../data/session_hive.dart';
import '../models/session.dart';
import 'session_active_page.dart';

/// Écran « Récap de mes séances » : historique des séances enregistrées
/// (date, durée, exercices et séries). Glisse une carte vers la gauche
/// pour supprimer une séance.
class RecapSeancesPage extends StatefulWidget {
  const RecapSeancesPage({super.key});

  @override
  State<RecapSeancesPage> createState() => _RecapSeancesPageState();
}

class _RecapSeancesPageState extends State<RecapSeancesPage> {
  List<WorkoutSession> _sessions = [];
  bool _chargement = true;

  static const List<String> _jours = [
    'lundi',
    'mardi',
    'mercredi',
    'jeudi',
    'vendredi',
    'samedi',
    'dimanche',
  ];

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    final sessions = await sessionStorage.chargerToutes();
    sessions.sort((a, b) => b.debut.compareTo(a.debut)); // plus récentes d'abord
    if (mounted) {
      setState(() {
        _sessions = sessions;
        _chargement = false;
      });
    }
  }

  String _formatDate(DateTime d) {
    final jour = _jours[d.weekday - 1];
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    final h = d.hour.toString().padLeft(2, '0');
    final min = d.minute.toString().padLeft(2, '0');
    return '$jour $dd/$mm/${d.year} · $h:$min';
  }

  String _formatDuree(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h${m.toString().padLeft(2, '0')}';
    return '$m min';
  }

  String _resumeExercice(PerformedExercise ex) {
    if (ex.series.isEmpty) return 'Aucune série';
    final estDuree = ex.estDuree ?? SessionActivePage.isDureeExercice(ex.nom);
    if (estDuree) {
      final max =
          ex.series.map((s) => s.duree.inSeconds).reduce((a, b) => a > b ? a : b);
      return 'Durée max : ${max}s';
    }
    final repsMax = ex.series.map((s) => s.reps).reduce((a, b) => a > b ? a : b);
    return 'Max ${ex.poidsMax.toStringAsFixed(1)} kg × $repsMax reps';
  }

  Future<void> _supprimer(WorkoutSession session) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer cette séance ?'),
        content: Text(_formatDate(session.debut)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
    if (ok == true) {
      await sessionStorage.supprimerSession(session);
      await _charger();
    }
  }

  @override
  Widget build(BuildContext context) {
    final couleurs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Récap de mes séances')),
      body: _chargement
          ? const Center(child: CircularProgressIndicator())
          : _sessions.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.history, size: 64, color: couleurs.outline),
                        const SizedBox(height: 16),
                        const Text(
                          "Aucune séance enregistrée pour l'instant.\nTermine une séance d'entraînement pour la retrouver ici.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final s in _sessions)
                      Dismissible(
                        key: Key('session-${s.debut.millisecondsSinceEpoch}'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (_) async {
                          await _supprimer(s);
                          return false;
                        },
                        child: Card(
                          child: ExpansionTile(
                            leading: Icon(Icons.event, color: couleurs.primary),
                            title: Text(
                              _formatDate(s.debut),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${s.exercices.length} exercice(s) · ${s.totalSeries} série(s) · ${_formatDuree(s.dureeTotale())}'
                              '${s.estTerminee ? '' : ' · en cours'}',
                            ),
                            children: [
                              if (s.exercices.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('Aucun exercice dans cette séance.'),
                                ),
                              for (final ex in s.exercices)
                                ListTile(
                                  dense: true,
                                  leading: Icon(
                                    ex.fait ? Icons.check_circle : Icons.fitness_center,
                                    size: 20,
                                    color: ex.fait ? Colors.green : couleurs.outline,
                                  ),
                                  title: Text(
                                    ex.nom,
                                    style: TextStyle(
                                      decoration: ex.fait
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  subtitle: Text(_resumeExercice(ex)),
                                  trailing: Text('${ex.totalSeries} série(s)'),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
    );
  }
}
