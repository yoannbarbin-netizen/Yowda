import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../data/alerte.dart";
import "../data/wods.dart";
import "../theme/app_theme.dart";
import "session_active_page.dart";

/// WOD guidé : chrono adapté au format du WOD.
///  - For Time / Intervalles : chrono qui monte, bouton « Terminer ».
///  - AMRAP : décompte + compteur de tours.
///  - EMOM : décompte + minute en cours (vibration à chaque minute).
///  - Tabata : cycles 20 s travail / 10 s repos (vibration à chaque phase).
class WodGuidePage extends StatefulWidget {
  final Wod wod;
  const WodGuidePage({super.key, required this.wod});

  @override
  State<WodGuidePage> createState() => _WodGuidePageState();
}

class _WodGuidePageState extends State<WodGuidePage> {
  Timer? _timer;
  bool _enMarche = false;
  bool _fini = false;
  bool _exercicesAjoutes = false;
  int _secondes = 0; // For Time : temps écoulé ; AMRAP/EMOM/Tabata : temps restant
  int _tours = 0; // AMRAP

  bool get _estAmrap => widget.wod.format == "AMRAP";
  bool get _estEmom => widget.wod.format == "EMOM";
  bool get _estTabata => widget.wod.format == "Tabata";
  bool get _aDecompte => _estAmrap || _estEmom || _estTabata;

  /// Minutes totales (décompte AMRAP/EMOM), lues dans « duree ».
  int get _minutesTotales {
    final m = RegExp(r"(\d+)\s*min").firstMatch(widget.wod.duree);
    return m != null ? int.parse(m.group(1)!) : 10;
  }

  /// Nombre de blocs Tabata, lus dans « duree » (« 4 blocs de 4 min »).
  int get _blocsTabata {
    final m = RegExp(r"(\d+)\s*bloc").firstMatch(widget.wod.duree);
    return m != null ? int.parse(m.group(1)!) : 4;
  }

  int get _secondesTotales =>
      _estTabata ? _blocsTabata * 240 : _minutesTotales * 60;

  @override
  void initState() {
    super.initState();
    if (_aDecompte) _secondes = _secondesTotales;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _basculer() {
    if (_fini) return;
    if (_enMarche) {
      _timer?.cancel();
      setState(() => _enMarche = false);
      return;
    }
    // Au premier démarrage : les exercices du WOD rejoignent l'entraînement libre.
    if (!_exercicesAjoutes) {
      _exercicesAjoutes = true;
      SessionActivePage.ajouterExercicesSansNaviguer(widget.wod.exercices);
    }
    setState(() => _enMarche = true);
    HapticFeedback.mediumImpact();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    if (!mounted) return;
    setState(() {
      if (!_aDecompte) {
        _secondes++;
        return;
      }
      if (_secondes <= 0) return;
      _secondes--;
      // EMOM : vibration à chaque nouvelle minute.
      if (_estEmom && _secondes % 60 == 0 && _secondes > 0) {
        HapticFeedback.mediumImpact();
      }
      // Tabata : vibration aux changements travail <-> repos.
      if (_estTabata) {
        final ecoule = _secondesTotales - _secondes;
        if (ecoule % 30 == 20 || ecoule % 30 == 0) {
          HapticFeedback.mediumImpact();
        }
      }
      if (_secondes == 0) {
        _enMarche = false;
        _fini = true;
        _timer?.cancel();
        alerteFinChrono();
      }
    });
  }

  void _terminer() {
    _timer?.cancel();
    setState(() {
      _enMarche = false;
      _fini = true;
    });
  }

  void _recommencer() {
    _timer?.cancel();
    setState(() {
      _enMarche = false;
      _fini = false;
      _tours = 0;
      _secondes = _aDecompte ? _secondesTotales : 0;
    });
  }

  String _format(int sec) =>
      "${(sec ~/ 60).toString().padLeft(2, "0")}:${(sec % 60).toString().padLeft(2, "0")}";

  Widget _puce(ThemeData t, ColorScheme c, String texte) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Sp.md, vertical: Sp.xs),
        decoration: BoxDecoration(
          color: c.primaryContainer,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(texte, style: t.textTheme.labelMedium),
      );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final couleurs = t.colorScheme;
    final w = widget.wod;
    final ecoule = _secondesTotales - _secondes;

