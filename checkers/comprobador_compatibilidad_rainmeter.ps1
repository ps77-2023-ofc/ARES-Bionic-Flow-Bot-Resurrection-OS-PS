# Obtener información de OEM del dispositivo
$oemInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation"
$model = $oemInfo.Model

# Obtener información del sistema
$systemInfo = Get-WmiObject -Class Win32_ComputerSystem
$operatingSystem = $systemInfo.Caption
$processorSpeed = $systemInfo.MaxClockSpeed
$memorySize = $systemInfo.TotalPhysicalMemory / 1GB

# Comprobar compatibilidad
if ($model -match "Full|Full Legends") {
    if ($operatingSystem -match "Windows 7|Windows 8|Windows 10|Windows 11") {
        if ($processorSpeed -ge 2000 -and $memorySize -ge 2) {
            $compatibilityStatus = "system-is-compatible"
        } else {
            $compatibilityStatus = "isFull_FullLegends_but_not_compatible"
        }
    } else {
        $compatibilityStatus = "isFull_FullLegends_but_not_compatible"
    }
} else {
    if ($operatingSystem -match "Windows 7|Windows 8|Windows 10|Windows 11" -and $processorSpeed -ge 2000 -and $memorySize -ge 2) {
        $compatibilityStatus = "error-case-1-ocurred"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processorSpeed -lt 2000 -or $memorySize -lt 2) {
        $compatibilityStatus = "error-case-2-ocurred"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processorSpeed -ge 2000 -or $memorySize -ge 2) {
        $compatibilityStatus = "error-case-3-ocurred"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and ($processorSpeed -lt 2000 -or $memorySize -lt 2)) {
        $compatibilityStatus = "error-case-4-ocurred"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and $processorSpeed -ge 2000 -and $memorySize -ge 2) {
        $compatibilityStatus = "error-case-5-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -lt 2000 -and $memorySize -ge 2) {
        $compatibilityStatus = "error-case-6-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -ge 2000 -and $memorySize -lt 2) {
        $compatibilityStatus = "error-case-7-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -lt 2000 -and $memorySize -lt 2) {
        $compatibilityStatus = "error-case-8-ocurred"
    }
}
$compatibilityStatus
$scriptExecutionStatus = "check-finished"
