$ErrorActionPreference = 'Stop'
$url = 'https://gmsh.info/bin/Windows/gmsh-4.8.4-Windows32.zip'
$url64 = 'https://gmsh.info/bin/Windows/gmsh-4.8.4-Windows64.zip'
$installDir = "C:\gmsh"
$version = "4.8.4"

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
  checksum       = '73832DA8175B2540BC47700314D16F02D9A43A426C63ACB14E95F57789CF93AA'
  checksumType   = 'sha256'
  checksum64     = '056C70B454E51F9B42564E92F2031192B06BF206B1F0101485758FB5F00E910B'
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

