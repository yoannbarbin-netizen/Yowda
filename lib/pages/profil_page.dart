import 'package:flutter/material.dart';

import '../data/reglages.dart';
import '../theme/app_theme.dart';

/// Profil : réglages de l'app (mode clair/sombre...).
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final s = t.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          Text('Apparence', style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.md),
          Card(
            child: ValueListenableBuilder<bool>(
              valueListenable: reglagesModeClair,
              builder: (context, modeClair, _) => SwitchListTile(
                secondary: Icon(
                  modeClair ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: s.primary,
                ),
                title: const Text('Mode clair'),
                subtitle: const Text('Inverse les contrastes (mode jour)'),
                value: modeClair,
                onChanged: (v) => Reglages.setModeClair(v),
              ),
            ),
          ),
          const SizedBox(height: Sp.xl),
          Text('Profil', style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.md),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_rounded, color: s.outline),
              title: const Text('Bientôt disponible'),
              subtitle: const Text('Ton profil et tes objectifs arriveront ici.'),
            ),
          ),
          const SizedBox(height: Sp.xl),
        ],
      ),
    );
  }
}
