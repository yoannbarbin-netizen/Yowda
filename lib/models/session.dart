/// Modèle pour une série validée (set).
class PerformedSet {
  int numero; // ex: 1, 2, 3…
  double poidsKg; // ex: 60.0
  int reps; // ex: 10
  Duration duree; // durée du set en secondes

  PerformedSet({
    required this.numero,
    required this.poidsKg,
    required this.reps,
    required this.duree,
  });

  /// Sérialisation en JSON pour Hive.
  Map<String, dynamic> toJson() => {
        'numero': numero,
        'poids_kg': poidsKg,
        'reps': reps,
        'duree_sec': duree.inSeconds,
      };

  static PerformedSet fromJson(Map<dynamic, dynamic> json) => PerformedSet(
        numero: json['numero'] as int? ?? 0,
        poidsKg: (json['poids_kg'] as num?)?.toDouble() ?? 0.0,
        reps: json['reps'] as int? ?? 0,
        duree: Duration(seconds: json['duree_sec'] as int? ?? 0),
      );
}

/// Modèle pour un exercice ajouté à une séance.
class PerformedExercise {
  String nom; // clé identique au nom exercice de salle_page.dart
  List<PerformedSet> series;
  bool fait; // true quand l'utilisateur a barré l'exercice (fait)
  bool? estDuree; // true = durée (secondes), false = poids/reps ; null = déduire du nom (anciennes séances)

  PerformedExercise({required this.nom, List<PerformedSet>? series, this.fait = false, this.estDuree})
    : series = series ?? [];

  int get totalSeries => series.length;
  double get poidsMax =>
      series.isEmpty ? 0.0 : series.map((s) => s.poidsKg).reduce((a, b) => a > b ? a : b);

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'series': series.map((s) => s.toJson()).toList(),
        'fait': fait,
        'est_duree': estDuree,
      };

  static PerformedExercise fromJson(Map<dynamic, dynamic> json) => PerformedExercise(
        nom: json['nom'] as String? ?? '',
        series: (json['series'] as List<dynamic>?)
            ?.map((s) => PerformedSet.fromJson(s as Map<dynamic, dynamic>))
            .toList() ?? [],
        fait: json['fait'] as bool? ?? false,
        estDuree: json['est_duree'] as bool?,
      );
}

/// Modèle pour une séance d'entraînement complète.
class WorkoutSession {
  DateTime debut;
  DateTime? fin; // null tant que la séance n'est pas terminée
  List<PerformedExercise> exercices;

  WorkoutSession({
    required this.debut,
    this.fin,
    List<PerformedExercise>? exercices,
  }) : exercices = exercices ?? [];

  /// Durée totale calculée via DateTime.
  Duration dureeTotale() => fin == null
      ? DateTime.now().difference(debut)
      : fin!.difference(debut);

  int get totalSeries => exercices.fold(0, (sum, ex) => sum + ex.totalSeries);
  double get poidsTotalMax =>
      exercices.isEmpty ? 0.0 : exercices.map((e) => e.poidsMax).reduce((a, b) => a > b ? a : b);

  bool get estTerminee => fin != null;

  Map<String, dynamic> toJson() => {
        'debut_ms': debut.millisecondsSinceEpoch,
        'fin_ms': fin?.millisecondsSinceEpoch,
        'exercices': exercices.map((e) => e.toJson()).toList(),
      };

  static WorkoutSession fromJson(Map<dynamic, dynamic> json) => WorkoutSession(
        debut: DateTime.fromMillisecondsSinceEpoch(json['debut_ms'] as int),
        fin: json['fin_ms'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['fin_ms'] as int)
            : null,
        exercices: (json['exercices'] as List<dynamic>?)
            ?.map((e) => PerformedExercise.fromJson(e as Map<dynamic, dynamic>))
            .toList() ?? [],
      );

  /// Crée une nouvelle séance vierge.
  factory WorkoutSession.vierge() => WorkoutSession(debut: DateTime.now());

  /// Termine la séance (met fin à now).
  WorkoutSession terminer() => WorkoutSession(
        debut: debut,
        fin: DateTime.now(),
        exercices: List.from(exercices),
      );
}
