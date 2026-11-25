import 'package:flutter/material.dart';

import '../salle_page.dart';
import '../theme/app_theme.dart';
import '../widgets/category_card.dart';
import 'echauffement_page.dart';
import 'etirements_page.dart';
import 'materiel_maison_page.dart';
import 'sans_materiel_page.dart';

/// Liste des 5 catégories d'exercices.
class ExercicesPage extends StatelessWidget {
  const ExercicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cats =
        Theme.of(context).extension<CategoryColors>() ?? CategoryColors.light;

    return Scaffold(
      appBar: AppBar(title: const Text('Exercices')),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          CategoryCard(
              icon: Icons.local_fire_department_rounded,
              label: 'Échauffement',
              subtitle: '14 exercices',
              color: cats.warmup,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EchauffementPage()))),
          const SizedBox(height: Sp.md),
          CategoryCard(
              icon: Icons.fitness_center_rounded,
              label: 'Salle de sport',
              subtitle: '34 équipements',
              color: cats.gym,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SallePage()))),
          const SizedBox(height: Sp.md),
          CategoryCard(
              icon: Icons.home_rounded,
              label: 'Matériel maison',
              subtitle: '37 exercices',
              color: cats.home,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MaterielMaisonPage()))),
          const SizedBox(height: Sp.md),
          CategoryCard(
              icon: Icons.self_improvement_rounded,
              label: 'Sans matériel',
              subtitle: '35 exercices',
              color: cats.bodyweight,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SansMaterielPage()))),
          const SizedBox(height: Sp.md),
          CategoryCard(
              icon: Icons.accessibility_new_rounded,
              label: 'Étirements',
              subtitle: '15 exercices',
              color: cats.stretching,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EtirementsPage()))),
        ],
      ),
    );
  }
}
