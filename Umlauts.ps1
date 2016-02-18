# Find folder on NAS
$drive = '\\freenas\restore\Bilder'


if (Test-Path -path $drive)
{
  # To make the handling a little bit more consistent, create a PSDrive.
  New-PSDrive -PSProvider FileSystem -Name 'FreeNASBilder' -Root $drive
  Set-Location FreeNASBilder:\
  Get-ChildItem -Recurse -Force | Where-Object { $_.Name -like '*ä*' } | Rename-Item -NewName { $_.Name -replace 'ä','ae' }
  Get-ChildItem -Recurse -Force | Where-Object { $_.Name -like '*ö*' } | Rename-Item -NewName { $_.Name -replace 'ö','oe' }
  Get-ChildItem -Recurse -Force | Where-Object { $_.Name -like '*ü*' } | Rename-Item -NewName { $_.Name -replace 'ü','ue' }
  Get-ChildItem -Recurse -Force | Where-Object { $_.Name -like '*ß*' } | Rename-Item -NewName { $_.Name -replace 'ß','ss'}
  
    Remove-PSDrive -Name 'FreeNASBilder'
}