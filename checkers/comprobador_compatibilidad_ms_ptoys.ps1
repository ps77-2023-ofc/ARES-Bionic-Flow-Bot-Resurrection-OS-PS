# Obtener información del Registro
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation"
$model = (Get-ItemProperty -Path $registryPath).Model

# Obtener información del sistema
$osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
$buildNumber = (Get-WmiObject -Class Win32_OperatingSystem).BuildNumber
$architecture = (Get-WmiObject -Class Win32_ComputerSystem).SystemType

# Comprobar la información del modelo
if ($model -like "*Full*" -or $model -like "*Full Legends*") {
    # Comprobar requisitos mínimos de Resurrection OS
    if (($model -like "*Full*" -or $model -like "*Full Legends*") -and ($osVersion -like "10*" -or $osVersion -eq "11*") -and ($buildNumber -ge 19041 -or $osVersion -eq "11*") -and ($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $env:EstadoCompatMSPT = "mspt-es-compatible"
    } else {
        $env:EstadoCompatMSPT = "es-Full-o-Full-Legends-pero-incompatible"
    }
} else {
    # Comprobar requisitos mínimos de Microsoft PowerToys
    $resurrectionOSEditions = @("Go", "Go Ultra", "Full", "Full Legends")
    $supportedWindows11Versions = @("21H2", "22H2")
    $supportedWindows10Version = "2004"

    # Verificar los casos
    if (!($resurrectionOSEditions -contains $model) -and !($osVersion -like "10*" -or $osVersion -eq "11*") -and !($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-1"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Full*" -or $model -like "*Full Legends*") -and !($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-4"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Full*" -or $model -like "*Full Legends*") -and !($osVersion -like "10*" -or $osVersion -eq "11*")) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-3"
    } elseif (($resurrectionOSEditions -contains $model) -and !($supportedWindows11Versions -contains $osVersion) -and ($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-2"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Go*" -or $model -like "*Go Ultra*") -and ($osVersion -like "10*" -or $osVersion -eq "11*") -and !($supportedWindows11Versions -contains $osVersion)) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-5"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Go*" -or $model -like "*Go Ultra*") -and !($osVersion -like "10*" -or $osVersion -eq "11*") -and ($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $env:EstadoCompatMSPT = "mspt-incompatible-caso-6"
    }

}
$env:EstadoComprobaciónCompatibilidadMSPT = "prueba-terminada"
