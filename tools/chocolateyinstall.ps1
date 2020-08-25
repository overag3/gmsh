$ErrorActionPreference = 'Stop'
$url = 'https://gmsh.info/bin/Windows/gmsh-4.6.0-Windows32.zip'
$url64 = 'https://gmsh.info/bin/Windows/gmsh-4.6.0-Windows64.zip'
$installDir = "C:\gmsh"
$version = "4.6.0"

if (Get-OSArchitectureWidth -Compare 32) {
  $dirToExtract = "gmsh-$version-Windows32"
} else {
  $dirToExtract = "gmsh-$version-Windows64"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $installDir
  url            = $url
  url64bit       = $url64
  checksum       = '10EB4CE611D081FAB390A943D3252160D6DE321D4FE882C790005C0339EE1431'
  checksumType   = 'sha256'
  checksum64     = 'ED87AC6428ADEA6084F49629FEB194DAB11042455C69CEC9660D3E602A363B34'
  checksumType64 = 'sha256'
}

# Unzip file to installDir
Install-ChocolateyZipPackage @packageArgs

# Location of executable
$exeLocation = "$installDir\$dirToExtract\gmsh.exe"

# Create Start Menu shorcuts
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Gmsh\Gmsh.lnk" -targetPath $exeLocation -WorkingDirectory "$installDir\$dirToExtract" -IconLocation $exeLocation

# Create Desktop shortcuts
Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\Gmsh.lnk" -targetPath $exeLocation -WorkingDirectory "$installDir\$dirToExtract" -IconLocation $exeLocation

