import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/session_hive.dart';
import 'pages/echauffement_page.dart';
import 'pages/etirements_page.dart';
import 'pages/materiel_maison_page.dart';
import 'pages/sans_materiel_page.dart';
import 'pages/session_active_page.dart';
import 'salle_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await sessionStorage.init();
  runApp(const AppliMuscu());
}

class AppliMuscu extends StatelessWidget {
  const AppliMuscu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(top: false, child: child!),
      title: 'Appli Muscu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const sections = [
    'Échauffement',
    'Salle de sport',
    'Matériel maison',
    'Sans matériel',
    'Étirements',
  ];

  Widget _pageFor(String section) {
    switch (section) {
      case 'Échauffement':
        return const EchauffementPage();
      case 'Salle de sport':
        return const SallePage();
      case 'Matériel maison':
        return const MaterielMaisonPage();
      case 'Sans matériel':
        return const SansMaterielPage();
      case 'Étirements':
        return const EtirementsPage();
      default:
        return SectionPage(title: section);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appli Muscu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bouton Entraînement actif
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.fitness_center, size: 28),
              label: const Text('Entraînement actif', style: TextStyle(fontSize: 18)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SessionActivePage()),
              ),
            ),
          ),
          for (final s in sections)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(64),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => _pageFor(s)),
                ),
                child: Text(s, style: const TextStyle(fontSize: 18)),
              ),
            ),
        ],
      ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;
  const SectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Bientôt disponible')),
    );
  }
}