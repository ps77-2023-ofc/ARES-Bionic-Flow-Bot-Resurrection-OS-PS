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
            $env:EstadoCompatLively = "lively-es-compatible"
        } else {
            $env:EstadoCompatLively = "es-Full-o-Full-Legends-pero-incompatible"
        }
    } else {
        $env:EstadoCompatLively = "es-Full-o-Full-Legends-pero-incompatible"
    }
} else {
    if ($operatingSystem -match "Windows 10 1903|Windows 10 1909|Windows 10 2004|Windows 10 20H2|Windows 10 21H1|Windows 10 21H2|Windows 11" -and $processor -notmatch "Intel Core i3" -or $memorySize -lt 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-1"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processor -notmatch "Intel Core i3" -or $memorySize -lt 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-2"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processor -match "Intel Core i3" -or $memorySize -ge 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-3"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and ($processor -notmatch "Intel Core i3" -or $memorySize -lt 2)) {
        $env:EstadoCompatLively = "lively-incompatible-caso-4"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and $processor -match "Intel Core i3" -and $memorySize -ge 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-5"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -notmatch "Intel Core i3" -and $memorySize -ge 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-6"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -match "Intel Core i3" -and $memorySize -lt 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-7"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processor -notmatch "Intel Core i3" -and $memorySize -lt 2) {
        $env:EstadoCompatLively = "lively-incompatible-caso-8"
    }
}
$env:EstadoComprobaciónCompatibilidadLW = "prueba-terminada"
