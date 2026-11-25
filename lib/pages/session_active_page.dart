import 'dart:async';

import 'package:flutter/material.dart';

import '../data/session_hive.dart';
import '../models/session.dart';
import '../salle_page.dart';

/// Callback déclenché quand l'utilisateur appuie sur "Ajouter à l'entraînement actif".
typedef OnAjouterExercice = void Function(String nomExercise);

// ────────────────────────────────────────────────────────────────
// Page principale : séance d'entraînement en cours
// ────────────────────────────────────────────────────────────────

class SessionActivePage extends StatefulWidget {
  /// Exercice pré-sélectionné : si fourni, ouvre automatiquement le dialogue
  /// d'ajout de set pour cet exercice dès que la session est prête.
  final String? preselectionNom;

  /// Type de saisie imposé pour l'exercice pré-sélectionné :
  /// true = durée (secondes), false = poids/reps, null = déduire du nom.
  final bool? preselectionEstDuree;

  const SessionActivePage({super.key, this.preselectionNom, this.preselectionEstDuree});

  static bool isDureeExercice(String nom) => _SessionActivePageState._dureeExercices.contains(nom);

  /// Navigation vers la session active et ouverture du dialogue pour [nomExercise].
  /// [estDuree] : true = durée, false = poids/reps, null = déduire du nom.
  static Future<void> ajouterEtOuvrir(BuildContext context, String nomExercise, {bool? estDuree}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SessionActivePage(preselectionNom: nomExercise, preselectionEstDuree: estDuree),
      ),
    );
  }

  /// Ajoute un exercice à la session active sans naviguer.
  /// Utilise sessionStorage directement — la session est sauvegardée automatiquement par `_enregistrerSetForce` ou `_enregistrerSetDuree`.
  static Future<void> ajouterExercice(BuildContext context, String nomExercise) async {
    final session = sessionStorage;
    // Si déjà une session en cours, on peut l'ajouter directement
    if (session.isReady) {
      // On ne fait rien ici — l'appelant doit naviguer vers SessionActivePage
      // avec preselectionNom pour déclencher le dialogue.
      // Cette méthode est un point d'entrée simplifié qui delegate à ajouterEtOuvrir.
    }
    await ajouterEtOuvrir(context, nomExercise);
  }

  @override
  State<SessionActivePage> createState() => _SessionActivePageState();
}

class _SessionActivePageState extends State<SessionActivePage> {
  late WorkoutSession _session;
  Timer? _timer;

  // Exercices dont l'effort se mesure en durée, pas en poids/répétitions.
  // Recense tous les noms des catégories Échauffement, Étirements et Sans matériel.
  static const Set<String> _dureeExercices = {
    // Échauffement (14)
    "Cercles de poignets",
    "Rotations du cou",
    "Rotations des épaules",
    "Moulinets de bras",
    "Rotations du tronc",
    "Chat-vache",
    "Rotation thoracique",
    "Rotations des hanches",
    "Rotations des chevilles",
    "Pont fessier léger",
    "Squats au poids du corps",
    "Fentes alternées",
    "Montées de genoux",
    "Jumping jacks",
    // Étirements (15) — avec Étirement du cou à la fin
    "Étirement des mollets",
    "Étirement des quadriceps",
    "Étirement des fléchisseurs de hanche",
    "Étirement des ischio-jambiers",
    "Étirement des adducteurs (papillon)",
    "Étirement des fessiers",
    "Torsion lombaire allongée",
    "Posture de l'enfant",
    "Posture du cobra",
    "Étirement latéral du tronc",
    "Étirement des pectoraux",
    "Étirement des épaules (bras croisé)",
    "Étirement du triceps",
    "Étirement des avant-bras",
    "Étirement du cou",
    // Sans matériel — cardio (9, 2 déjà dans Échauffement)
    "Talons-fesses",
    "Corde à sauter imaginaire",
    "Pas chassés latéraux",
    "Mountain climbers",
    "Burpees",
    "Squats sautés",
    "Patineur (skaters)",
    "Sprint sur place",
    "Boxe dans le vide",
    // Sans matériel — street workout (10)
    "Pompes classiques",
    "Pompes diamant",
    "Pompes archer",
    "Pompes pike",
    "Planche (gainage)",
    "Planche latérale",
    "Planche avec touchers d'épaule",
    "Hollow body",
    "Squat pistol assisté",
    "Fentes sautées",
    // Sans matériel — home workout (14)
    "Squats",
    "Fentes arrière",
    "Fentes marchées",
    "Chaise contre un mur",
    "Montées sur pointes",
    "Pont fessier",
    "Pont fessier une jambe",
    "Pompes inclinées (mains au mur)",
    "Pompes sur les genoux",
    "Dead bug",
    "Bird dog",
    "Superman",
    "Crunchs",
    "Relevés de jambes allongé",
  };

