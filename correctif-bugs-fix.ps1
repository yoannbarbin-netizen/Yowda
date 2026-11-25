# correctif-bugs-fix.ps1
# Corrige 2 bugs du redesign :
#  1. la fiche d'exercice (lib/fiche_modele.dart) repasse sur flutter/material
#  2. la grille des categories (accueil) ne deborde plus sur petit ecran
# Script 100% ASCII. Cree des sauvegardes .bak avant modification.

$ErrorActionPreference = "Stop"
$root = "C:\Users\seijo\Documents\appli-muscu\appli_muscu"
$CR = [string][char]13
$LF = [string][char]10
$UTF8 = [System.Text.UTF8Encoding]::new($false)

function R1($t, $old, $new, $label) {
  $n = ([regex]::Matches($t, [regex]::Escape($old))).Count
  if ($n -ne 1) { throw ($label + " : texte trouve " + $n + " fois (attendu 1)") }
  return $t.Replace($old, $new)
}

$okList = @()
$koList = @()

# ---------- 1/3 : fiche_modele.dart ----------
try {
  $p = Join-Path $root "lib\fiche_modele.dart"
  Copy-Item $p ($p + ".bak") -Force
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t 'import ''package:material_ui/material_ui.dart'';' 'import ''package:flutter/material.dart'';' 'fiche-import'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "fiche"
  Write-Host "[OK] lib\fiche_modele.dart (retour sur flutter/material)"
} catch {
  $koList += "fiche"
  Write-Host ("[ECHEC] lib\fiche_modele.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 2/3 : category_card.dart ----------
try {
  $p = Join-Path $root "lib\widgets\category_card.dart"
  Copy-Item $p ($p + ".bak") -Force
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t ('                    Text(subtitle,' + $LF + '                        style: t.textTheme.bodyMedium' + $LF + '                            ?.copyWith(color: s.onSurfaceVariant)),') ('                    Text(subtitle,' + $LF + '                        maxLines: 1,' + $LF + '                        overflow: TextOverflow.ellipsis,' + $LF + '                        style: t.textTheme.bodyMedium' + $LF + '                            ?.copyWith(color: s.onSurfaceVariant)),') 'card-subtitle'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "card"
  Write-Host "[OK] lib\widgets\category_card.dart (sous-titre tronque proprement)"
} catch {
  $koList += "card"
  Write-Host ("[ECHEC] lib\widgets\category_card.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 3/3 : accueil_page.dart ----------
try {
  $p = Join-Path $root "lib\pages\accueil_page.dart"
  Copy-Item $p ($p + ".bak") -Force
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t ('                GridView.count(' + $LF + '                  crossAxisCount: 2,' + $LF + '                  mainAxisSpacing: Sp.md,' + $LF + '                  crossAxisSpacing: Sp.md,' + $LF + '                  childAspectRatio: 2.3,' + $LF + '                  shrinkWrap: true,' + $LF + '                  physics: const NeverScrollableScrollPhysics(),') ('                GridView(' + $LF + '                  shrinkWrap: true,' + $LF + '                  physics: const NeverScrollableScrollPhysics(),' + $LF + '                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(' + $LF + '                    crossAxisCount: 2,' + $LF + '                    mainAxisSpacing: Sp.md,' + $LF + '                    crossAxisSpacing: Sp.md,' + $LF + '                    mainAxisExtent: 84,' + $LF + '                  ),') 'grid-extent'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "grid"
  Write-Host "[OK] lib\pages\accueil_page.dart (grille a hauteur fixe)"
} catch {
  $koList += "grid"
  Write-Host ("[ECHEC] lib\pages\accueil_page.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- Resume ----------
Write-Host ""
if ($koList.Count -eq 0) {
  Write-Host "=== TOUT EST OK (2 bugs corriges) ===" -ForegroundColor Green
  $t1 = [IO.File]::ReadAllText((Join-Path $root "lib\fiche_modele.dart"), [Text.Encoding]::UTF8)
  $t2 = [IO.File]::ReadAllText((Join-Path $root "lib\pages\accueil_page.dart"), [Text.Encoding]::UTF8)
  Write-Host ("Controle : fiche sur flutter/material = " + [bool]($t1.Contains("package:flutter/material.dart") -and -not $t1.Contains("material_ui")) + " ; grille hauteur fixe = " + [bool]($t2.Contains("mainAxisExtent: 84")))
  Write-Host "Etape suivante : lancer  flutter analyze"
} else {
  Write-Host "=== ECHEC PARTIEL : ===" -ForegroundColor Red
  foreach ($k in $koList) { Write-Host ("  - " + $k) }
  Write-Host "Les sauvegardes .bak sont a cote des fichiers. Envoie-moi ce message."
}
