import 'package:appli_muscu/fiche_modele.dart';
import 'package:appli_muscu/fiches_machines.dart';

export 'package:appli_muscu/fiche_modele.dart';

final Map<String, FicheExercice> fiches = {
  ...fichesMachines,
};