  @override
  void initState() {
    super.initState();
    // Initialisation immédiate : évite toute lecture de _session avant le chargement Hive.
    _session = WorkoutSession.vierge();
    // On récupère une session existante ou on en crée une neuve
    if (sessionStorage.isReady) {
      sessionStorage.chargerToutes().then((sessions) {
        try {
          final inProgress = sessions.where((s) => !s.estTerminee).toList();
          WorkoutSession s;
          if (inProgress.isNotEmpty) {
            s = inProgress.last;
          } else {
            s = WorkoutSession.vierge();
          }
          setState(() => _session = s);
          // Auto-ouverture du dialogue d'ajout de set pour l'exercice pré-sélectionné
          final nom = widget.preselectionNom;
          if (nom != null && _session.fin == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _ajouterSet(nom, estDureeForce: widget.preselectionEstDuree));
          }
        } catch (e) {
          debugPrint('session_active: erreur chargement session — $e');
        }
      }).catchError((e) {
        debugPrint('session_active: chargerToutes échoué — $e');
      });
    } else {
      _session = WorkoutSession.vierge();
      Future.microtask(() => setState(() {}));
    }
    // Chrono temps réel : met à jour l'affichage de la durée chaque seconde.
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ── Ajout d'un set à un exercice existant ou création ──

