import "package:flutter/material.dart";

import "../data/crossfit.dart";
import "../data/echauffement.dart";
import "../data/etirements.dart";
import "../data/materiel_maison.dart";
import "../data/sans_materiel.dart";
import "../fiches.dart";
import "../salle_page.dart";
import "../theme/app_theme.dart";
import "session_active_page.dart";

/// Un résultat de recherche : nom + origine + type de saisie à utiliser.
class _ResultatRecherche {
  final String nom;
  final String origine;
  final IconData icone;
  final bool? estDuree; // salle = false (poids/reps) ; autres = déduit du nom.
  const _ResultatRecherche(this.nom, this.origine, this.icone, this.estDuree);
}

/// Retire les accents et passe en minuscules pour une recherche tolérante
/// (« etirement » doit trouver « Étirement des mollets »).
String _normaliser(String s) {
  const accents = {
    "à": "a", "â": "a", "ä": "a",
    "é": "e", "è": "e", "ê": "e", "ë": "e",
    "î": "i", "ï": "i",
    "ô": "o", "ö": "o",
    "ù": "u", "û": "u", "ü": "u",
    "ç": "c", "œ": "oe", "æ": "ae",
    "'": " ", "-": " ",
  };
  final sb = StringBuffer();
  for (final ch in s.toLowerCase().split("")) {
    sb.write(accents[ch] ?? ch);
  }
  return sb.toString();
}

/// Index complet des exercices de l'app : un seul résultat par nom
/// (priorité : Salle > CrossFit > Sans matériel > Maison > Échauffement > Étirements).
List<_ResultatRecherche> _construireIndex() {
  final parNom = <String, _ResultatRecherche>{};
  void ajouter(String nom, String origine, IconData icone, bool? estDuree) {
    parNom.putIfAbsent(nom, () => _ResultatRecherche(nom, origine, icone, estDuree));
  }

  for (final c in categoriesSalle) {
    for (final eq in c.equipements) {
      for (final nom in eq.exercices) {
        ajouter(nom, "Salle de sport · ${eq.nom}", Icons.fitness_center_rounded, false);
      }
    }
  }
  for (final c in categoriesCrossfit) {
    for (final e in c.exercices) {
      ajouter(e.nom, "CrossFit · ${c.nom}", c.icone, null);
    }
  }
  for (final e in [...cardioExercices, ...streetWorkoutExercices, ...homeWorkoutExercices]) {
    ajouter(e.nom, "Sans matériel", Icons.self_improvement_rounded, null);
  }
  for (final e in exercicesMaison) {
    ajouter(e.nom, "Matériel maison", Icons.home_rounded, null);
  }
  for (final e in echauffement) {
    ajouter(e.nom, "Échauffement", Icons.local_fire_department_rounded, null);
  }
  for (final e in etirements) {
    ajouter(e.nom, "Étirements", Icons.accessibility_new_rounded, null);
  }

  final liste = parNom.values.toList();
  liste.sort((a, b) => a.nom.toLowerCase().compareTo(b.nom.toLowerCase()));
  return liste;
}

final List<_ResultatRecherche> _index = _construireIndex();

/// Page de recherche d'exercice : tape quelques lettres, trouve l'exercice,
/// ajoute-le directement à l'entraînement libre ou ouvre sa fiche.
class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  final TextEditingController _controleur = TextEditingController();
  String _requete = "";

  @override
  void dispose() {
    _controleur.dispose();
    super.dispose();
  }

  List<_ResultatRecherche> get _resultats {
    final q = _normaliser(_requete.trim());
    if (q.length < 2) return const [];
    final commence = <_ResultatRecherche>[];
    final contient = <_ResultatRecherche>[];
    for (final r in _index) {
      final n = _normaliser(r.nom);
      if (n.startsWith(q)) {
        commence.add(r);
      } else if (n.contains(q)) {
        contient.add(r);
      }
      if (commence.length + contient.length >= 80) break;
    }
    return [...commence, ...contient];
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final couleurs = t.colorScheme;
    final resultats = _resultats;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controleur,
          autofocus: true,
          onChanged: (v) => setState(() => _requete = v),
          decoration: const InputDecoration(
            hintText: "Rechercher un exercice...",
            border: InputBorder.none,
          ),
        ),
        actions: [
          if (_requete.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close_rounded),
              tooltip: "Effacer",
              onPressed: () {
                _controleur.clear();
                setState(() => _requete = "");
              },
            ),
        ],
      ),
      body: _requete.trim().length < 2
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Sp.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_rounded, size: 64, color: couleurs.outline),
                    const SizedBox(height: Sp.lg),
                    const Text(
                      "Tape au moins 2 lettres pour chercher un exercice.\n"
                      "Tu peux l'ajouter directement à ta séance avec le bouton orange, ou ouvrir sa fiche.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : resultats.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(Sp.xl),
                    child: Text(
                      "Aucun exercice ne correspond à « ${_requete.trim()} ».",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(Sp.lg),
                  children: [
                    for (final r in resultats)
                      Card(
                        child: ListTile(
                          leading: Icon(r.icone, color: couleurs.primary),
                          title: Text(r.nom),
                          subtitle: Text(r.origine),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.fitness_center,
                                    color: Colors.deepOrange),
                                tooltip: "Ajouter à l'entraînement actif",
                                onPressed: () => SessionActivePage.ajouterEtOuvrir(
                                    context, r.nom,
                                    estDuree: r.estDuree),
                              ),
                              if (fiches.containsKey(r.nom))
                                const Icon(Icons.chevron_right),
                            ],
                          ),
                          onTap: fiches.containsKey(r.nom)
                              ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FichePage(
                                        nom: r.nom,
                                        fiche: fiches[r.nom]!,
                                        estDuree: r.estDuree,
                                      ),
                                    ),
                                  )
                              : null,
                        ),
                      ),
                  ],
                ),
    );
  }
}
