import "package:flutter/material.dart";

import "../data/crossfit.dart";
import "../data/equipements_crossfit.dart";
import "../data/wods.dart";
import "../fiches.dart";
import "../theme/app_theme.dart";
import "equipement_crossfit_page.dart";
import "session_active_page.dart";
import "wod_guide_page.dart";

/// Bibliothèque CrossFit : 5 familles + WOD, avec filtre par niveau.
/// Un mouvement = une seule fiche, partagée entre les disciplines ; les
/// exercices déjà présents dans l'app sont réutilisés tels quels.
class CrossfitPage extends StatefulWidget {
  const CrossfitPage({super.key});

  @override
  State<CrossfitPage> createState() => _CrossfitPageState();
}

class _CrossfitPageState extends State<CrossfitPage> {
  /// Niveau sélectionné (null = tous).
  String? _niveau;

  /// Un niveau « Débutant à avancé » correspond aux trois filtres.
  bool _correspond(String niveau) =>
      _niveau == null || niveau.toLowerCase().contains(_niveau!.toLowerCase());

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final couleurs = t.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("CrossFit")),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          Card(
            color: couleurs.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(Sp.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bibliothèque CrossFit", style: t.textTheme.titleMedium),
                  const SizedBox(height: Sp.sm),
                  Text(
                    "Gymnastique, haltérophilie, force fonctionnelle, conditionnement et core. "
                    "Les exercices déjà présents dans l'app sont réutilisés tels quels : un mouvement = une seule fiche.",
                    style: t.textTheme.bodyMedium
                        ?.copyWith(color: couleurs.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: Sp.xl),
          Text("Familles", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.sm),
          Wrap(
            spacing: Sp.sm,
            runSpacing: Sp.sm,
            children: [
              for (final niveau in const [null, "Débutant", "Intermédiaire", "Avancé"])
                FilterChip(
                  label: Text(niveau ?? "Tous"),
                  selected: _niveau == niveau,
                  onSelected: (_) => setState(() => _niveau = niveau),
                ),
            ],
          ),
          const SizedBox(height: Sp.md),
          for (final cat in categoriesCrossfit)
            if (!(_niveau != null &&
                cat.exercices.where((e) => _correspond(e.niveau)).isEmpty))
              Card(
                child: ExpansionTile(
                  leading: Icon(cat.icone, color: couleurs.primary),
                  title: Text(
                    cat.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_niveau == null
                      ? "${cat.exercices.length} exercices"
                      : "${cat.exercices.where((e) => _correspond(e.niveau)).length} / ${cat.exercices.length} exercices"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Sp.lg, 0, Sp.lg, Sp.sm),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cat.objectif,
                          style: t.textTheme.bodySmall
                              ?.copyWith(color: couleurs.onSurfaceVariant),
                        ),
                      ),
                    ),
                    for (final ex
                        in cat.exercices.where((e) => _correspond(e.niveau)))
                      ListTile(
                        dense: true,
                        title: Text(ex.nom),
                        subtitle: Text("${ex.equipement} · ${ex.niveau}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.fitness_center,
                              color: Colors.deepOrange),
                          tooltip: "Ajouter à l'entraînement actif",
                          onPressed: () => SessionActivePage.ajouterEtOuvrir(
                              context, ex.nom,
                              estDuree: null),
                        ),
                        onTap: fiches.containsKey(ex.nom)
                            ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FichePage(
                                      nom: ex.nom,
                                      fiche: fiches[ex.nom]!,
                                      estDuree: null,
                                    ),
                                  ),
                                )
                            : null,
                      ),
                  ],
                ),
              ),
          const SizedBox(height: Sp.xl),
          Text("WOD", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.sm),
          Text(
            "Des séances composées (AMRAP, EMOM, For Time…) qui utilisent les exercices de la bibliothèque. "
            "Ouvre un WOD pour voir le détail, le lancer en guidé ou ajouter ses exercices à ta séance.",
            style: t.textTheme.bodyMedium
                ?.copyWith(color: couleurs.onSurfaceVariant),
          ),
          const SizedBox(height: Sp.md),
          for (final w in wods.where((w) => _correspond(w.niveau)))
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: couleurs.primaryContainer,
                  child: Icon(Icons.timer_outlined,
                      color: couleurs.primary, size: 20),
                ),
                title: Text(w.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${w.format} · ${w.duree} · ${w.niveau}"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WodDetailPage(wod: w)),
                ),
              ),
            ),
          const SizedBox(height: Sp.xl),
          Text("Équipements", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.sm),
          Text(
            "Les équipements CrossFit avec leur modèle 3D : ouvre-en un pour voir comment l'utiliser et quels exercices l'utilisent.",
            style: t.textTheme.bodyMedium
                ?.copyWith(color: couleurs.onSurfaceVariant),
          ),
          const SizedBox(height: Sp.md),
          for (final eq in equipementsCrossfit)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: couleurs.primaryContainer,
                  child: Icon(eq.icone, color: couleurs.primary, size: 20),
                ),
                title: Text(eq.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "${tousExercicesCrossfit.where((e) => e.equipement == eq.nom).length} exercices"),
                trailing: const Icon(Icons.view_in_ar_rounded),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EquipementCrossfitPage(equipement: eq)),
                ),
              ),
            ),
          const SizedBox(height: Sp.xl),
        ],
      ),
    );
  }
}

