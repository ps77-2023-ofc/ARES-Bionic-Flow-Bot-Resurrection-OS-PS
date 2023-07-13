# Buscar si Chocolatey está instalado
$chocoInstalled = Get-Command choco -ErrorAction SilentlyContinue

if ($chocoInstalled) {
    $chocoInstallStatus = "choco-is-already-installed"
} else {
    $chocoInstallStatus = "choco-is-not-installed"
}

$chocoInstallStatus
