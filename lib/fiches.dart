import 'package:appli_muscu/fiche_modele.dart';
import 'package:appli_muscu/fiches_machines.dart';
import 'package:appli_muscu/fiches_poulies_a.dart';
import 'package:appli_muscu/fiches_poulies_b.dart';

export 'package:appli_muscu/fiche_modele.dart';

final Map<String, FicheExercice> fiches = {
  ...fichesMachines,
  ...fichesPouliesA,
  ...fichesPouliesB,
};