import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Alerte de fin de minuteur : vibration + triple bip sonore (Android natif).
/// Sur les autres plateformes : son système + vibration.
Future<void> alerteFinChrono() async {
  HapticFeedback.heavyImpact();
  if (!kIsWeb && Platform.isAndroid) {
    try {
      await MethodChannel('appli_muscu/sons').invokeMethod('bip');
      return;
    } catch (_) {
      // Canal natif indisponible (test, ancienne version) : on continue.
    }
  }
  SystemSound.play(SystemSoundType.alert);
}
