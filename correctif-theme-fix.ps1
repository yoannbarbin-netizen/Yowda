# correctif-theme-fix.ps1
# Corrige lib/theme/app_theme.dart : polices construites style par style,
# compatibles avec toutes les versions de google_fonts (flutter/material ET material_ui).
# Script 100% ASCII. Cree une sauvegarde .bak avant modification.

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

try {
  $p = Join-Path $root "lib\theme\app_theme.dart"
  if (-not (Test-Path $p)) { throw "fichier introuvable : " + $p }
  Copy-Item $p ($p + ".bak") -Force
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t (B64 "ICBzdGF0aWMgVGV4dFRoZW1lIF90ZXh0VGhlbWUoVGV4dFRoZW1lIGJhc2UsIENvbG9yU2NoZW1lIHMpIHsKICAgIGZpbmFsIGJvZHkgPSBHb29nbGVGb250cy5wbHVzSmFrYXJ0YVNhbnNUZXh0VGhlbWUoYmFzZSkKICAgICAgICAuYXBwbHkoYm9keUNvbG9yOiBzLm9uU3VyZmFjZSwgZGlzcGxheUNvbG9yOiBzLm9uU3VyZmFjZSk7CgogICAgLy8gQ2hpZmZyZXMgOiBTcGFjZSBHcm90ZXNrICsgY2hpZmZyZXMgdGFidWxhaXJlcyAocGFzIGRlIHNhdXQgZHUgY2hyb25vKQogICAgVGV4dFN0eWxlIGZpZ3VyZShkb3VibGUgc2l6ZSkgPT4gR29vZ2xlRm9udHMuc3BhY2VHcm90ZXNrKAogICAgICAgICAgZm9udFNpemU6IHNpemUsCiAgICAgICAgICBmb250V2VpZ2h0OiBGb250V2VpZ2h0Lnc3MDAsCiAgICAgICAgICBoZWlnaHQ6IDEuMCwKICAgICAgICAgIGxldHRlclNwYWNpbmc6IC0xLAogICAgICAgICAgY29sb3I6IHMub25TdXJmYWNlLAogICAgICAgICAgZm9udEZlYXR1cmVzOiBjb25zdCBbRm9udEZlYXR1cmUudGFidWxhckZpZ3VyZXMoKV0sCiAgICAgICAgKTsKCiAgICByZXR1cm4gYm9keS5jb3B5V2l0aCgKICAgICAgZGlzcGxheUxhcmdlOiBmaWd1cmUoNzIpLCAvLyBjaHJvbm8gZGUgc8OpYW5jZQogICAgICBkaXNwbGF5TWVkaXVtOiBmaWd1cmUoNDgpLCAvLyBncm9zIGNoaWZmcmVzIGR1IHLDqWNhcAogICAgICBkaXNwbGF5U21hbGw6IGZpZ3VyZSgzNiksCiAgICAgIGhlYWRsaW5lTWVkaXVtOiBib2R5LmhlYWRsaW5lTWVkaXVtPy5jb3B5V2l0aCgKICAgICAgICAgIGZvbnRTaXplOiAyOCwgZm9udFdlaWdodDogRm9udFdlaWdodC53ODAwLCBoZWlnaHQ6IDEuMTUpLAogICAgICB0aXRsZUxhcmdlOiBib2R5LnRpdGxlTGFyZ2U/LmNvcHlXaXRoKAogICAgICAgICAgZm9udFNpemU6IDIyLCBmb250V2VpZ2h0OiBGb250V2VpZ2h0Lnc3MDAsIGhlaWdodDogMS4yNSksCiAgICAgIHRpdGxlTWVkaXVtOiBib2R5LnRpdGxlTWVkaXVtPy5jb3B5V2l0aCgKICAgICAgICAgIGZvbnRTaXplOiAxNywgZm9udFdlaWdodDogRm9udFdlaWdodC53NzAwLCBoZWlnaHQ6IDEuMyksCiAgICAgIGJvZHlMYXJnZTogYm9keS5ib2R5TGFyZ2U/LmNvcHlXaXRoKAogICAgICAgICAgZm9udFNpemU6IDE2LCBmb250V2VpZ2h0OiBGb250V2VpZ2h0Lnc1MDAsIGhlaWdodDogMS40KSwKICAgICAgYm9keU1lZGl1bTogYm9keS5ib2R5TWVkaXVtPy5jb3B5V2l0aCgKICAgICAgICAgIGZvbnRTaXplOiAxNCwgZm9udFdlaWdodDogRm9udFdlaWdodC53NTAwLCBoZWlnaHQ6IDEuNCksCiAgICAgIGxhYmVsTGFyZ2U6IGJvZHkubGFiZWxMYXJnZT8uY29weVdpdGgoCiAgICAgICAgICBmb250U2l6ZTogMTUsIGZvbnRXZWlnaHQ6IEZvbnRXZWlnaHQudzcwMCwgbGV0dGVyU3BhY2luZzogMC4xKSwKICAgICAgbGFiZWxTbWFsbDogYm9keS5sYWJlbFNtYWxsPy5jb3B5V2l0aCgKICAgICAgICAgIGZvbnRTaXplOiAxMiwgZm9udFdlaWdodDogRm9udFdlaWdodC53NjAwLCBsZXR0ZXJTcGFjaW5nOiAwLjQpLAogICAgKTsKICB9") (B64 "ICBzdGF0aWMgVGV4dFRoZW1lIF90ZXh0VGhlbWUoVGV4dFRoZW1lIGJhc2UsIENvbG9yU2NoZW1lIHMpIHsKICAgIC8vIENvbnN0cnVpdCBsZXMgc3R5bGVzIHVuIHBhciB1biAob24gw6l2aXRlIHZvbG9udGFpcmVtZW50IGwnQVBJIFRleHRUaGVtZSBkZQogICAgLy8gZ29vZ2xlX2ZvbnRzIDogZWxsZSBuJ2VzdCBwYXMgY29tcGF0aWJsZSBlbnRyZSBmbHV0dGVyL21hdGVyaWFsIGV0IG1hdGVyaWFsX3VpKS4KICAgIFRleHRTdHlsZSBqYWthcnRhKHsKICAgICAgcmVxdWlyZWQgZG91YmxlIHNpemUsCiAgICAgIHJlcXVpcmVkIEZvbnRXZWlnaHQgd2VpZ2h0LAogICAgICBkb3VibGUgaGVpZ2h0ID0gMS40LAogICAgICBkb3VibGUgbGV0dGVyU3BhY2luZyA9IDAsCiAgICB9KSA9PgogICAgICAgIEdvb2dsZUZvbnRzLnBsdXNKYWthcnRhU2FucygKICAgICAgICAgIGZvbnRTaXplOiBzaXplLAogICAgICAgICAgZm9udFdlaWdodDogd2VpZ2h0LAogICAgICAgICAgaGVpZ2h0OiBoZWlnaHQsCiAgICAgICAgICBsZXR0ZXJTcGFjaW5nOiBsZXR0ZXJTcGFjaW5nLAogICAgICAgICAgY29sb3I6IHMub25TdXJmYWNlLAogICAgICAgICk7CgogICAgLy8gQ2hpZmZyZXMgOiBTcGFjZSBHcm90ZXNrICsgY2hpZmZyZXMgdGFidWxhaXJlcyAocGFzIGRlIHNhdXQgZHUgY2hyb25vKQogICAgVGV4dFN0eWxlIGZpZ3VyZShkb3VibGUgc2l6ZSkgPT4gR29vZ2xlRm9udHMuc3BhY2VHcm90ZXNrKAogICAgICAgICAgZm9udFNpemU6IHNpemUsCiAgICAgICAgICBmb250V2VpZ2h0OiBGb250V2VpZ2h0Lnc3MDAsCiAgICAgICAgICBoZWlnaHQ6IDEuMCwKICAgICAgICAgIGxldHRlclNwYWNpbmc6IC0xLAogICAgICAgICAgY29sb3I6IHMub25TdXJmYWNlLAogICAgICAgICAgZm9udEZlYXR1cmVzOiBjb25zdCBbRm9udEZlYXR1cmUudGFidWxhckZpZ3VyZXMoKV0sCiAgICAgICAgKTsKCiAgICByZXR1cm4gYmFzZS5jb3B5V2l0aCgKICAgICAgZGlzcGxheUxhcmdlOiBmaWd1cmUoNzIpLCAvLyBjaHJvbm8gZGUgc8OpYW5jZQogICAgICBkaXNwbGF5TWVkaXVtOiBmaWd1cmUoNDgpLCAvLyBncm9zIGNoaWZmcmVzIGR1IHLDqWNhcAogICAgICBkaXNwbGF5U21hbGw6IGZpZ3VyZSgzNiksCiAgICAgIGhlYWRsaW5lTWVkaXVtOiBqYWthcnRhKHNpemU6IDI4LCB3ZWlnaHQ6IEZvbnRXZWlnaHQudzgwMCwgaGVpZ2h0OiAxLjE1KSwKICAgICAgdGl0bGVMYXJnZTogamFrYXJ0YShzaXplOiAyMiwgd2VpZ2h0OiBGb250V2VpZ2h0Lnc3MDAsIGhlaWdodDogMS4yNSksCiAgICAgIHRpdGxlTWVkaXVtOiBqYWthcnRhKHNpemU6IDE3LCB3ZWlnaHQ6IEZvbnRXZWlnaHQudzcwMCwgaGVpZ2h0OiAxLjMpLAogICAgICBib2R5TGFyZ2U6IGpha2FydGEoc2l6ZTogMTYsIHdlaWdodDogRm9udFdlaWdodC53NTAwKSwKICAgICAgYm9keU1lZGl1bTogamFrYXJ0YShzaXplOiAxNCwgd2VpZ2h0OiBGb250V2VpZ2h0Lnc1MDApLAogICAgICBsYWJlbExhcmdlOiBqYWthcnRhKHNpemU6IDE1LCB3ZWlnaHQ6IEZvbnRXZWlnaHQudzcwMCwgbGV0dGVyU3BhY2luZzogMC4xKSwKICAgICAgbGFiZWxTbWFsbDogamFrYXJ0YShzaXplOiAxMiwgd2VpZ2h0OiBGb250V2VpZ2h0Lnc2MDAsIGxldHRlclNwYWNpbmc6IDAuNCksCiAgICApOwogIH0=") 'theme-text'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $t2 = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  Write-Host "=== TOUT EST OK ===" -ForegroundColor Green
  Write-Host ("Controle : nouveaux styles = " + [bool]($t2.Contains("GoogleFonts.plusJakartaSans(")) + " ; ancienne API retiree = " + [bool](-not $t2.Contains("plusJakartaSansTextTheme")))
  Write-Host "Etape suivante : lancer  flutter analyze"
} catch {
  Write-Host ("=== ECHEC : " + $_.Exception.Message) -ForegroundColor Red
  Write-Host "Le fichier n'a pas ete modifie (sauvegarde .bak disponible a cote)."
}
