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
        $MSPTCompatStatus = "system-is-compatible"
    } else {
        $MSPTCompatStatus = "isFull_FullLegends_but_not_compatible"
    }
} else {
    # Comprobar requisitos mínimos de Microsoft PowerToys
    $resurrectionOSEditions = @("Go", "Go Ultra", "Full", "Full Legends")
    $supportedWindows11Versions = @("21H2", "22H2")
    $supportedWindows10Version = "2004"

    # Verificar los casos
    if (!($resurrectionOSEditions -contains $model) -and !($osVersion -like "10*" -or $osVersion -eq "11*") -and !($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $MSPTCompatStatus = "error-case-1-ocurred"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Full*" -or $model -like "*Full Legends*") -and !($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $MSPTCompatStatus = "error-case-4-ocurred"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Full*" -or $model -like "*Full Legends*") -and !($osVersion -like "10*" -or $osVersion -eq "11*")) {
        $MSPTCompatStatus = "error-case-3-ocurred"
    } elseif (($resurrectionOSEditions -contains $model) -and !($supportedWindows11Versions -contains $osVersion) -and ($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $MSPTCompatStatus = "error-case-2-ocurred"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Go*" -or $model -like "*Go Ultra*") -and ($osVersion -like "10*" -or $osVersion -eq "11*") -and !($supportedWindows11Versions -contains $osVersion)) {
        $MSPTCompatStatus = "error-case-5-ocurred"
    } elseif (($resurrectionOSEditions -contains $model) -and ($model -like "*Go*" -or $model -like "*Go Ultra*") -and !($osVersion -like "10*" -or $osVersion -eq "11*") -and ($architecture -eq "x64" -or $architecture -eq "ARM64")) {
        $MSPTCompatStatus = "error-case-6-ocurred"
    }

}

$MSPTCheckerScriptExecutionStatus = "check-finished"
