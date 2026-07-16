# TurboVisionPB 0.16.8
# (C) CheshirCa 2026

$SdkRoot = Split-Path -Parent $PSScriptRoot
foreach ($Architecture in 'x64','x86') {
  $Dll = Join-Path $SdkRoot "Bin\$Architecture\TurboVisionPB.dll"
  if (Test-Path -LiteralPath $Dll) {
    $Info = (Get-Item -LiteralPath $Dll).VersionInfo
    Write-Output "$Architecture FileVersion=$($Info.FileVersion) ProductVersion=$($Info.ProductVersion)"
  }
}