    String statut;
    if (_fini) {
      statut = _estAmrap
          ? "Temps écoulé — $_tours tour(s) terminé(s) !"
          : "Terminé, bien joué !";
    } else if (!_enMarche) {
      statut = "Prêt ? Appuie sur Démarrer";
    } else if (_estEmom) {
      final minute = ((ecoule ~/ 60) + 1).clamp(1, _minutesTotales);
      statut = "Minute $minute / $_minutesTotales";
    } else if (_estTabata) {
      statut = (ecoule % 30) < 20 ? "TRAVAIL !" : "Repos";
    } else if (_estAmrap) {
      statut = "AMRAP en cours";
    } else {
      statut = "En cours...";
    }

    String principal;
    if (_estTabata) {
      final pos = ecoule % 30;
      principal = _format(pos < 20 ? 20 - pos : 30 - pos);
    } else {
      principal = _format(_secondes);
    }

    return Scaffold(
      appBar: AppBar(title: Text("WOD — ${w.nom}")),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          Wrap(
            spacing: Sp.sm,
            runSpacing: Sp.sm,
            children: [
              _puce(t, couleurs, w.format),
              _puce(t, couleurs, w.duree),
              _puce(t, couleurs, w.niveau),
            ],
          ),
          const SizedBox(height: Sp.lg),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Sp.xl, horizontal: Sp.lg),
              child: Column(
                children: [
                  Text(principal, style: t.textTheme.displayLarge),
                  const SizedBox(height: Sp.sm),
                  Text(
                    statut,
                    style: t.textTheme.titleMedium
                        ?.copyWith(color: couleurs.primary),
                    textAlign: TextAlign.center,
                  ),
                  if (_estTabata && !_fini) ...[
                    const SizedBox(height: Sp.sm),
                    Text(
                      "Bloc ${(ecoule ~/ 240).clamp(0, _blocsTabata - 1) + 1} / $_blocsTabata",
                      style: t.textTheme.bodyMedium
                          ?.copyWith(color: couleurs.onSurfaceVariant),
                    ),
                  ],
                  if (_estAmrap) ...[
                    const SizedBox(height: Sp.md),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.add_task_rounded),
                      label: Text("Tour terminé ($_tours)"),
                      onPressed:
                          _enMarche ? () => setState(() => _tours++) : null,
                    ),
                  ],
                  const SizedBox(height: Sp.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Style local : le thème force la pleine largeur
                      // (Size.fromHeight) — incompatible avec un Row.
                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 56)),
                        icon: Icon(_fini
                            ? Icons.refresh_rounded
                            : (_enMarche
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded)),
                        label: Text(_fini
                            ? "Recommencer"
                            : (_enMarche ? "Pause" : "Démarrer le WOD")),
                        onPressed: _fini ? _recommencer : _basculer,
                      ),
                      if (!_aDecompte && !_fini) ...[
                        const SizedBox(width: Sp.md),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(0, 52)),
                          icon: const Icon(Icons.stop_rounded),
                          label: const Text("Terminer"),
                          onPressed: _terminer,
                        ),
                      ],
                    ],
                  ),
                  if (_exercicesAjoutes)
                    Padding(
                      padding: const EdgeInsets.only(top: Sp.sm),
                      child: Text(
                        '${widget.wod.exercices.length} exercices ajoutés à l\'entraînement libre',
                        style: t.textTheme.bodySmall
                            ?.copyWith(color: couleurs.onSurfaceVariant),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (_fini) ...[
                    const SizedBox(height: Sp.md),
                    Text(
                      _estAmrap ? "Tours : $_tours" : "Temps : ${_format(_secondes)}",
                      style: t.textTheme.titleLarge,
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: Sp.xl),
          Text("Le WOD", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(Sp.lg),
              child: Text(w.description, style: t.textTheme.bodyMedium),
            ),
          ),
          const SizedBox(height: Sp.xl),
          Text("Exercices", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.sm),
          for (var i = 0; i < w.exercices.length; i++)
            Card(
              child: ListTile(
                dense: true,
                leading: CircleAvatar(radius: 14, child: Text("${i + 1}")),
                title: Text(w.exercices[i]),
              ),
            ),
          const SizedBox(height: Sp.xl),
        ],
      ),
    );
  }
}
