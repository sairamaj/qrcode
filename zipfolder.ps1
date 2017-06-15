param(
    $SourcePath,
    $DestinationFile
)

 If(Test-path $DestinationFile) 
 {
    Write-Host "Remvoving $DestinationFile"
     Remove-item $DestinationFile
 }

Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($SourcePath, $DestinationFile)
