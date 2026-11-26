import 'package:flutter/material.dart';

import 'pages/accueil_page.dart';
import 'pages/exercices_page.dart';
import 'pages/profil_page.dart';
import 'pages/recap_seances_page.dart';

/// Barre de navigation persistante : 4 destinations.
/// Une 5e (Nutrition, Programmes...) s'ajoutera sans refonte.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  // Clés des onglets : l'IndexedStack garde les pages en vie (leur initState ne
  // rejoue pas), donc on recharge leurs données quand on revient sur l'onglet.
  final GlobalKey<AccueilPageState> _accueilKey = GlobalKey<AccueilPageState>();
  final GlobalKey<RecapSeancesPageState> _recapKey = GlobalKey<RecapSeancesPageState>();

  late final List<Widget> _pages = <Widget>[
    AccueilPage(key: _accueilKey),
    const ExercicesPage(),
    RecapSeancesPage(key: _recapKey),
    const ProfilPage(),
  ];

  void _onDestination(int i) {
    setState(() => _index = i);
    // Recharge les données de l'onglet qui vient d'être ouvert.
    if (i == 0) _accueilKey.currentState?.rafraichir();
    if (i == 2) _recapKey.currentState?.rafraichir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _onDestination,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Accueil'),
          NavigationDestination(
              icon: Icon(Icons.fitness_center_outlined),
              selectedIcon: Icon(Icons.fitness_center_rounded),
              label: 'Exercices'),
          NavigationDestination(
              icon: Icon(Icons.history_outlined),
              selectedIcon: Icon(Icons.history_rounded),
              label: 'Historique'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profil'),
        ],
      ),
    );
  }
}
