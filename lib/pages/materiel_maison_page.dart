import 'package:flutter/material.dart';
import '../data/materiel_maison.dart';
import 'session_active_page.dart';

class MaterielMaisonPage extends StatefulWidget {
  const MaterielMaisonPage({super.key});

  @override
  State<MaterielMaisonPage> createState() => _MaterielMaisonPageState();
}

class _MaterielMaisonPageState extends State<MaterielMaisonPage> {
  final Set<String> _possede = {};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Matériel maison'),
          bottom: const TabBar(
            tabs: [Tab(text: 'Mon matériel'), Tab(text: 'Exercices')],
          ),
        ),
        body: TabBarView(children: [_ongletMateriel(), _ongletExercices()]),
      ),
    );
  }

  Widget _ongletMateriel() {
    final categories = materiels.map((m) => m.categorie).toSet().toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Coche ce que tu as chez toi. L'onglet Exercices te montre ensuite ce que tu peux faire.",
        ),
        for (final cat in categories) ...[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: Text(cat, style: Theme.of(context).textTheme.titleMedium),
          ),
          for (final m in materiels.where((m) => m.categorie == cat))
            CheckboxListTile(
              value: _possede.contains(m.id),
              onChanged: (v) => setState(() {
                if (v == true) {
                  _possede.add(m.id);
                } else {
                  _possede.remove(m.id);
                }
              }),
              title: Text(m.nom),
              subtitle: Text('${m.charge}\nSécurité : ${m.securite}'),
              isThreeLine: true,
            ),
        ],
      ],
    );
  }

  Widget _ongletExercices() {
    if (_possede.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            "Coche d'abord du matériel dans l'onglet « Mon matériel ».",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    final possibles =
        exercicesMaison.where((e) => e.estPossible(_possede)).toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Charges improvisées : commence léger, contrôle chaque mouvement et arrête-toi en cas de douleur.",
        ),
        const SizedBox(height: 8),
        Text('${possibles.length} exercice(s) possible(s)'),
        const SizedBox(height: 8),
        for (final e in possibles)
          Card(
            child: ExpansionTile(
              title: Row(
                children: [
                  Expanded(child: Text(e.nom)),
                  IconButton(
                    icon: const Icon(Icons.fitness_center, color: Colors.deepOrange),
                    tooltip: 'Ajouter à l\'entraînement actif',
                    onPressed: () => SessionActivePage.ajouterEtOuvrir(context, e.nom),
                  ),
                ],
              ),
              subtitle: Text(e.muscles),
              childrenPadding: const EdgeInsets.all(16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Matériel : ${_materielUtilise(e)}'),
                const SizedBox(height: 8),
                Text(e.consigne),
                const SizedBox(height: 8),
                Text('Sécurité : ${e.securite}'),
              ],
            ),
          ),
      ],
    );
  }

  String _materielUtilise(ExerciceMaison e) {
    final ids = [...e.requis, ...e.auChoix].where(_possede.contains);
    return ids.map(nomMateriel).join(', ');
  }
}