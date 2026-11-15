import 'package:flutter/material.dart';
import 'package:appli_muscu/echauffement_page.dart';
import 'package:appli_muscu/salle_page.dart';

void main() => runApp(const AppliMuscu());

class AppliMuscu extends StatelessWidget {
  const AppliMuscu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appli Muscu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final s in sections)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(64),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                builder: (_) => switch (s) {
                      'Échauffement' => const EchauffementPage(),
                      'Salle de sport' => const SallePage(),
                      _ => SectionPage(title: s),
                    },
                  ),
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