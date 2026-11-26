import "package:flutter/foundation.dart";
import "package:hive_flutter/hive_flutter.dart";

/// Réglages persistants de l'app (box Hive « reglages »).
/// Le mode clair est exposé via [reglagesModeClair] : toute l'application se
/// reconstruit automatiquement quand il change.
final ValueNotifier<bool> reglagesModeClair = ValueNotifier<bool>(false);

class Reglages {
  static const String _boxName = "reglages";
  static const String _cleModeClair = "mode_clair";

  /// Ouvre la box de réglages et charge les valeurs sauvegardées.
  static Future<void> init() async {
    final box = await Hive.openBox(_boxName);
    reglagesModeClair.value = box.get(_cleModeClair, defaultValue: false) as bool;
  }

  /// Active/désactive le mode clair et sauvegarde le choix sur disque.
  static Future<void> setModeClair(bool clair) async {
    reglagesModeClair.value = clair;
    if (Hive.isBoxOpen(_boxName)) {
      final box = Hive.box(_boxName);
      await box.put(_cleModeClair, clair);
      await box.flush();
    }
  }
}