/// Détail d'un WOD : format, description, exercices, lancement guidé et
/// ajout des exercices à la séance.
class WodDetailPage extends StatelessWidget {
  final Wod wod;
  const WodDetailPage({super.key, required this.wod});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final couleurs = t.colorScheme;

    Widget puce(String texte) => Container(
          padding: const EdgeInsets.symmetric(horizontal: Sp.md, vertical: Sp.xs),
          decoration: BoxDecoration(
            color: couleurs.primaryContainer,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(texte, style: t.textTheme.labelMedium),
        );

    return Scaffold(
      appBar: AppBar(title: Text(wod.nom)),
      body: ListView(
        padding: const EdgeInsets.all(Sp.lg),
        children: [
          Wrap(
            spacing: Sp.sm,
            runSpacing: Sp.sm,
            children: [puce(wod.format), puce(wod.duree), puce(wod.niveau)],
          ),
          const SizedBox(height: Sp.lg),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(Sp.lg),
              child: Text(wod.description, style: t.textTheme.bodyMedium),
            ),
          ),
          const SizedBox(height: Sp.lg),
          FilledButton.icon(
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text("Lancer le WOD (guidé)"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => WodGuidePage(wod: wod)),
            ),
          ),
          const SizedBox(height: Sp.sm),
          FilledButton.tonalIcon(
            icon: const Icon(Icons.playlist_add),
            label:
                Text("Ajouter les ${wod.exercices.length} exercices à la séance"),
            onPressed: () =>
                SessionActivePage.ajouterExercices(context, wod.exercices),
          ),
          const SizedBox(height: Sp.xl),
          Text("Exercices", style: t.textTheme.titleLarge),
          const SizedBox(height: Sp.md),
          for (final nom in wod.exercices)
            Card(
              child: ListTile(
                title: Text(nom),
                subtitle: exerciceCrossfitParNom(nom) != null
                    ? Text(
                        "${exerciceCrossfitParNom(nom)!.equipement} · ${exerciceCrossfitParNom(nom)!.niveau}")
                    : null,
                trailing: IconButton(
                  icon: const Icon(Icons.fitness_center,
                      color: Colors.deepOrange),
                  tooltip: "Ajouter à l'entraînement actif",
                  onPressed: () => SessionActivePage.ajouterEtOuvrir(
                      context, nom,
                      estDuree: null),
                ),
                onTap: fiches.containsKey(nom)
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FichePage(
                              nom: nom,
                              fiche: fiches[nom]!,
                              estDuree: null,
                            ),
                          ),
                        )
                    : null,
              ),
            ),
          const SizedBox(height: Sp.sm),
          Text(
            "Les exercices arrivent dans ta séance sans séries : tu remplis les séries au fur et à mesure, avec le bon type de saisie pour chacun.",
            style: t.textTheme.bodySmall
                ?.copyWith(color: couleurs.onSurfaceVariant),
          ),
          const SizedBox(height: Sp.xl),
        ],
      ),
    );
  }
}
