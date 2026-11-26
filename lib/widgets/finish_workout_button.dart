import 'package:flutter/material.dart';

/// "Terminer la séance" : rouge plein + texte blanc, 60 dp de haut.
/// La confirmation est gérée par l'appelant (onPressed).
class FinishWorkoutButton extends StatelessWidget {
  const FinishWorkoutButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final s = t.colorScheme;

    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: s.error,
        foregroundColor: s.onError,
        minimumSize: const Size.fromHeight(60),
        textStyle: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.flag_rounded),
      label: const Text('Terminer la séance'),
    );
  }
}
