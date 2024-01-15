$slicers = @{"1"='ELEGOO Cura'; "2"='OrcaSlicer'; "3"='PrusaSlicer'; "4"='Ultimaker Cura'}
$slicerBackupFolder = 'C:\Users\samue\Documents\SlicerBackups'
$repoPath = 'C:\Users\samue\Documents\SlicerConfigs'

$slicerConfigPaths = @{
    "1"='C:\Users\samue\AppData\Roaming\cura\4.8';
    "2"='C:\Users\samue\AppData\Roaming\OrcaSlicer';
    "3"='C:\Users\samue\AppData\Roaming\PrusaSlicer';
    "4"='C:\Users\samue\AppData\Roaming\cura\5.6';
}

Do { $selection = Read-Host -Prompt "`nPlease select what slicer you would like to move files for.`n`n1. ELEGOO Cura`n2. OrcaSlicer`n3. PrusaSlicer`n4. Ultimaker Cura`n`nSelect" } 
While ($selection -notmatch "1|2|3|4") 

$selectedSlicer = $slicers[$selection]
$selctedSlicerConfigPath = $slicerConfigPaths[$selection]

Write-Host "$selectedSlicer selected."

if (Test-Path -Path $slicerBackupFolder) {
}
else {
    New-Item -Path $slicerBackupFolder -ItemType "directory"
}

if (Test-Path -Path $slicerBackupFolder\$selectedSlicer) {
}
else {
    New-Item -Path $slicerBackupFolder\$selectedSlicer -ItemType "directory"
}

Write-Host "Making backup of $selectedSlicer configuration folder"
Copy-Item -Path "$selctedSlicerConfigPath\*" -Destination "$slicerBackupFolder\$selectedSlicer\backup" -Recurse -Force


Write-Host "Moving $selectedSlicer from repository to configuration folder"
Copy-Item -Path "$repoPath\$selectedSlicer\*" -Destination "$selctedSlicerConfigPath" -Recurse -Force

