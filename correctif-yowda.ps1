# correctif-yowda.ps1
# Correctif restant "Fentes marchees" (fin des etapes 3 et 4).
# Script 100% ASCII. Cree des sauvegardes .bak avant toute modification.
# Si un texte attendu est introuvable, le fichier concerne n'est PAS modifie.

$ErrorActionPreference = "Stop"
$root = "C:\Users\seijo\Documents\appli-muscu\appli_muscu"
$CR = [string][char]13
$LF = [string][char]10
$UTF8 = [System.Text.UTF8Encoding]::new($false)

function B64($s) { return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($s)) }

function R1($t, $old, $new, $label) {
  $n = ([regex]::Matches($t, [regex]::Escape($old))).Count
  if ($n -ne 1) { throw ($label + " : texte trouve " + $n + " fois (attendu 1)") }
  return $t.Replace($old, $new)
}

function R3($t, $old, $new, $label) {
  $n = ([regex]::Matches($t, [regex]::Escape($old))).Count
  if ($n -ne 3) { throw ($label + " : texte trouve " + $n + " fois (attendu 3)") }
  return $t.Replace($old, $new)
}

$files = @("lib\models\session.dart", "lib\pages\session_active_page.dart", "lib\salle_page.dart", "lib\fiche_modele.dart")
foreach ($f in $files) {
  $p = Join-Path $root $f
  if (-not (Test-Path $p)) { Write-Host ("[ECHEC] fichier introuvable : " + $p) -ForegroundColor Red; exit 1 }
  Copy-Item $p ($p + ".bak") -Force
}
Write-Host "Sauvegardes .bak creees."
Write-Host ""

$okList = @()
$koList = @()

