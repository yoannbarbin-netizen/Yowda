# correctif-redesign.ps1
# REDESIGN Lot 1 : theme Material 3 (sombre + clair), navigation 4 onglets, nouvel accueil.
# Script 100% ASCII. Cree des sauvegardes .bak avant d'ecraser les fichiers existants.

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

# ---------- 1/4 : sauvegardes ----------
$aBackuper = @("lib\main.dart", "lib\pages\recap_seances_page.dart", "lib\data\session_hive.dart", "pubspec.yaml")
foreach ($f in $aBackuper) {
  $p = Join-Path $root $f
  if (Test-Path $p) { Copy-Item $p ($p + ".bak") -Force }
}
Write-Host "Sauvegardes .bak creees (fichiers existants)."
Write-Host ""

$okList = @()
$koList = @()

# ---------- 2/4 : installation des 8 fichiers (theme, coquille, accueil, recap, main) ----------
try {
  $zipB64 = ("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")
  $tmp = Join-Path $env:TEMP "redesign-lot1.zip"
  [IO.File]::WriteAllBytes($tmp, [Convert]::FromBase64String($zipB64))
  Expand-Archive -Path $tmp -DestinationPath $root -Force
  Remove-Item $tmp -Force
  $okList += "fichiers"
  Write-Host "[OK] 8 fichiers installes (theme, navigation, accueil, recap, main)"
} catch {
  $koList += "fichiers"
  Write-Host ("[ECHEC] installation des fichiers : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 3/4 : pubspec.yaml (google_fonts si absent) ----------
try {
  $p = Join-Path $root "pubspec.yaml"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  if ($t.Contains("google_fonts")) {
    Write-Host "[OK] pubspec.yaml : google_fonts deja present"
    $okList += "pubspec"
  } else {
    $crlf = $t.Contains($CR + $LF)
    $t = $t.Replace($CR, "")
    $t = R1 $t '  model_viewer_plus: ^1.10.0' ('  model_viewer_plus: ^1.10.0' + $LF + '  google_fonts: ^6.2.1') 'pubspec'
    $out = $t
    if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
    [IO.File]::WriteAllText($p, $out, $UTF8)
    $okList += "pubspec"
    Write-Host "[OK] pubspec.yaml : google_fonts ajoute"
  }
} catch {
  $koList += "pubspec"
  Write-Host ("[ECHEC] pubspec.yaml : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 4/4 : session_hive.dart (supprimerSession si absent) ----------
try {
  $p = Join-Path $root "lib\data\session_hive.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  if ($t.Contains("supprimerSession")) {
    Write-Host "[OK] session_hive.dart : supprimerSession deja present"
    $okList += "session_hive"
  } else {
    $crlf = $t.Contains($CR + $LF)
    $t = $t.Replace($CR, "")
    $t = R1 $t ('  /// Supprime une session.' + $LF + '  Future<void> supprimer(String key) async {' + $LF + '    await _box.delete(key);' + $LF + '  }') (B64 "ICAvLy8gU3VwcHJpbWUgdW5lIHNlc3Npb24uCiAgRnV0dXJlPHZvaWQ+IHN1cHByaW1lcihTdHJpbmcga2V5KSBhc3luYyB7CiAgICBhd2FpdCBfYm94LmRlbGV0ZShrZXkpOwogIH0KCiAgLy8vIFN1cHByaW1lIHVuZSBzZXNzaW9uIHBhciBzb24gb2JqZXQgKG3Dqm1lIGNsw6kgcXVlIHNhdXZlZ2FyZGVyKS4KICBGdXR1cmU8dm9pZD4gc3VwcHJpbWVyU2Vzc2lvbihXb3Jrb3V0U2Vzc2lvbiBzZXNzaW9uKSBhc3luYyB7CiAgICBhd2FpdCBfYm94LmRlbGV0ZShfY2xlKHNlc3Npb24pKTsKICB9") 'hive-methode'
    $out = $t
    if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
    [IO.File]::WriteAllText($p, $out, $UTF8)
    $okList += "session_hive"
    Write-Host "[OK] session_hive.dart : supprimerSession ajoute"
  }
} catch {
  $koList += "session_hive"
  Write-Host ("[ECHEC] lib\data\session_hive.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- Resume + controles ----------
Write-Host ""
if ($koList.Count -eq 0) {
  Write-Host "=== TOUT EST OK ===" -ForegroundColor Green
  $aVerifier = @("lib\theme\app_theme.dart", "lib\app_shell.dart", "lib\pages\accueil_page.dart", "lib\pages\exercices_page.dart", "lib\pages\profil_page.dart", "lib\pages\recap_seances_page.dart", "lib\widgets\category_card.dart", "lib\main.dart")
  $manquants = 0
  foreach ($f in $aVerifier) { if (-not (Test-Path (Join-Path $root $f))) { $manquants = $manquants + 1; Write-Host ("  MANQUANT : " + $f) -ForegroundColor Red } }
  $t2 = [IO.File]::ReadAllText((Join-Path $root "lib\main.dart"), [Text.Encoding]::UTF8)
  $t3 = [IO.File]::ReadAllText((Join-Path $root "pubspec.yaml"), [Text.Encoding]::UTF8)
  Write-Host ("Controle : fichiers manquants = " + $manquants + " ; main.dart contient AppTheme = " + [bool]($t2.Contains("AppTheme")) + " ; pubspec contient google_fonts = " + [bool]($t3.Contains("google_fonts")))
  Write-Host "Etape suivante : lancer  flutter analyze  (il fera le pub get tout seul)"
} else {
  Write-Host "=== ECHEC PARTIEL : ===" -ForegroundColor Red
  foreach ($k in $koList) { Write-Host ("  - " + $k) }
  Write-Host "Les sauvegardes .bak sont a cote des fichiers. Envoie-moi ce message."
}
