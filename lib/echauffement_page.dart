import 'package:flutter/material.dart';

class Exercice {
  final String nom;
  final String duree;
  final String description;
  const Exercice(this.nom, this.duree, this.description);
}

const exercicesEchauffement = [
  Exercice('Rotations des épaules', '10 en avant, 10 en arrière',
      'Bras relâchés, grands cercles lents.'),
  Exercice('Rotations des poignets', '10 par sens',
      'Mains jointes ou bras tendus, cercles amples.'),
  Exercice('Rotations du bassin', '10 par sens',
      'Mains sur les hanches, pieds écartés.'),
  Exercice('Jumping jacks', '30 secondes',
      'Rythme régulier pour monter le cardio en douceur.'),
  Exercice('Squats au poids du corps', '15 répétitions',
      'Dos droit, genoux dans l\'axe des pieds.'),
  Exercice('Fentes alternées', '10 par jambe',
      'Pas en avant, genou arrière proche du sol.'),
  Exercice('Montées de genoux', '30 secondes',
      'Sur place, genoux à hauteur de hanches.'),
  Exercice('Pompes inclinées', '10 répétitions',
      'Mains sur un support en hauteur, corps gainé.'),
];

class EchauffementPage extends StatefulWidget {
  const EchauffementPage({super.key});

  @override
  State<EchauffementPage> createState() => _EchauffementPageState();
}

class _EchauffementPageState extends State<EchauffementPage> {
  final Set<int> _faits = {};

  @override
  Widget build(BuildContext context) {
    final total = exercicesEchauffement.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Échauffement'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Réinitialiser',
            onPressed: () => setState(_faits.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_faits.length} / $total exercices faits'),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: _faits.length / total),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: total,
              itemBuilder: (context, i) {
                final e = exercicesEchauffement[i];
                final fait = _faits.contains(i);
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6),
                  child: CheckboxListTile(
                    value: fait,
                    onChanged: (v) {
                      setState(() {
                        if (v == true) {
                          _faits.add(i);
                        } else {
                          _faits.remove(i);
                        }
                      });
                    },
                    title: Text(
                      e.nom,
                      style: TextStyle(
                        decoration:
                            fait ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Text('${e.duree}\n${e.description}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}