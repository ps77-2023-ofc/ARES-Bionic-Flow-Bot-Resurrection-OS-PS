$installersFolderPath = ".\installers"
$optionsMiscTasksFolderPath = ".\options\checkers_miscs"
function Show-Option-1 {
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                   |"
    Write-Host "|                         DESCARGA E INSTALACIÓN DE SOFTWARE O PROGRAMAS                            |"
    Write-Host "|                                                                                                   |"
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "1. Descargar / instalar Google Chrome"
    Write-Host "2. Descargar / instalar Microsoft Edge"
    Write-Host "3. Descargar / instalar Mozilla Firefox"
    Write-Host "4. Descargar / instalar Navegador LibreWolf"
    Write-Host "5. Descargar / instalar VLC Media Player"
    Write-Host "6. Descargar / instalar K-Lite Codec Pack"
    Write-Host "7. Descargar / instalar Rainmeter"
    Write-Host "8. Descargar / instalar Lively Wallpaper"
    Write-Host "9. Descargar / instalar 7-Zip"
    Write-Host "10. Descargar / instalar IDM (Internet Download Manager)"
    Write-Host "11. Descargar / instalar Microsoft PowerToys"
    Write-Host "12. Regresar al menú principal"
    Write-Host "-----------------------------------------------------------------------------------------------------"
}

Show-Option-1
$option = Read-Host "¿Qué deseas hacer?"
switch ($option) {
    "1" {
        Clear-Host
        & "$installersFolderPath\instalador_google_chrome.ps1" -Wait
        if ($env:InstaladorGChromeEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "2" {
        Clear-Host
        & "$installersFolderPath\instalador_ms_edge.ps1" -Wait
        if ($env:InstaladorMSEdgeEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "3" {
        Clear-Host
        & "$installersFolderPath\instalador_mozilla_firefox.ps1" -Wait
        if ($env:InstaladorMZFFoxEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "4" {
        Clear-Host
        & "$installersFolderPath\instalador_librewolf.ps1" -Wait
        if ($env:InstaladorLibWolfEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "5" {
        Clear-Host
        & "$installersFolderPath\instalador_vlc_media_player.ps1" -Wait
        if ($env:InstaladorVLCMPEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "6" {
        Clear-Host
        & "$installersFolderPath\instalador_klite_codec_pack.ps1" -Wait
        if ($env:InstaladorKLCPEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "7" {
        Clear-Host
        & "$optionsMiscTasksFolderPath\misc_tasks_option_7.ps1" -Wait
        if ($env:ScriptMiscOpción7 -eq "script-miscelaneo-terminado"){
            Clear-Host
            Show-Option-1
        }
    }
    "8" {
        Clear-Host
        & "$optionsMiscTasksFolderPath\misc_tasks_option_8.ps1" -Wait
        if ($env:ScriptMiscOpción8 = "script-miscelaneo-terminado"){
            Clear-Host
            Show-Option-1
        }
    }
    "9" {
        Clear-Host
        & "$installersFolderPath\instalador_7zip.ps1" -Wait
        if ($env:Instalador7ZEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "10" {
        Clear-Host
        & "$installersFolderPath\instalador_idm.ps1" -Wait
        if ($env:InstaladorIDMEstado -eq "regresar-al-menu"){
            Clear-Host
            Show-Option-1
        }
    }
    "11" {
        Clear-Host
        & "$optionsMiscTasksFolderPath\misc_tasks_option_11.ps1" -Wait
        if ($env:ScriptMiscOpción11 = "script-miscelaneo-terminado"){
            Clear-Host
            Show-Option-1
        }
    }
    "12"{
        Clear-Host
        Write-Host "De acuerdo. Regresando al menú principal..." -ForegroundColor Yellow
        Start-Sleep -Seconds 4
        Clear-Host
        # Establecer variable de entorno que indica el regreso al menú principal
        $env:Opcion1RegresoMPrincipal = "regresar-al-menu-principal"
    }
    default {
        Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
        Start-Sleep -Seconds 5
        Clear-Host
        Show-Option-1
    }
}




