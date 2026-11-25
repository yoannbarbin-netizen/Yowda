import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Profil : à venir (réglages, objectifs...).
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final s = t.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sp.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_rounded, size: 64, color: s.outline),
              const SizedBox(height: Sp.lg),
              Text('Bientôt disponible', style: t.textTheme.titleLarge),
              const SizedBox(height: Sp.sm),
              Text(
                'Ton profil et tes réglages arriveront ici.',
                style: t.textTheme.bodyMedium
                    ?.copyWith(color: s.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
