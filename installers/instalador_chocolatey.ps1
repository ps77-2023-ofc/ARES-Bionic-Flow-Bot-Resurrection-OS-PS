$chocoInstallCommand = {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

try {
    & $chocoInstallCommand
    $env:EstadoInstalacionChoco = "choco-successfully-installed"
} catch {
    $env:InstalacionLivelyLogsError = $_.Exception.Message
    $env:EstadoInstalacionChoco = "choco-installation-error-ocurred"
}

