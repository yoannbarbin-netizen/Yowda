import 'package:appli_muscu/fiche_modele.dart';
import 'package:appli_muscu/fiches_machines.dart';
import 'package:appli_muscu/fiches_poulies_a.dart';
import 'package:appli_muscu/fiches_poulies_b.dart';
import 'package:appli_muscu/fiches_bancs_a.dart';
import 'package:appli_muscu/fiches_bancs_b.dart';
import 'package:appli_muscu/fiches_poids_libres_a.dart';
import 'package:appli_muscu/fiches_poids_libres_b.dart';
import 'package:appli_muscu/fiches_poids_libres_c.dart';

export 'package:appli_muscu/fiche_modele.dart';

final Map<String, FicheExercice> fiches = {
  ...fichesMachines,
  ...fichesPouliesA,
  ...fichesPouliesB,
  ...fichesBancsA,
  ...fichesBancsB,
  ...fichesPoidsLibresA,
  ...fichesPoidsLibresB,
  ...fichesPoidsLibresC,
};