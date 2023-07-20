$optionsFolderPath = ".\options"
$miscTasksFolderPath = ".\miscellaneous"
$exitMenu = $false
# Imprimir menú principal del bot
function Show-Main-Menu {
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

while (-not $exitMenu){
    Show-Main-Menu
    $option = Read-Host "Ingresa el número de la opción que desees usar"    
    switch ($option) {
        "1" {
            Clear-Host
            & "$optionsFolderPath\opcion_1_menu_principal.ps1" -Wait
            if ($env:Opcion1RegresoMPrincipal -eq "regresar-al-menu") {
                Clear-Host
                continue  # Volver a mostrar el menú principal
            }
        }
        "2" {
            Clear-Host
            & "$optionsFolderPath\opcion_2_menu_principal.ps1" -Wait
            if ($env:Opcion2RegresoMPrincipal -eq "regresar-al-menu") {
                Clear-Host
                continue  # Volver a mostrar el menú principal
            }
        }
        "3" {
            Clear-Host
            & "$optionsFolderPath\opcion_3_menu_principal.ps1" -Wait
            if ($env:Opcion3RegresoMPrincipal -eq "regresar-al-menu") {
                Clear-Host
                continue  # Volver a mostrar el menú principal
            }
        }
        "4" {
            Clear-Host
            & "$optionsFolderPath\caja_herramientas_resurrection_os.ps1" -Wait
            if ($env:OpcionCajaHerramientasRegresoMPrincipal -eq "regresar-al-menu") {
                Clear-Host
                continue  # Volver a mostrar el menú principal
            }
        }
        "5" {
            Clear-Host
            & "$optionsFolderPath\opcion_5_menu_principal.ps1" -Wait
            if ($env:Opcion5RegresoMPrincipal -eq "regresar-al-menu") {
                Clear-Host
                continue  # Volver a mostrar el menú principal
            }
        }
        "6" {
            &"$miscTasksFolderPath\exiter\salida.ps1"
            if ($env:DisparadorSalidaScript -eq "opcion-6-salida-script"){
                Write-Host "¡Nos vemos! Recuerda, si me necesitas de nuevo, me puedes encontrar en el Menú Extendido de Resurrection OS, haciendo clic en la opción 'Iniciar ARES Bionic-Flow Bot'. ¡Nos vemos luego!" -ForegroundColor Yellow
                Start-Sleep -Seconds 5
                $exitMenu = $true # Establecer la bandera de salida del menú
            }
        }
        default {
            Write-Host "¡Opcion invalida! Por favor, selecciona una opción valida." -ForegroundColor Red
            Start-Sleep -Seconds 2
            Clear-Host
            continue
        }
    }
    
}
