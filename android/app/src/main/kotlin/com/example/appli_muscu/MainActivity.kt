package com.example.appli_muscu

import android.media.AudioManager
import android.media.ToneGenerator
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Canal "sons" : triple bip de fin de minuteur (ToneGenerator natif,
        // aucun paquet externe). Volume sur le canal alarme pour être audible
        // même en mode silencieux.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "appli_muscu/sons")
            .setMethodCallHandler { call, result ->
                if (call.method == "bip") {
                    try {
                        val handler = Handler(Looper.getMainLooper())
                        val tone = ToneGenerator(AudioManager.STREAM_ALARM, 100)
                        tone.startTone(ToneGenerator.TONE_PROP_BEEP2, 500)
                        handler.postDelayed(
                            { tone.startTone(ToneGenerator.TONE_PROP_BEEP2, 500) }, 700)
                        handler.postDelayed(
                            { tone.startTone(ToneGenerator.TONE_PROP_BEEP2, 500) }, 1400)
                        handler.postDelayed({ tone.release() }, 2200)
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("bip", e.message, null)
                    }
                } else {
                    result.notImplemented()
                }
            }
    }
}