# ---------- 1/4 : session.dart ----------
try {
  $p = Join-Path $root "lib\models\session.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $i = $t.IndexOf("class PerformedExercise {")
  if ($i -lt 0) { throw "classe PerformedExercise introuvable" }
  $j = $t.IndexOf($LF + "}", $i)
  if ($j -lt 0) { throw "fin de classe introuvable" }
  $j = $j + 2
  $t = $t.Substring(0, $i) + (B64 "Y2xhc3MgUGVyZm9ybWVkRXhlcmNpc2UgewogIFN0cmluZyBub207IC8vIGNsw6kgaWRlbnRpcXVlIGF1IG5vbSBleGVyY2ljZSBkZSBzYWxsZV9wYWdlLmRhcnQKICBMaXN0PFBlcmZvcm1lZFNldD4gc2VyaWVzOwogIGJvb2wgZmFpdDsgLy8gdHJ1ZSBxdWFuZCBsJ3V0aWxpc2F0ZXVyIGEgYmFycsOpIGwnZXhlcmNpY2UgKGZhaXQpCiAgYm9vbD8gZXN0RHVyZWU7IC8vIHRydWUgPSBkdXLDqWUgKHNlY29uZGVzKSwgZmFsc2UgPSBwb2lkcy9yZXBzIDsgbnVsbCA9IGTDqWR1aXJlIGR1IG5vbSAoYW5jaWVubmVzIHPDqWFuY2VzKQoKICBQZXJmb3JtZWRFeGVyY2lzZSh7cmVxdWlyZWQgdGhpcy5ub20sIExpc3Q8UGVyZm9ybWVkU2V0Pj8gc2VyaWVzLCB0aGlzLmZhaXQgPSBmYWxzZSwgdGhpcy5lc3REdXJlZX0pCiAgICA6IHNlcmllcyA9IHNlcmllcyA/PyBbXTsKCiAgaW50IGdldCB0b3RhbFNlcmllcyA9PiBzZXJpZXMubGVuZ3RoOwogIGRvdWJsZSBnZXQgcG9pZHNNYXggPT4KICAgICAgc2VyaWVzLmlzRW1wdHkgPyAwLjAgOiBzZXJpZXMubWFwKChzKSA9PiBzLnBvaWRzS2cpLnJlZHVjZSgoYSwgYikgPT4gYSA+IGIgPyBhIDogYik7CgogIE1hcDxTdHJpbmcsIGR5bmFtaWM+IHRvSnNvbigpID0+IHsKICAgICAgICAnbm9tJzogbm9tLAogICAgICAgICdzZXJpZXMnOiBzZXJpZXMubWFwKChzKSA9PiBzLnRvSnNvbigpKS50b0xpc3QoKSwKICAgICAgICAnZmFpdCc6IGZhaXQsCiAgICAgICAgJ2VzdF9kdXJlZSc6IGVzdER1cmVlLAogICAgICB9OwoKICBzdGF0aWMgUGVyZm9ybWVkRXhlcmNpc2UgZnJvbUpzb24oTWFwPGR5bmFtaWMsIGR5bmFtaWM+IGpzb24pID0+IFBlcmZvcm1lZEV4ZXJjaXNlKAogICAgICAgIG5vbToganNvblsnbm9tJ10gYXMgU3RyaW5nPyA/PyAnJywKICAgICAgICBzZXJpZXM6IChqc29uWydzZXJpZXMnXSBhcyBMaXN0PGR5bmFtaWM+PykKICAgICAgICAgICAgPy5tYXAoKHMpID0+IFBlcmZvcm1lZFNldC5mcm9tSnNvbihzIGFzIE1hcDxkeW5hbWljLCBkeW5hbWljPikpCiAgICAgICAgICAgIC50b0xpc3QoKSA/PyBbXSwKICAgICAgICBmYWl0OiBqc29uWydmYWl0J10gYXMgYm9vbD8gPz8gZmFsc2UsCiAgICAgICAgZXN0RHVyZWU6IGpzb25bJ2VzdF9kdXJlZSddIGFzIGJvb2w/LAogICAgICApOwp9") + $t.Substring($j)
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "session.dart"
  Write-Host "[OK] lib\models\session.dart"
} catch {
  $koList += "session.dart"
  Write-Host ("[ECHEC] lib\models\session.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 2/4 : session_active_page.dart ----------
try {
  $p = Join-Path $root "lib\pages\session_active_page.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $i = $t.IndexOf("/// Indique si l'exercice pr")
  if ($i -lt 0) { throw "bloc du champ preselectionEstDuree introuvable" }
  $endm = "this.preselectionEstDuree = false});"
  $j = $t.IndexOf($endm, $i)
  if ($j -lt 0) { throw "fin du bloc du champ introuvable" }
  $j = $j + $endm.Length
  $t = $t.Substring(0, $i) + (B64 "Ly8vIFR5cGUgZGUgc2Fpc2llIGltcG9zw6kgcG91ciBsJ2V4ZXJjaWNlIHByw6ktc8OpbGVjdGlvbm7DqSA6CiAgLy8vIHRydWUgPSBkdXLDqWUgKHNlY29uZGVzKSwgZmFsc2UgPSBwb2lkcy9yZXBzLCBudWxsID0gZMOpZHVpcmUgZHUgbm9tLgogIGZpbmFsIGJvb2w/IHByZXNlbGVjdGlvbkVzdER1cmVlOwoKICBjb25zdCBTZXNzaW9uQWN0aXZlUGFnZSh7c3VwZXIua2V5LCB0aGlzLnByZXNlbGVjdGlvbk5vbSwgdGhpcy5wcmVzZWxlY3Rpb25Fc3REdXJlZX0pOw==") + $t.Substring($j)
  $t = R1 $t '  static Future<void> ajouterEtOuvrir(BuildContext context, String nomExercise) async {' (B64 "ICAvLy8gW2VzdER1cmVlXSA6IHRydWUgPSBkdXLDqWUsIGZhbHNlID0gcG9pZHMvcmVwcywgbnVsbCA9IGTDqWR1aXJlIGR1IG5vbS4KICBzdGF0aWMgRnV0dXJlPHZvaWQ+IGFqb3V0ZXJFdE91dnJpcihCdWlsZENvbnRleHQgY29udGV4dCwgU3RyaW5nIG5vbUV4ZXJjaXNlLCB7Ym9vbD8gZXN0RHVyZWV9KSBhc3luYyB7") 'AJ1'
  $t = R1 $t '        builder: (_) => SessionActivePage(preselectionNom: nomExercise),' '        builder: (_) => SessionActivePage(preselectionNom: nomExercise, preselectionEstDuree: estDuree),' 'AJ2'
  $t = R1 $t ('' + $LF + '                    fait: _session.exercices[existing].fait,') ('' + $LF + '                    fait: _session.exercices[existing].fait,' + $LF + '                    estDuree: _session.exercices[existing].estDuree,') '3a'
  $t = R1 $t ('' + $LF + '                  _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set]));') ('' + $LF + '                  _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set], estDuree: true));') '3b'
  $t = R1 $t ('' + $LF + '      _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set]));') ('' + $LF + '      _session.exercices.add(PerformedExercise(nom: nomExercise, series: [set], estDuree: false));') '3c'
  $t = R1 $t ('' + $LF + '        fait: _session.exercices[existing].fait,') ('' + $LF + '        fait: _session.exercices[existing].fait,' + $LF + '        estDuree: _session.exercices[existing].estDuree,') '3c2'
  $t = R1 $t ('' + $LF + '      fait: ex.fait,') ('' + $LF + '      fait: ex.fait,' + $LF + '      estDuree: ex.estDuree,') '3d'
  $t = R1 $t ('' + $LF + '      fait: !ex.fait,') ('' + $LF + '      fait: !ex.fait,' + $LF + '      estDuree: ex.estDuree,') '3e'
  $t = R1 $t '  bool _isExDuree(int index) => isDureeExercice(_session.exercices[index].nom);' '  bool _isExDuree(int index) => _session.exercices[index].estDuree ?? isDureeExercice(_session.exercices[index].nom);' '3f'
  $t = R1 $t 'WidgetsBinding.instance.addPostFrameCallback((_) => _ajouterSet(ex));' 'WidgetsBinding.instance.addPostFrameCallback((_) => _ajouterSet(ex, estDureeForce: false));' '3g'
  $t = R1 $t 'onPressed: () => _ajouterSet(_session.exercices[i].nom),' 'onPressed: () => _ajouterSet(_session.exercices[i].nom, estDureeForce: _session.exercices[i].estDuree),' '3h'
  $t = R3 $t 'SessionActivePage.isDureeExercice(ex.nom)' '(ex.estDuree ?? SessionActivePage.isDureeExercice(ex.nom))' 'bilan'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "session_active_page.dart"
  Write-Host "[OK] lib\pages\session_active_page.dart"
} catch {
  $koList += "session_active_page.dart"
  Write-Host ("[ECHEC] lib\pages\session_active_page.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 3/4 : salle_page.dart ----------
try {
  $p = Join-Path $root "lib\salle_page.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t 'SessionActivePage.ajouterEtOuvrir(context, equipement.exercices[i]),' 'SessionActivePage.ajouterEtOuvrir(context, equipement.exercices[i], estDuree: false),' 'salle'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "salle_page.dart"
  Write-Host "[OK] lib\salle_page.dart"
} catch {
  $koList += "salle_page.dart"
  Write-Host ("[ECHEC] lib\salle_page.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 4/4 : fiche_modele.dart ----------
try {
  $p = Join-Path $root "lib\fiche_modele.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t 'SessionActivePage.ajouterEtOuvrir(context, nom),' 'SessionActivePage.ajouterEtOuvrir(context, nom, estDuree: false),' 'fiche'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "fiche_modele.dart"
  Write-Host "[OK] lib\fiche_modele.dart"
} catch {
  $koList += "fiche_modele.dart"
  Write-Host ("[ECHEC] lib\fiche_modele.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- Resume ----------
Write-Host ""
if ($koList.Count -eq 0) {
  Write-Host "=== TOUT EST OK (4 fichiers modifies) ===" -ForegroundColor Green
  $p2 = Join-Path $root "lib\pages\session_active_page.dart"
  $t2 = [IO.File]::ReadAllText($p2, [Text.Encoding]::UTF8)
  $c1 = ([regex]::Matches($t2, [regex]::Escape(".estDuree"))).Count
  $c2 = ([regex]::Matches($t2, [regex]::Escape("estDureeForce:"))).Count
  Write-Host ("Controle : .estDuree = " + $c1 + " (attendu : au moins 8) ; estDureeForce: = " + $c2 + " (attendu : 3)")
  Write-Host "Etape suivante : lancer  flutter analyze"
} else {
  Write-Host "=== ECHEC PARTIEL : fichiers NON modifies : ===" -ForegroundColor Red
  foreach ($k in $koList) { Write-Host ("  - " + $k) }
  Write-Host "Les sauvegardes .bak sont a cote des fichiers. Envoie-moi ce message."
}