  Future<void> _ajouterSet(String nomExercise, {bool? estDureeForce}) async {
    // Exercices à durée : on demande une durée en secondes au lieu de poids/répétitions.
    // estDureeForce (si fourni) prime sur la déduction par nom.
    final estDuree = estDureeForce ?? _dureeExercices.contains(nomExercise);

    if (estDuree) {
      await _ajouterSetDuree(nomExercise);
      return;
    }

    // Exercices de force : poids + répétitions avec dropdowns
    int poidsSelectionne = 0; // 0 = non sélectionné
    int repsSelectionne = 0; // 0 = non sélectionné

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('Ajouter un set — $nomExercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Poids (kg)'),
              const SizedBox(height: 4),
              DropdownButton<int>(
                value: poidsSelectionne == 0 ? null : poidsSelectionne,
                isExpanded: true,
                hint: const Text('--'),
                items: List.generate(100, (i) => i + 1)
                    .map((v) => DropdownMenuItem(value: v, child: Text('$v kg')))
                    .toList(),
                onChanged: (v) {
                  poidsSelectionne = v ?? 0;
                  setDialogState(() {});
                },
              ),
              const SizedBox(height: 12),
              const Text('Répétitions'),
              const SizedBox(height: 4),
              DropdownButton<int>(
                value: repsSelectionne == 0 ? null : repsSelectionne,
                isExpanded: true,
                hint: const Text('--'),
                items: List.generate(100, (i) => i + 1)
                    .map((v) => DropdownMenuItem(value: v, child: Text('$v')))
                    .toList(),
                onChanged: (v) {
                  repsSelectionne = v ?? 0;
                  setDialogState(() {});
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () {
                final poids = poidsSelectionne == 0 ? 0.0 : poidsSelectionne.toDouble();
                final reps = repsSelectionne;

                _enregistrerSetForce(nomExercise, poids, reps);

                if (mounted) setState(() {});
                Navigator.pop(ctx);
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _ajouterSetDuree(String nomExercise) async {
    int dureeSelectionnee = 0; // 0 = non sélectionné

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('Ajouter un set — $nomExercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Durée (secondes)'),
              const SizedBox(height: 4),
              DropdownButton<int>(
                value: dureeSelectionnee == 0 ? null : dureeSelectionnee,
                isExpanded: true,
                hint: const Text('--'),
                items: List.generate(300, (i) => i + 1)
                    .map((v) => DropdownMenuItem(value: v, child: Text('$v s')))
                    .toList(),
                onChanged: (v) {
                  dureeSelectionnee = v ?? 0;
                  setDialogState(() {});
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () {
                final dureeSec = dureeSelectionnee;

                // Trouve l'exercice ou en crée un nouveau
                final existing = _session.exercices.indexWhere((e) => e.nom == nomExercise);
                if (existing != -1) {
                  final set = PerformedSet(
                    numero: _session.exercices[existing].series.length + 1,
                    poidsKg: 0.0,
                    reps: 0,
                    duree: Duration(seconds: dureeSec),
                  );
                  _session.exercices[existing] = PerformedExercise(
                    nom: nomExercise,
                    series: List.from(_session.exercices[existing].series)..add(set),
                    fait: _session.exercices[existing].fait,
                    estDuree: _session.exercices[existing].estDuree,
                  );
                } else {
                  final set = PerformedSet(
                    numero: 1,
                    poidsKg: 0.0,
                    reps: 0,
                    duree: Duration(seconds: dureeSec),
                  );
                  _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set], estDuree: true));
                }

                // Sauvegarde Hive
                sessionStorage.sauvegarder(_session);

                if (mounted) setState(() {});
                Navigator.pop(ctx);
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }

  void _enregistrerSetForce(String nomExercise, double poids, int reps) {
    final existing = _session.exercices.indexWhere((e) => e.nom == nomExercise);
    if (existing != -1) {
      final set = PerformedSet(
        numero: _session.exercices[existing].series.length + 1,
        poidsKg: poids,
        reps: reps,
        duree: Duration.zero,
      );
      _session.exercices[existing] = PerformedExercise(
        nom: nomExercise,
        series: List.from(_session.exercices[existing].series)..add(set),
        fait: _session.exercices[existing].fait,
        estDuree: _session.exercices[existing].estDuree,
      );
    } else {
      final set = PerformedSet(
        numero: 1,
        poidsKg: poids,
        reps: reps,
        duree: Duration.zero,
      );
      _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set], estDuree: false));
    }

    // Sauvegarde Hive
    sessionStorage.sauvegarder(_session);
  }

  void _supprimerSet(int exerciseIndex, int setIndex) {
    final ex = _session.exercices[exerciseIndex];
    final nouvellesSeries = List<PerformedSet>.from(ex.series)..removeAt(setIndex);
    // Retitrer les séries
    for (int i = 0; i < nouvellesSeries.length; i++) {
      nouvellesSeries[i] = PerformedSet(
        numero: i + 1,
        poidsKg: nouvellesSeries[i].poidsKg,
        reps: nouvellesSeries[i].reps,
        duree: nouvellesSeries[i].duree,
      );
    }
    _session.exercices[exerciseIndex] = PerformedExercise(
      nom: ex.nom,
      series: nouvellesSeries,
      fait: ex.fait,
      estDuree: ex.estDuree,
    );
    sessionStorage.sauvegarder(_session);
    if (mounted) setState(() {});
  }

  /// Bascule l'état « barré » (fait) d'un exercice et sauvegarde la séance.
  void _basculerFait(int index) {
    final ex = _session.exercices[index];
    _session.exercices[index] = PerformedExercise(
      nom: ex.nom,
      series: ex.series,
      fait: !ex.fait,
      estDuree: ex.estDuree,
    );
    sessionStorage.sauvegarder(_session);
    if (mounted) setState(() {});
  }

  // ── Sélection d'exercice à ajouter ──

  Future<void> _choisirExercice() async {
    final exercices = <String>[];
    for (final cat in categoriesSalle) {
      for (final eq in cat.equipements) {
        exercices.addAll(eq.exercices);
      }
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        maxChildSize: 0.7,
        initialChildSize: 0.5,
        minChildSize: 0.3,
        builder: (_, controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('Ajouter un exercice', style: Theme.of(ctx).textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  for (final cat in categoriesSalle)
                    ExpansionTile(
                      leading: Icon(cat.icone),
                      title: Text(cat.nom),
                      subtitle: Text('${cat.equipements.fold<int>(0, (s, e) => s + e.exercices.length)} exercices'),
                      children: [
                        for (final eq in cat.equipements)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: ExpansionTile(
                              title: Text(eq.nom),
                              children: [
                                for (final ex in eq.exercices)
                                  ListTile(
                                    title: Text(ex),
                                    onTap: () {
                                      Navigator.pop(ctx);
                                      WidgetsBinding.instance.addPostFrameCallback((_) => _ajouterSet(ex, estDureeForce: false));
                                    },
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Utilitaires durée / poids ──

  static bool isDureeExercice(String nom) => _dureeExercices.contains(nom);

  bool _isExDuree(int index) => _session.exercices[index].estDuree ?? isDureeExercice(_session.exercices[index].nom);

  int _dureeMax(int index) {
    final series = _session.exercices[index].series;
    return series.isEmpty ? 0 : series.map((s) => s.duree.inSeconds).reduce((a, b) => a > b ? a : b);
  }

  // ── Terminer la séance ──

  Future<void> _terminer() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Terminer la séance ?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Durée : ${_formatDuration(_session.dureeTotale())}'),
                Text('Exercices : ${_session.exercices.length}'),
                Text('Séries totales : ${_session.totalSeries}'),
                if (_session.poidsTotalMax > 0)
                  Text('Poids max : ${_session.poidsTotalMax.toStringAsFixed(1)} kg'),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
              FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Terminer')),
            ],
          ),
        ) ??
        false;

    if (confirmed && mounted) {
      _timer?.cancel();
      final terminee = _session.terminer();
      await sessionStorage.sauvegarder(terminee);

      // Navigation vers l'écran bilan
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SessionBilanPage(session: terminee),
          ),
        );
      }
    }
  }

  String _formatDuration(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  // ── UI ──

  @override
  Widget build(BuildContext context) {
    if (_session.fin != null && _session.exercices.isNotEmpty) {
      // Session déjà terminée — on affiche le bilan direct
      return Scaffold(
        appBar: AppBar(title: const Text('Séance en cours')),
        body: Center(child: Text('Séance terminée.')),
      );
    }

    final couleurs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Séance en cours'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              _formatDuration(DateTime.now().difference(_session.debut)), // Timer calculé depuis le début de session
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton.extended(
          onPressed: _choisirExercice,
          icon: const Icon(Icons.add),
          label: const Text('Ajouter\nun exercice'),
        ),
        const SizedBox(height: 8),
        if (_session.exercices.isNotEmpty)
          FloatingActionButton.extended(
            onPressed: _terminer,
            backgroundColor: couleurs.error,
            icon: const Icon(Icons.check_circle),
            label: const Text('Terminer\nla séance'),
          ),
      ]),
      body: _session.exercices.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fitness_center, size: 64, color: couleurs.outline),
                  const SizedBox(height: 16),
                  Text('Aucun exercice ajouté', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: _choisirExercice,
                    child: const Text('Commencer une séance'),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Résumé rapide
                Card(
                  color: couleurs.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [Text('${_session.exercices.length}', style: Theme.of(context).textTheme.headlineSmall), Text('exercices', style: Theme.of(context).textTheme.bodySmall)],),
                        Column(children: [Text('${_session.totalSeries}', style: Theme.of(context).textTheme.headlineSmall), Text('séries', style: Theme.of(context).textTheme.bodySmall)],),
                        Column(children: [Text('${_session.exercices.where((e) => e.fait).length}/${_session.exercices.length}', style: Theme.of(context).textTheme.headlineSmall), Text('barrés', style: Theme.of(context).textTheme.bodySmall)],),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Liste des exercices
                for (int i = 0; i < _session.exercices.length; i++)
                  Card(
                    child: ExpansionTile(
                      leading: IconButton(
                        icon: Icon(
                          _session.exercices[i].fait
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          color: _session.exercices[i].fait
                              ? Colors.green
                              : couleurs.outline,
                        ),
                        tooltip: _session.exercices[i].fait
                            ? 'Marquer comme à faire'
                            : 'Marquer comme fait',
                        onPressed: () => _basculerFait(i),
                      ),
                      title: Text(
                        _session.exercices[i].nom,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: _session.exercices[i].fait
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: _session.exercices[i].fait ? couleurs.outline : null,
                        ),
                      ),
                      subtitle: _isExDuree(i)
                          ? Text('${_session.exercices[i].totalSeries} série(s) · Durée max : ${_dureeMax(i)}s')
                          : Text('${_session.exercices[i].totalSeries} série(s) · Max ${_session.exercices[i].poidsMax.toStringAsFixed(1)} kg'),
                      children: [
                        for (int j = 0; j < _session.exercices[i].series.length; j++)
                          Dismissible(
                            key: Key('$i-$j'),
                            direction: DismissDirection.endToStart,
                            background: Container(color: Colors.red),
                            onDismissed: (_) => _supprimerSet(i, j),
                            child: ListTile(
                              leading: CircleAvatar(child: Text('${_session.exercices[i].series[j].numero}')),
                              title: _isExDuree(i)
                                  ? Text('Durée : ${_session.exercices[i].series[j].duree.inSeconds}s')
                                  : Row(children: [
                                      Text('Poids : ${_session.exercices[i].series[j].poidsKg.toStringAsFixed(1)} kg'),
                                      const SizedBox(width: 16),
                                      Text('${_session.exercices[i].series[j].reps} reps'),
                                    ]),
                            ),
                          ),
                        // Bouton ajouter un set directement dans le ListTile
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.add_circle_outline, size: 20),
                            label: const Text('Ajouter un set'),
                            onPressed: () => _ajouterSet(_session.exercices[i].nom, estDureeForce: _session.exercices[i].estDuree),
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

// ────────────────────────────────────────────────────────────────
// Écran bilan (préparé pour la Phase 4 — affiche un résumé simple)
// ────────────────────────────────────────────────────────────────

class SessionBilanPage extends StatelessWidget {
  final WorkoutSession session;
  const SessionBilanPage({super.key, required this.session});

  String _formatDuration(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  int _dureeMaxEx(PerformedExercise ex) {
    return ex.series.isEmpty ? 0 : ex.series.map((s) => s.duree.inSeconds).reduce((a, b) => a > b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    final couleurs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Séance terminée !')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: couleurs.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Icon(Icons.celebration, size: 64, color: couleurs.primary),
                const SizedBox(height: 16),
                Text('Bravo ! Séance complétée', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                _row('Durée', _formatDuration(session.dureeTotale())),
                _row('Exercices', '${session.exercices.length}'),
                _row('Séries totales', '${session.totalSeries}'),
                _row('Exercices barrés', '${session.exercices.where((e) => e.fait).length} / ${session.exercices.length}'),
                if (session.poidsTotalMax > 0)
                  _row('Poids max soulevé', '${session.poidsTotalMax.toStringAsFixed(1)} kg'),
              ]),
            ),
          ),
          const SizedBox(height: 16),

          // Détail exercice par exercice
          Text('Détail', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          for (final ex in session.exercices)
            Card(
              child: ExpansionTile(
                title: Text(
                  ex.nom,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: ex.fait ? TextDecoration.lineThrough : TextDecoration.none,
                    color: ex.fait ? couleurs.outline : null,
                  ),
                ),
                subtitle: (ex.estDuree ?? SessionActivePage.isDureeExercice(ex.nom))
                    ? Text('${ex.totalSeries} série(s) · Durée max : ${_dureeMaxEx(ex)}s')
                    : Text('${ex.totalSeries} série(s) · Max ${ex.poidsMax.toStringAsFixed(1)} kg'),
                children: [
                  for (int i = 0; i < ex.series.length; i++)
                    ListTile(
                      leading: CircleAvatar(child: Text('${ex.series[i].numero}')),
                      title: (ex.estDuree ?? SessionActivePage.isDureeExercice(ex.nom))
                          ? Text('Durée : ${ex.series[i].duree.inSeconds}s')
                          : Text('${ex.series[i].poidsKg.toStringAsFixed(1)} kg'),
                      trailing: (ex.estDuree ?? SessionActivePage.isDureeExercice(ex.nom)) ? null : Text('${ex.series[i].reps} reps'),
                    ),
                ],
              ),
            ),

          const SizedBox(height: 32),
          Center(
            child: FilledButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Retour à l\'accueil'),
              onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.bold))],
      ),
    );
  }
}
