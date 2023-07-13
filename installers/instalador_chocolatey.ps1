$chocoInstallCommand = {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

try {
    & $chocoInstallCommand
    $chocoInstallProcessExit = "choco-successfully-installed"
} catch {
    $chocoInstallProcessErrorLogs = $_.Exception.Message
    $chocoInstallProcessExit = "choco-installation-error-ocurred"
}

$chocoInstallProcessExit
