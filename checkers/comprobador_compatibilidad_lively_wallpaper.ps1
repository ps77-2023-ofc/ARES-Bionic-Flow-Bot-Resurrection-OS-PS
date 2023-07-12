# Obtener información de OEM del dispositivo
$oemInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation"
$model = $oemInfo.Model

# Obtener información del sistema
$systemInfo = Get-WmiObject -Class Win32_ComputerSystem
$operatingSystem = $systemInfo.Caption
$processor = $systemInfo.Caption
$memorySize = $systemInfo.TotalPhysicalMemory / 1GB

# Comprobar compatibilidad
if ($model -match "Full|Full Legends") {
    if ($operatingSystem -match "Windows 10 1903|Windows 10 1909|Windows 10 2004|Windows 10 20H2|Windows 10 21H1|Windows 10 21H2|Windows 11") {
        if ($processor -match "Intel Core i3" -and $memorySize -ge 2) {
            $livelyCompatStatus = "system-is-compatible"
        } else {
            $livelyCompatStatus = "isFull_FullLegends_but_not_compatible"
        }
    } else {
        $livelyCompatStatus = "isFull_FullLegends_but_not_compatible"
    }
} else {
    if ($operatingSystem -match "Windows 10 1903|Windows 10 1909|Windows 10 2004|Windows 10 20H2|Windows 10 21H1|Windows 10 21H2|Windows 11" -and $processor -notmatch "Intel Core i3" -or $memorySize -lt 2) {
        $livelyCompatStatus = "error-case-1-ocurred"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processor -notmatch "Intel Core i3" -or $memorySize -lt 2) {
        $livelyCompatStatus = "error-case-2-ocurred"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processor -match "Intel Core i3" -or $memorySize -ge 2) {
        $livelyCompatStatus = "error-case-3-ocurred"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and ($processor -notmatch "Intel Core i3" -or $memorySize -lt 2)) {
        $livelyCompatStatus = "error-case-4-ocurred"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and $processor -match "Intel Core i3" -and $memorySize -ge 2) {
        $livelyCompatStatus = "error-case-5-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -notmatch "Intel Core i3" -and $memorySize -ge 2) {
        $livelyCompatStatus = "error-case-6-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -match "Intel Core i3" -and $memorySize -lt 2) {
        $livelyCompatStatus = "error-case-7-ocurred"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -notmatch "Intel Core i3" -and $memorySize -lt 2) {
        $livelyCompatStatus = "error-case-8-ocurred"
    }
}

$lwCheckerScriptExecutionStatus = "check-finished"
