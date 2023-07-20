# Buscar si Chocolatey está instalado
$chocoInstalled = Get-Command choco -ErrorAction SilentlyContinue

if ($chocoInstalled) {
    $env:EstadoChocolatey = "choco-ya-esta-instalado"
} else {
    $env:EstadoChocolatey = "choco-no-esta-instalado"
}
