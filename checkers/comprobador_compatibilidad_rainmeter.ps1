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
            # Establecer variable de entorno que retorna al script opciones opcion 1 el estado positivo de la prueba de compatibilidad
            $env:EstadoCompatibilidadRMeter = "rainmeter-compatible" 
        } 
        else {
            # Establecer variable de entorno que retorna al script opciones opcion 1 el estado precautorio de la prueba de compatibilidad
            $env:EstadoCompatibilidadRMeter = "es-Full-o-Full-Legends-pero-incompatible"
        }
    } 
    else {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado precautorio de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "es-Full-o-Full-Legends-pero-incompatible"
    }
} else {
    if ($operatingSystem -match "Windows 7|Windows 8|Windows 10|Windows 11" -and $processorSpeed -ge 2000 -and $memorySize -ge 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 1 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-1"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processorSpeed -lt 2000 -or $memorySize -lt 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 2 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-2"
    } elseif ($operatingSystem -notmatch "Resurrection OS" -or $processorSpeed -ge 2000 -or $memorySize -ge 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 3 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-3"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and ($processorSpeed -lt 2000 -or $memorySize -lt 2)) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 4 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-4"
    } elseif ($operatingSystem -match "Go|Go Ultra" -and $processorSpeed -ge 2000 -and $memorySize -ge 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 5 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-5"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -lt 2000 -and $memorySize -ge 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 6 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-6"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -ge 2000 -and $memorySize -lt 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 7 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-7"
    } elseif ($operatingSystem -match "Full|Full Legends" -and $processorSpeed -lt 2000 -and $memorySize -lt 2) {
        # Establecer variable de entorno que retorna al script opciones opcion 1 el estado de error relativo al caso 8 de la prueba de compatibilidad
        $env:EstadoCompatibilidadRMeter = "rainmeter-incompatible-caso-8"
    }
}
# Establecer variable de entorno que indica que la comprobación ha finalizado
$env:EstadoComprobaciónCompatibilidad = "prueba-terminada"
