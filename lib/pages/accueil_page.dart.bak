import 'package:flutter/material.dart';

import '../data/session_hive.dart';
import '../models/session.dart';
import '../salle_page.dart';
import '../theme/app_theme.dart';
import '../widgets/category_card.dart';
import 'echauffement_page.dart';
import 'etirements_page.dart';
import 'materiel_maison_page.dart';
import 'sans_materiel_page.dart';
import 'session_active_page.dart';

/// Accueil : séance du jour, statistiques et catégories.
class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  List<WorkoutSession> _sessions = [];
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    final sessions = await sessionStorage.chargerToutes();
    sessions.sort((a, b) => b.debut.compareTo(a.debut));
    if (mounted) {
      setState(() {
        _sessions = sessions;
        _chargement = false;
      });
    }
  }

  WorkoutSession? get _enCours {
    final list = _sessions.where((s) => !s.estTerminee).toList();
    return list.isEmpty ? null : list.first;
  }

  List<WorkoutSession> get _terminees =>
      _sessions.where((s) => s.estTerminee).toList();

  Future<void> _ouvrirSeance() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SessionActivePage()),
    );
    await _charger();
  }

  String _heure(DateTime d) {
    final h = d.hour.toString().padLeft(2, '0');
    final min = d.minute.toString().padLeft(2, '0');
    return '$h:$min';
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cats = t.extension<CategoryColors>() ?? CategoryColors.light;

    return Scaffold(
      appBar: AppBar(title: const Text('Appli Muscu')),
      body: _chargement
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(Sp.lg),
              children: [
                _carteSeanceDuJour(t),
                const SizedBox(height: Sp.lg),
                _stats(t),
                const SizedBox(height: Sp.xl),
                Text('Catégories', style: t.textTheme.titleLarge),
                const SizedBox(height: Sp.md),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: Sp.md,
                  crossAxisSpacing: Sp.md,
                  childAspectRatio: 2.3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CategoryCard(
                        icon: Icons.local_fire_department_rounded,
                        label: 'Échauffement',
                        subtitle: '14 exercices',
                        color: cats.warmup,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EchauffementPage()))),
                    CategoryCard(
                        icon: Icons.fitness_center_rounded,
                        label: 'Salle de sport',
                        subtitle: '34 équipements',
                        color: cats.gym,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SallePage()))),
                    CategoryCard(
                        icon: Icons.home_rounded,
                        label: 'Matériel maison',
                        subtitle: '37 exercices',
                        color: cats.home,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MaterielMaisonPage()))),
                    CategoryCard(
                        icon: Icons.self_improvement_rounded,
                        label: 'Sans matériel',
                        subtitle: '35 exercices',
                        color: cats.bodyweight,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SansMaterielPage()))),
                    CategoryCard(
                        icon: Icons.accessibility_new_rounded,
                        label: 'Étirements',
                        subtitle: '15 exercices',
                        color: cats.stretching,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EtirementsPage()))),
                  ],
                ),
                const SizedBox(height: Sp.xl),
              ],
            ),
    );
  }

  Widget _carteSeanceDuJour(ThemeData t) {
    final s = t.colorScheme;
    final enCours = _enCours;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sp.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: s.primary.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(Rd.md),
                  ),
                  child: Icon(Icons.bolt_rounded, color: s.primary, size: 28),
                ),
                const SizedBox(width: Sp.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Séance du jour', style: t.textTheme.titleMedium),
                      Text(
                        enCours == null
                            ? "Aucune séance en cours — prêt à t'entraîner ?"
                            : 'En cours depuis ${_heure(enCours.debut)} · ${enCours.exercices.length} exercice(s)',
                        style: t.textTheme.bodyMedium
                            ?.copyWith(color: s.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Sp.lg),
            FilledButton.icon(
              onPressed: _ouvrirSeance,
              icon: Icon(enCours == null
                  ? Icons.play_arrow_rounded
                  : Icons.fitness_center_rounded),
              label: Text(enCours == null
                  ? 'Commencer la séance'
                  : 'Reprendre la séance'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stats(ThemeData t) {
    final s = t.colorScheme;
    final terminees = _terminees;
    final serie = terminees.fold<int>(0, (sum, x) => sum + x.totalSeries);
    final semaine = terminees
        .where((x) => DateTime.now().difference(x.debut).inDays < 7)
        .length;

    Widget stat(String valeur, String label) => Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Sp.lg, horizontal: Sp.md),
              child: Column(
                children: [
                  Text(valeur, style: t.textTheme.displaySmall),
                  const SizedBox(height: Sp.xs),
                  Text(label,
                      style: t.textTheme.bodyMedium
                          ?.copyWith(color: s.onSurfaceVariant),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        stat('${terminees.length}', 'Séances'),
        const SizedBox(width: Sp.md),
        stat('$serie', 'Séries'),
        const SizedBox(width: Sp.md),
        stat('$semaine', 'Cette semaine'),
      ],
    );
  }
}
