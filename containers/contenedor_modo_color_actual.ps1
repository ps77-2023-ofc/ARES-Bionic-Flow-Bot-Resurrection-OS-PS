$currentWinVersInstalled = (Get-WmiObject -Class Win32_OperatingSystem).Caption
$currentWindowsOSBuild = (Get-WmiObject -Class Win32_OperatingSystem).BuildNumber
# Script contenedor - Extracción de información y determinación de modos
function Get-Current-Windows-Version-Installed {
    if ($currentWinVersInstalled -like "*Windows 10*" -and $currentWindowsOSBuild -notlike "*1507*") {
        $env:SistemaActualCMS = "Windows 10 (compilación 1607 o posterior)"
    }
    elseif ($currentWinVersInstalled -like "*Windows 11*" -and $currentWindowsOSBuild -like "*21H2*") {
        $env:SistemaActualCMS = "Windows 11 (compilación 21H2)"
    }
    elseif ($currentWinVersInstalled -like "*Windows 11*" -and $currentWindowsOSBuild -like "*22H2*") {
        $env:SistemaActualCMS = "Windows 11 (compilación 22H2)"
    }
}
Get-Current-Windows-Version-Installed
# Lógica para determinar el modo del sistema y las aplicaciones.
function Get-W101607Plus-Actual-SCMs {
    $appsUseLightTheme = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize").AppsUseLightTheme
    if ($appsUseLightTheme -eq 0) {
        $env:EstadoModoColorWin101607Plus = "actual-cms-is-dark-mode-enabled"
    } 
    elseif ($appsUseLightTheme -eq 1) {
        $env:EstadoModoColorWin101607Plus = "actual-cms-is-light-mode-enabled"
    }    
}
Get-W101607Plus-Actual-SCMs
function Get-W1121H2-Actual-SCM {
    $appsUseLightTheme = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize").AppsUseLightTheme
    if ($appsUseLightTheme -eq 0) {
        $env:EstadoModoColorWin1121H2 = "actual-cms-is-dark-mode-enabled"
    } 
    elseif ($appsUseLightTheme -eq 1) {
        $env:EstadoModoColorWin1121H2 = "actual-cms-is-light-mode-enabled"
    }
}
Get-W1121H2-Actual-SCM
function Get-W1122H2-Actual-SCM {
    $appsUseLightTheme = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize").AppsUseLightTheme
    $systemUseLightTheme = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize").SystemUseLightTheme
    if ($appsUseLightTheme -eq 0 -and $systemUseLightTheme -eq 0) {
        $env:EstadoModoColorSistema = "dark-mode"
        $env:EstadoModoColorAplicaciones = "dark-mode"
    } 
    elseif ($appsUseLightTheme -eq 1 -or $systemUseLightTheme -eq 1) {
        $env:EstadoModoColorSistema = "light-mode"
        $env:EstadoModoColorAplicaciones = "light-mode"
    }
    elseif ($appsUseLightTheme -eq 0 -and $systemUseLightTheme -eq 1){
        $env:EstadoModoColorSistema = "dark-mode"
        $env:EstadoModoColorAplicaciones = "light-mode"
    }
    elseif ($appsUseLightTheme -eq 1 -and $systemUseLightTheme -eq 0){
        $env:EstadoModoColorSistema = "light-mode"
        $env:EstadoModoColorAplicaciones = "dark-mode"
    }
}
Get-W1122H2-Actual-SCM
