# claude-local.ps1 : lance Claude Code sur le modèle local LM Studio
$env:ANTHROPIC_BASE_URL = "http://127.0.0.1:1234"
$env:ANTHROPIC_AUTH_TOKEN = "lmstudio"
$env:CLAUDE_CODE_ATTRIBUTION_HEADER = "0"
$env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1"

# Récupération de la liste des modèles du serveur LM Studio
try {
    $models = (Invoke-RestMethod http://127.0.0.1:1234/v1/models -TimeoutSec 5).data
} catch {
    Write-Host "Serveur LM Studio injoignable sur le port 1234. Démarre-le (onglet Developer) et charge le modèle." -ForegroundColor Red
    return
}

# On exclut les modèles d'embedding, puis on préfère Qwen3.6 s'il est présent
$candidats = $models | Where-Object { $_.id -notmatch "embed" }
$choix = $candidats | Where-Object { $_.id -match "qwen3\.6" } | Select-Object -First 1
if (-not $choix) { $choix = $candidats | Select-Object -First 1 }

if (-not $choix) {
    Write-Host "Aucun modèle de chat trouvé. Charge le modèle dans LM Studio." -ForegroundColor Red
    return
}

$m = $choix.id
Write-Host "Modèle utilisé : $m" -ForegroundColor Green

$env:ANTHROPIC_MODEL = $m
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = $m
$env:ANTHROPIC_DEFAULT_SONNET_MODEL = $m
$env:ANTHROPIC_DEFAULT_OPUS_MODEL = $m
$env:API_TIMEOUT_MS = "1800000"
$env:CLAUDE_STREAM_IDLE_TIMEOUT_MS = "1800000"
$env:CLAUDE_BYTE_STREAM_IDLE_TIMEOUT_MS = "1800000"
claude --model $m