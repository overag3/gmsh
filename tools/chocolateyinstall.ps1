$ErrorActionPreference = 'Stop'
$url64 = 'https://gmsh.info/bin/Windows/gmsh-4.9.0-Windows64.zip'
$installDir = "C:\gmsh"
$version = "4.9.0"
$dirToExtract = "gmsh-$version-Windows64"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $installDir
  url64bit       = $url64
  checksum64     = 'DDB15F241979B1F05A102489567E1912D0248D68075396682A2ABFB4D5122170'
  checksumType64 = 'sha256'
}

# Unzip file to installDir
Install-ChocolateyZipPackage @packageArgs

# Location of executable
$exeLocation = "$installDir\$dirToExtract\gmsh.exe"

# Create Start Menu shorcuts
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Gmsh\Gmsh.lnk" -targetPath $exeLocation -WorkingDirectory "$installDir\$dirToExtract" -IconLocation $exeLocation
