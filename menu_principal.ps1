$optionsFolderPath = ".\options"
# Imprimir menú principal del bot
$mainmenu = {
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                   |"
    Write-Host "|                                          MENÚ PRINCIPAL                                           |"
    Write-Host "|                                                                                                   |"
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "1. Descarga / Instalación de programas"
    Write-Host "2. Configurar aspecto / personalización del sistema"
    Write-Host "3. Optimizar el sistema"
    Write-Host "4. Caja de Herramientas de Resurrection OS"
    Write-Host "5. Activar Protección del sistema / Crear punto de restauración (¡Recomendado!)"
    Write-Host "6. Salir"
    Write-Host "-----------------------------------------------------------------------------------------------------"
}
Write-Host ($mainmenu)
$option = Read-Host "Ingresa el número de la opción que desees usar:"
switch ($option) {
    "1" {
        Clear-Host
        & "$optionsFolderPath\opcion_1_menu_principal.ps1"
        if ($returnValue -eq "return-to-menu"){
            Clear-Host
            Write-Host ($mainmenu)
        }
    }
    "2" {
        Clear-Host
        & "$optionsFolderPath\opcion_2_menu_principal.ps1"
        if ($returnValue -eq "return-to-menu"){
            Clear-Host
            Write-Host ($mainmenu)
        }
    }
    "3" {
        Clear-Host
        & "$optionsFolderPath\opcion_3_menu_principal.ps1"
        if ($returnValue -eq "return-to-menu"){
            Clear-Host
            Write-Host ($mainmenu)
        }
    }
    "4" {
        Clear-Host
        & "$optionsFolderPath\caja_herramientas_resurrection_os.ps1"
        if ($returnValue -eq "return-to-menu"){
            Clear-Host
            Write-Host ($mainmenu)
        }
    }
    "5" {
        Clear-Host
        & "$optionsFolderPath\opcion_5_menu_principal.ps1"
        if ($returnValue -eq "return-to-menu"){
            Clear-Host
            Write-Host ($mainmenu)
        }
    }
    "6" {
        Write-Host "¡Nos vemos! Recuerda, si me necesitas de nuevo, me puedes encontrar en el Menú Extendido de Resurrection OS, haciendo clic en la opción 'Iniciar ARES Bionic-Flow Bot'. ¡Nos vemos luego!" -ForegroundColor Yellow
        Start-Sleep -Seconds 4
        exit
    }
    default {
        Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
        Start-Sleep -Seconds 2
        Clear-Host
        Write-Host ($mainmenu)
    }
}