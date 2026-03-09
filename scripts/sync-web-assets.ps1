param(
  [string]$SourceDist,
  [string]$TargetWeb
)

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if (-not $SourceDist) {
  $SourceDist = Join-Path $projectRoot '..\creator-adda\creator-adda\dist'
}

if (-not $TargetWeb) {
  $TargetWeb = Join-Path $projectRoot 'web'
}

$resolvedSource = Resolve-Path $SourceDist -ErrorAction SilentlyContinue
if (-not $resolvedSource) {
  Write-Error "Source dist folder not found. Pass -SourceDist explicitly if your website project is in another location."
  exit 1
}
$SourceDist = $resolvedSource.Path

if (Test-Path $TargetWeb) {
  Remove-Item -Recurse -Force $TargetWeb
}

New-Item -ItemType Directory -Path $TargetWeb | Out-Null
Copy-Item -Path (Join-Path $SourceDist '*') -Destination $TargetWeb -Recurse -Force

Write-Host "Synced web assets from $SourceDist to $TargetWeb"
