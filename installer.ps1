# Force TLS 1.2 to prevent GitHub connection drops
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = "Stop"

Write-Host "[*] Checking for ImageMagick installation..."
if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Host "[+] ImageMagick not found. Installing via Winget..."
    winget install ImageMagick.ImageMagick
} else {
    Write-Host "[+] ImageMagick is already installed."
}

# Setup installation directory in user profile
$InstallDir = "$HOME\.smart_collage"
if (-not (Test-Path $InstallDir)) {
    New-Item -Path $InstallDir -ItemType Directory | Out-Null
}

Set-Location $InstallDir

Write-Host "[*] Downloading pre-compiled Windows binary..."
$DownloadUrl = "https://github.com/TTT2978/photo-collage/raw/refs/heads/main/smart_collage_windows.zip"
Invoke-WebRequest -Uri $DownloadUrl -OutFile "package.zip"

Write-Host "[*] Extracting package..."
Expand-Archive -Path "package.zip" -DestinationPath "." -Force
Remove-Item "package.zip"

Write-Host "[*] Configuring System Environment Path..."
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -notlike "*$InstallDir*") {
    [Environment]::SetEnvironmentVariable("Path", $UserPath + ";" + $InstallDir, "User")
    Write-Host "[+] Added $InstallDir to User PATH."
} else {
    Write-Host "[!] Path already configured."
}

Write-Host "[+] Installation completed successfully!"
Write-Host "[*] IMPORTANT: Please CLOSE this window, open a NEW PowerShell window, and type 'img' to verify."
