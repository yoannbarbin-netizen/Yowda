import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/session.dart';

const String _boxName = 'workout_sessions';

/// Couche de persistance pour les séances d'entraînement.
/// Stocke chaque session comme une map JSON dans Hive, sans adapter personnalisé.
class SessionStorage {
  late final Box<dynamic> _box;

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  /// Clé Hive basée sur la date de début de la session.
  String _cle(WorkoutSession session) => 'session_${_dateKey(session.debut)}';

  static String _dateKey(DateTime dt) =>
      '${dt.year}${dt.month.toString().padLeft(2, '0')}${dt.day.toString().padLeft(2, '0')}_${dt.hour.toString().padLeft(2, '0')}${dt.minute.toString().padLeft(2, '0')}';

  /// Sauvegarde (ou met à jour) une session, puis force l'écriture sur disque.
  /// Le flush est indispensable sur Android : sans lui, les données peuvent être
  /// perdues si l'application est fermée juste après la sauvegarde.
  Future<void> sauvegarder(WorkoutSession session) async {
    await _box.put(_cle(session), session.toJson());
    await _box.flush();
  }

  /// Charge toutes les sessions existantes.
  /// Ignore les entrées corrompues ou incompatibles et logue les erreurs.
  Future<List<WorkoutSession>> chargerToutes() async {
    final List<WorkoutSession> result = [];
    for (final v in _box.values) {
      try {
        result.add(WorkoutSession.fromJson(v as Map<dynamic, dynamic>));
      } catch (e) {
        debugPrint('session_hive: entrée JSON corrompue ignorée — $e');
      }
    }
    return result;
  }

  /// Charge une session par sa clé de date.
  Future<WorkoutSession?> charger(String key) async {
    try {
      final data = _box.get(key);
      return data == null ? null : WorkoutSession.fromJson(data as Map<dynamic, dynamic>);
    } catch (e) {
      debugPrint('session_hive: chargement par clé échoué — $e');
      return null;
    }
  }

  /// Supprime une session.
  Future<void> supprimer(String key) async {
    await _box.delete(key);
  }

  /// Supprime une session par son objet (même clé que sauvegarder).
  Future<void> supprimerSession(WorkoutSession session) async {
    await _box.delete(_cle(session));
  }

  /// Vérifie si Hive est initialisé.
  bool get isReady => _box.isOpen;
}

/// Singleton pour accéder au storage depuis n'importe où.
final SessionStorage sessionStorage = SessionStorage();
