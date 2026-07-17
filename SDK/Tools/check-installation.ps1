# TurboVisionPB 0.16.9
# (C) CheshirCa 2026

$ErrorActionPreference = 'Stop'
$SdkRoot = Split-Path -Parent $PSScriptRoot
$Required = @('Include\TurboVisionPB.pbi')
foreach ($RelativePath in $Required) {
  if (-not (Test-Path -LiteralPath (Join-Path $SdkRoot $RelativePath))) {
    throw "Missing SDK file: $RelativePath"
  }
}
$Architectures = @('x64','x86' | Where-Object {
  (Test-Path -LiteralPath (Join-Path $SdkRoot "Lib\$_\TurboVisionPB.lib")) -and
  (Test-Path -LiteralPath (Join-Path $SdkRoot "Bin\$_\TurboVisionPB.dll"))
})
if (-not $Architectures) { throw 'No complete x64 or x86 binary set was found.' }
Write-Output "TurboVisionPB SDK layout is complete: $($Architectures -join ', ')."
