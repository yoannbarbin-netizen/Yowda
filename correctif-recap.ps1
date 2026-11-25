# correctif-recap.ps1
# Ajoute l'ecran "Recap de mes seances" (historique) + bouton sur l'accueil.
# Script 100% ASCII. Cree des sauvegardes .bak avant toute modification.

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

$files = @("lib\main.dart", "lib\data\session_hive.dart")
foreach ($f in $files) {
  $p = Join-Path $root $f
  if (-not (Test-Path $p)) { Write-Host ("[ECHEC] fichier introuvable : " + $p) -ForegroundColor Red; exit 1 }
  Copy-Item $p ($p + ".bak") -Force
}
Write-Host "Sauvegardes .bak creees."
Write-Host ""

$okList = @()
$koList = @()

# ---------- 1/3 : nouveau fichier recap_seances_page.dart ----------
try {
  $p = Join-Path $root "lib\pages\recap_seances_page.dart"
  if (Test-Path $p) { Copy-Item $p ($p + ".bak") -Force }
  [IO.File]::WriteAllText($p, (B64 ("aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CgppbXBvcnQgJy4uL2RhdGEvc2Vzc2lvbl9oaXZlLmRhcnQnOwppbXBvcnQgJy4uL21vZGVscy9zZXNzaW9uLmRhcnQnOwppbXBvcnQgJ3Nlc3Npb25fYWN0aXZlX3BhZ2UuZGFydCc7CgovLy8gw4ljcmFuIMKrIFLDqWNhcCBkZSBtZXMgc8OpYW5jZXMgwrsgOiBoaXN0b3JpcXVlIGRlcyBzw6lhbmNlcyBlbnJlZ2lzdHLDqWVzCi8vLyAoZGF0ZSwgZHVyw6llLCBleGVyY2ljZXMgZXQgc8OpcmllcykuIEdsaXNzZSB1bmUgY2FydGUgdmVycyBsYSBnYXVjaGUKLy8vIHBvdXIgc3VwcHJpbWVyIHVuZSBzw6lhbmNlLgpjbGFzcyBSZWNhcFNlYW5jZXNQYWdlIGV4dGVuZHMgU3RhdGVmdWxXaWRnZXQgewogIGNvbnN0IFJlY2FwU2VhbmNlc1BhZ2Uoe3N1cGVyLmtleX0pOwoKICBAb3ZlcnJpZGUKICBTdGF0ZTxSZWNhcFNlYW5jZXNQYWdlPiBjcmVhdGVTdGF0ZSgpID0+IF9SZWNhcFNlYW5jZXNQYWdlU3RhdGUoKTsKfQoKY2xhc3MgX1JlY2FwU2VhbmNlc1BhZ2VTdGF0ZSBleHRlbmRzIFN0YXRlPFJlY2FwU2VhbmNlc1BhZ2U+IHsKICBMaXN0PFdvcmtvdXRTZXNzaW9uPiBfc2Vzc2lvbnMgPSBbXTsKICBib29sIF9jaGFyZ2VtZW50ID0gdHJ1ZTsKCiAgc3RhdGljIGNvbnN0IExpc3Q8U3RyaW5nPiBfam91cnMgPSBbCiAgICAnbHVuZGknLAogICAgJ21hcmRpJywKICAgICdtZXJjcmVkaScsCiAgICAnamV1ZGknLAogICAgJ3ZlbmRyZWRpJywKICAgICdzYW1lZGknLAogICAgJ2RpbWFuY2hlJywKICBdOwoKICBAb3ZlcnJpZGUKICB2b2lkIGluaXRTdGF0ZSgpIHsKICAgIHN1cGVyLmluaXRTdGF0ZSgpOwogICAgX2NoYXJnZXIoKTsKICB9CgogIEZ1dHVyZTx2b2lkPiBfY2hhcmdlcigpIGFzeW5jIHsKICAgIGZpbmFs" +
      "IHNlc3Npb25zID0gYXdhaXQgc2Vzc2lvblN0b3JhZ2UuY2hhcmdlclRvdXRlcygpOwogICAgc2Vzc2lvbnMuc29ydCgoYSwgYikgPT4gYi5kZWJ1dC5jb21wYXJlVG8oYS5kZWJ1dCkpOyAvLyBwbHVzIHLDqWNlbnRlcyBkJ2Fib3JkCiAgICBpZiAobW91bnRlZCkgewogICAgICBzZXRTdGF0ZSgoKSB7CiAgICAgICAgX3Nlc3Npb25zID0gc2Vzc2lvbnM7CiAgICAgICAgX2NoYXJnZW1lbnQgPSBmYWxzZTsKICAgICAgfSk7CiAgICB9CiAgfQoKICBTdHJpbmcgX2Zvcm1hdERhdGUoRGF0ZVRpbWUgZCkgewogICAgZmluYWwgam91ciA9IF9qb3Vyc1tkLndlZWtkYXkgLSAxXTsKICAgIGZpbmFsIGRkID0gZC5kYXkudG9TdHJpbmcoKS5wYWRMZWZ0KDIsICcwJyk7CiAgICBmaW5hbCBtbSA9IGQubW9udGgudG9TdHJpbmcoKS5wYWRMZWZ0KDIsICcwJyk7CiAgICBmaW5hbCBoID0gZC5ob3VyLnRvU3RyaW5nKCkucGFkTGVmdCgyLCAnMCcpOwogICAgZmluYWwgbWluID0gZC5taW51dGUudG9TdHJpbmcoKS5wYWRMZWZ0KDIsICcwJyk7CiAgICByZXR1cm4gJyRqb3VyICRkZC8kbW0vJHtkLnllYXJ9IMK3ICRoOiRtaW4nOwogIH0KCiAgU3RyaW5nIF9mb3JtYXREdXJlZShEdXJhdGlvbiBkKSB7CiAgICBmaW5hbCBoID0gZC5pbkhvdXJzOwogICAgZmluYWwgbSA9IGQuaW5NaW51dGVzICUgNjA7CiAgICBpZiAoaCA+IDApIHJldHVybiAnJHtofWgke20udG9TdHJpbmcoKS5wYWRMZWZ0KDIsICcwJyl9JzsKICAgIHJldHVybiAnJG0gbWluJzsKICB9CgogIFN0cmluZyBfcmVzdW1lRXhlcmNpY2UoUGVyZm9ybWVkRXhlcmNpc2UgZXgpIHsKICAgIGlmIChleC5zZXJpZXMuaXNFbXB0eSkgcmV0dXJuICdBdWN1bmUgc8OpcmllJzsKICAgIGZpbmFsIGVzdER1cmVlID0gZXguZXN0RHVyZWUgPz8g" +
      "U2Vzc2lvbkFjdGl2ZVBhZ2UuaXNEdXJlZUV4ZXJjaWNlKGV4Lm5vbSk7CiAgICBpZiAoZXN0RHVyZWUpIHsKICAgICAgZmluYWwgbWF4ID0KICAgICAgICAgIGV4LnNlcmllcy5tYXAoKHMpID0+IHMuZHVyZWUuaW5TZWNvbmRzKS5yZWR1Y2UoKGEsIGIpID0+IGEgPiBiID8gYSA6IGIpOwogICAgICByZXR1cm4gJ0R1csOpZSBtYXggOiAke21heH1zJzsKICAgIH0KICAgIGZpbmFsIHJlcHNNYXggPSBleC5zZXJpZXMubWFwKChzKSA9PiBzLnJlcHMpLnJlZHVjZSgoYSwgYikgPT4gYSA+IGIgPyBhIDogYik7CiAgICByZXR1cm4gJ01heCAke2V4LnBvaWRzTWF4LnRvU3RyaW5nQXNGaXhlZCgxKX0ga2cgw5cgJHJlcHNNYXggcmVwcyc7CiAgfQoKICBGdXR1cmU8dm9pZD4gX3N1cHByaW1lcihXb3Jrb3V0U2Vzc2lvbiBzZXNzaW9uKSBhc3luYyB7CiAgICBmaW5hbCBvayA9IGF3YWl0IHNob3dEaWFsb2c8Ym9vbD4oCiAgICAgIGNvbnRleHQ6IGNvbnRleHQsCiAgICAgIGJ1aWxkZXI6IChjdHgpID0+IEFsZXJ0RGlhbG9nKAogICAgICAgIHRpdGxlOiBjb25zdCBUZXh0KCdTdXBwcmltZXIgY2V0dGUgc8OpYW5jZSA/JyksCiAgICAgICAgY29udGVudDogVGV4dChfZm9ybWF0RGF0ZShzZXNzaW9uLmRlYnV0KSksCiAgICAgICAgYWN0aW9uczogWwogICAgICAgICAgVGV4dEJ1dHRvbigKICAgICAgICAgICAgb25QcmVzc2VkOiAoKSA9PiBOYXZpZ2F0b3IucG9wKGN0eCwgZmFsc2UpLAogICAgICAgICAgICBjaGlsZDogY29uc3QgVGV4dCgnQW5udWxlcicpLAogICAgICAgICAgKSwKICAgICAgICAgIEZpbGxlZEJ1dHRvbigKICAgICAgICAgICAgb25QcmVzc2VkOiAoKSA9PiBOYXZpZ2F0b3IucG9wKGN0eCwgdHJ1ZSksCiAgICAgICAgICAgIGNoaWxkOiBjb25zdCBUZXh0KCdTdXBwcmlt" +
      "ZXInKSwKICAgICAgICAgICksCiAgICAgICAgXSwKICAgICAgKSwKICAgICk7CiAgICBpZiAob2sgPT0gdHJ1ZSkgewogICAgICBhd2FpdCBzZXNzaW9uU3RvcmFnZS5zdXBwcmltZXJTZXNzaW9uKHNlc3Npb24pOwogICAgICBhd2FpdCBfY2hhcmdlcigpOwogICAgfQogIH0KCiAgQG92ZXJyaWRlCiAgV2lkZ2V0IGJ1aWxkKEJ1aWxkQ29udGV4dCBjb250ZXh0KSB7CiAgICBmaW5hbCBjb3VsZXVycyA9IFRoZW1lLm9mKGNvbnRleHQpLmNvbG9yU2NoZW1lOwoKICAgIHJldHVybiBTY2FmZm9sZCgKICAgICAgYXBwQmFyOiBBcHBCYXIodGl0bGU6IGNvbnN0IFRleHQoJ1LDqWNhcCBkZSBtZXMgc8OpYW5jZXMnKSksCiAgICAgIGJvZHk6IF9jaGFyZ2VtZW50CiAgICAgICAgICA/IGNvbnN0IENlbnRlcihjaGlsZDogQ2lyY3VsYXJQcm9ncmVzc0luZGljYXRvcigpKQogICAgICAgICAgOiBfc2Vzc2lvbnMuaXNFbXB0eQogICAgICAgICAgICAgID8gQ2VudGVyKAogICAgICAgICAgICAgICAgICBjaGlsZDogUGFkZGluZygKICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiBjb25zdCBFZGdlSW5zZXRzLmFsbCgyNCksCiAgICAgICAgICAgICAgICAgICAgY2hpbGQ6IENvbHVtbigKICAgICAgICAgICAgICAgICAgICAgIG1haW5BeGlzU2l6ZTogTWFpbkF4aXNTaXplLm1pbiwKICAgICAgICAgICAgICAgICAgICAgIGNoaWxkcmVuOiBbCiAgICAgICAgICAgICAgICAgICAgICAgIEljb24oSWNvbnMuaGlzdG9yeSwgc2l6ZTogNjQsIGNvbG9yOiBjb3VsZXVycy5vdXRsaW5lKSwKICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgU2l6ZWRCb3goaGVpZ2h0OiAxNiksCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IFRleHQoCiAgICAgICAgICAgICAgICAgICAgICAgICAgIkF1Y3Vu" +
      "ZSBzw6lhbmNlIGVucmVnaXN0csOpZSBwb3VyIGwnaW5zdGFudC5cblRlcm1pbmUgdW5lIHPDqWFuY2UgZCdlbnRyYcOubmVtZW50IHBvdXIgbGEgcmV0cm91dmVyIGljaS4iLAogICAgICAgICAgICAgICAgICAgICAgICAgIHRleHRBbGlnbjogVGV4dEFsaWduLmNlbnRlciwKICAgICAgICAgICAgICAgICAgICAgICAgKSwKICAgICAgICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICAgICAgKSwKICAgICAgICAgICAgICAgICAgKSwKICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgICA6IExpc3RWaWV3KAogICAgICAgICAgICAgICAgICBwYWRkaW5nOiBjb25zdCBFZGdlSW5zZXRzLmFsbCgxNiksCiAgICAgICAgICAgICAgICAgIGNoaWxkcmVuOiBbCiAgICAgICAgICAgICAgICAgICAgZm9yIChmaW5hbCBzIGluIF9zZXNzaW9ucykKICAgICAgICAgICAgICAgICAgICAgIERpc21pc3NpYmxlKAogICAgICAgICAgICAgICAgICAgICAgICBrZXk6IEtleSgnc2Vzc2lvbi0ke3MuZGVidXQubWlsbGlzZWNvbmRzU2luY2VFcG9jaH0nKSwKICAgICAgICAgICAgICAgICAgICAgICAgZGlyZWN0aW9uOiBEaXNtaXNzRGlyZWN0aW9uLmVuZFRvU3RhcnQsCiAgICAgICAgICAgICAgICAgICAgICAgIGJhY2tncm91bmQ6IENvbnRhaW5lcigKICAgICAgICAgICAgICAgICAgICAgICAgICBjb2xvcjogQ29sb3JzLnJlZCwKICAgICAgICAgICAgICAgICAgICAgICAgICBhbGlnbm1lbnQ6IEFsaWdubWVudC5jZW50ZXJSaWdodCwKICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkaW5nOiBjb25zdCBFZGdlSW5zZXRzLm9ubHkocmlnaHQ6IDIwKSwKICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlsZDogY29uc3QgSWNvbihJY29ucy5kZWxldGUsIGNvbG9yOiBDb2xvcnMud2hp" +
      "dGUpLAogICAgICAgICAgICAgICAgICAgICAgICApLAogICAgICAgICAgICAgICAgICAgICAgICBjb25maXJtRGlzbWlzczogKF8pIGFzeW5jIHsKICAgICAgICAgICAgICAgICAgICAgICAgICBhd2FpdCBfc3VwcHJpbWVyKHMpOwogICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICAgICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgICAgICAgICAgY2hpbGQ6IENhcmQoCiAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpbGQ6IEV4cGFuc2lvblRpbGUoCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZWFkaW5nOiBJY29uKEljb25zLmV2ZW50LCBjb2xvcjogY291bGV1cnMucHJpbWFyeSksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aXRsZTogVGV4dCgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX2Zvcm1hdERhdGUocy5kZWJ1dCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0eWxlOiBjb25zdCBUZXh0U3R5bGUoZm9udFdlaWdodDogRm9udFdlaWdodC5ib2xkKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJ0aXRsZTogVGV4dCgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJyR7cy5leGVyY2ljZXMubGVuZ3RofSBleGVyY2ljZShzKSDCtyAke3MudG90YWxTZXJpZXN9IHPDqXJpZShzKSDCtyAke19mb3JtYXREdXJlZShzLmR1cmVlVG90YWxlKCkpfScKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJyR7cy5lc3RUZXJtaW5lZSA/ICcnIDogJyDCtyBlbiBjb3Vycyd9JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlsZHJlbjogWwogICAgICAgICAg" +
      "ICAgICAgICAgICAgICAgICAgICBpZiAocy5leGVyY2ljZXMuaXNFbXB0eSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBQYWRkaW5nKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZGluZzogRWRnZUluc2V0cy5hbGwoMTYpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpbGQ6IFRleHQoJ0F1Y3VuIGV4ZXJjaWNlIGRhbnMgY2V0dGUgc8OpYW5jZS4nKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICApLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGZpbmFsIGV4IGluIHMuZXhlcmNpY2VzKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExpc3RUaWxlKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVuc2U6IHRydWUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZWFkaW5nOiBJY29uKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleC5mYWl0ID8gSWNvbnMuY2hlY2tfY2lyY2xlIDogSWNvbnMuZml0bmVzc19jZW50ZXIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemU6IDIwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb2xvcjogZXguZmFpdCA/IENvbG9ycy5ncmVlbiA6IGNvdWxldXJzLm91dGxpbmUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICApLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGl0bGU6IFRleHQoCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4Lm5vbSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU6IFRleHRTdHlsZSgKICAgICAgICAgICAgICAgICAgICAgICAg" +
      "ICAgICAgICAgICAgICBkZWNvcmF0aW9uOiBleC5mYWl0CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gVGV4dERlY29yYXRpb24ubGluZVRocm91Z2gKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBUZXh0RGVjb3JhdGlvbi5ub25lLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICApLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1YnRpdGxlOiBUZXh0KF9yZXN1bWVFeGVyY2ljZShleCkpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJhaWxpbmc6IFRleHQoJyR7ZXgudG90YWxTZXJpZXN9IHPDqXJpZShzKScpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgICAgICAgICAgICksCiAgICAgICAgICAgICAgICAgICAgICAgICksCiAgICAgICAgICAgICAgICAgICAgICApLAogICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgKSwKICAgICk7CiAgfQp9Cg==")), $UTF8)
  $okList += "recap_seances_page.dart"
  Write-Host "[OK] lib\pages\recap_seances_page.dart (cree)"
} catch {
  $koList += "recap_seances_page.dart"
  Write-Host ("[ECHEC] lib\pages\recap_seances_page.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 2/3 : main.dart ----------
try {
  $p = Join-Path $root "lib\main.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t ('import ''pages/session_active_page.dart'';' + $LF + 'import ''salle_page.dart'';') ('import ''pages/recap_seances_page.dart'';' + $LF + 'import ''pages/session_active_page.dart'';' + $LF + 'import ''salle_page.dart'';') 'main-import'
  $t = R1 $t ('            ),' + $LF + '          ),' + $LF + '          for (final s in sections)') (B64 ("ICAgICAgICAgICAgKSwKICAgICAgICAgICksCiAgICAgICAgICAvLyBCb3V0b24gUsOpY2FwIGRlIG1lcyBzw6lhbmNlcwogICAgICAgICAgUGFkZGluZygKICAgICAgICAgICAgcGFkZGluZzogY29uc3QgRWRnZUluc2V0cy5vbmx5KGJvdHRvbTogMTIpLAogICAgICAgICAgICBjaGlsZDogT3V0bGluZWRCdXR0b24uaWNvbigKICAgICAgICAgICAgICBpY29uOiBjb25zdCBJY29uKEljb25zLmhpc3RvcnksIHNpemU6IDI4KSwKICAgICAgICAgICAgICBsYWJlbDogY29uc3QgVGV4dCgnUsOpY2FwIGRlIG1lcyBzw6lhbmNlcycsIHN0eWxlOiBUZXh0U3R5bGUoZm9udFNpemU6IDE4KSksCiAgICAgICAgICAgICAgb25QcmVzc2VkOiAoKSA9PiBOYXZpZ2F0b3IucHVzaCgKICAgICAgICAgICAgICAgIGNvbnRleHQsCiAgICAgICAgICAgICAgICBNYXRlcmlhbFBhZ2VSb3V0ZShidWlsZGVyOiAoXykgPT4gY29uc3QgUmVjYXBTZWFuY2VzUGFnZSgpKSwKICAgICAgICAgICAgICApLAogICAgICAgICAgICApLAogICAgICAgICAgKSwKICAgICAgICAgIGZvciAoZmluYWwgcyBpbiBzZWN0aW9ucyk=")) 'main-bouton'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "main.dart"
  Write-Host "[OK] lib\main.dart"
} catch {
  $koList += "main.dart"
  Write-Host ("[ECHEC] lib\main.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- 3/3 : session_hive.dart ----------
try {
  $p = Join-Path $root "lib\data\session_hive.dart"
  $t = [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8)
  $crlf = $t.Contains($CR + $LF)
  $t = $t.Replace($CR, "")
  $t = R1 $t ('  /// Supprime une session.' + $LF + '  Future<void> supprimer(String key) async {' + $LF + '    await _box.delete(key);' + $LF + '  }') (B64 ("ICAvLy8gU3VwcHJpbWUgdW5lIHNlc3Npb24uCiAgRnV0dXJlPHZvaWQ+IHN1cHByaW1lcihTdHJpbmcga2V5KSBhc3luYyB7CiAgICBhd2FpdCBfYm94LmRlbGV0ZShrZXkpOwogIH0KCiAgLy8vIFN1cHByaW1lIHVuZSBzZXNzaW9uIHBhciBzb24gb2JqZXQgKG3Dqm1lIGNsw6kgcXVlIHNhdXZlZ2FyZGVyKS4KICBGdXR1cmU8dm9pZD4gc3VwcHJpbWVyU2Vzc2lvbihXb3Jrb3V0U2Vzc2lvbiBzZXNzaW9uKSBhc3luYyB7CiAgICBhd2FpdCBfYm94LmRlbGV0ZShfY2xlKHNlc3Npb24pKTsKICB9")) 'hive-methode'
  $out = $t
  if ($crlf) { $out = $out.Replace($LF, $CR + $LF) }
  [IO.File]::WriteAllText($p, $out, $UTF8)
  $okList += "session_hive.dart"
  Write-Host "[OK] lib\data\session_hive.dart"
} catch {
  $koList += "session_hive.dart"
  Write-Host ("[ECHEC] lib\data\session_hive.dart : " + $_.Exception.Message) -ForegroundColor Red
}

# ---------- Resume ----------
Write-Host ""
if ($koList.Count -eq 0) {
  Write-Host "=== TOUT EST OK (3 elements) ===" -ForegroundColor Green
  $t2 = [IO.File]::ReadAllText((Join-Path $root "lib\main.dart"), [Text.Encoding]::UTF8)
  $t3 = [IO.File]::ReadAllText((Join-Path $root "lib\data\session_hive.dart"), [Text.Encoding]::UTF8)
  Write-Host ("Controle : bouton accueil = " + [bool]($t2.Contains("recap_seances_page.dart")) + " ; methode supprimerSession = " + [bool]($t3.Contains("supprimerSession")))
  Write-Host "Etape suivante : lancer  flutter analyze"
} else {
  Write-Host "=== ECHEC PARTIEL : fichiers NON modifies : ===" -ForegroundColor Red
  foreach ($k in $koList) { Write-Host ("  - " + $k) }
  Write-Host "Les sauvegardes .bak sont a cote des fichiers. Envoie-moi ce message."
}
