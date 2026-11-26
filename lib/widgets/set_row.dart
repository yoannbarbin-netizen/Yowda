import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Une série de la séance active : numéro, valeurs, bouton modifier.
/// (La suppression se fait en glissant la ligne vers la gauche.)
class SetRow extends StatelessWidget {
  const SetRow({
    super.key,
    required this.index,
    required this.valeur,
    required this.onEdit,
  });

  final int index;
  final String valeur;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final s = t.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sp.md, vertical: Sp.xs),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: s.surfaceContainerHigh,
            child: Text('$index',
                style: t.textTheme.labelLarge?.copyWith(color: s.onSurface)),
          ),
          const SizedBox(width: Sp.md),
          Expanded(child: Text(valeur, style: t.textTheme.titleMedium)),
          IconButton(
            tooltip: 'Modifier la série',
            onPressed: onEdit,
            icon: Icon(Icons.edit_rounded, size: 20, color: s.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
