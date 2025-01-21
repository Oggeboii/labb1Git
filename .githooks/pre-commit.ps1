# Pre-commit hook för filstorlekskontroll
 $maxSize = 1MB
 $exitCode = 0
 # Hämta ändrade filer
 $files = git diff --cached --name-only
 foreach ($file in $files) {
 if (Test-Path $file -PathType Leaf) {
 $size = (Get-Item $file).Length
 if ($size -gt $maxSize) {
 Write-Host "Error: $file är större än 1MB ($([math]::Round($size/1MB, 2)) MB)" -ForegroundColor Red
 $exitCode = 1
 }
 }
 }
 if ($exitCode -eq 0) {
 Write-Host "Alla filer är mindre än 1MB" -ForegroundColor Green
 }
 exit $exitCode