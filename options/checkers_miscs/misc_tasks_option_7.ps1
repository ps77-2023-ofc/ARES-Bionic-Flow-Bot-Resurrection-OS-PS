$installersFolderPath = ".\installers"
$checkersFolderPath = ".\checkers"
$miscTasksFolderPath = ".\miscellaneous"
Clear-Host
function ImprimirAprobPreviaRMeter {
    Write-Host "¡Entendido! Para ofrecerte la mejor experiencia, y prevenir problemas de rendimiento cuando uses Rainmeter,"
    Write-Host "realizaré una comprobación rápida de tu equipo, para asegurarme que cumples con los requisitos mínimos y/o recomendados para usarlo."
    Write-Host "Cuando la comprobación finalice, te diré los resultados. De acuerdo a lo que obtengas, te diré qué debes hacer a continuación."
}
ImprimirAprobPreviaRMeter
$approval = Read-Host "¿Aceptas que realice la comprobación y comenzar con la instalación de Rainmeter? (S/N)"
if ($approval -eq "S"){
    Write-Host "¡Muy bien! Comprobando tu equipo... (Espera a que la comprobación finalice)"
    & "$checkersFolderPath\comprobador_compatibilidad_rainmeter.ps1" -Wait
    if (($env:EstadoCompatibilidadRMeter -eq "es-Full-o-Full-Legends-pero-incompatible") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
    & "$miscTasksFolderPath\check_results\rainmeter\positive_results\rainmeter_compat_passed.ps1"
        if ($env:AprobacionCompatSuperada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:AprobacionCompatSuperada -eq "N"){
            Write-Host "De acuerdo. ¡Regresa cuando estés listo! Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:AprobacionCompatSuperada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "es-Full-o-Full-Legends-pero-incompatible") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\mid_compatible_results\rainmeter_isFullFLegends_not_compatible.ps1"
        if ($env:EsFulloFullLegendsPeroIncompatibleAdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:EsFulloFullLegendsPeroIncompatibleAdvertAceptada -eq "N"){
            Write-Host "'Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)'"
            Write-Host "'Refrescando el menú...'"
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:EsFulloFullLegendsPeroIncompatibleAdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-1") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_1.ps1"
        if ($env:RainmeterIncompatibleCaso1AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso1AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso1AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-2") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        &  "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_2.ps1"
        if ($env:RainmeterIncompatibleCaso2AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso2AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso2AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-3") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_3.ps1"
        if ($env:RainmeterIncompatibleCaso3AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso3AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso3AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-4") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_4.ps1"
        if ($env:RainmeterIncompatibleCaso4AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso4AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso4AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-5") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_5.ps1"
        if ($env:RainmeterIncompatibleCaso5AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso5AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso5AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-6") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_6.ps1"
        if ($env:RainmeterIncompatibleCaso6AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
                if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso6AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso6AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-7") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_7.ps1"
        if ($env:RainmeterIncompatibleCaso7AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso7AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso7AdvertAceptada)
        }
    }
    elseif (($env:EstadoCompatibilidadRMeter -eq "rainmeter-incompatible-caso-8") -and ($env:EstadoComprobaciónCompatibilidad -eq "prueba-terminada")){
        & "$miscTasksFolderPath\rainmeter\incompat_error_cases\rainmeter_error_case_8.ps1"
        if ($env:RainmeterIncompatibleCaso8AdvertAceptada -eq "S"){
            & "$installersFolderPath\instalador_rainmeter.ps1" -Wait
            if ($env:InstaladorRMeterEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:RainmeterIncompatibleCaso8AdvertAceptada -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:RainmeterIncompatibleCaso8AdvertAceptada)
        }
    }
}
elseif ($approval -eq "N"){
    Write-Host "Para instalar Rainmeter, y asegurarme de que tendrás la mejor experiencia usándolo, necesito tu aprobación para realizar la comprobación."
    Write-Host "Debido a que la has negado, no podré ayudarte a instalar Rainmeter. ¡Si cambias de opinión, ejecuta nuevamente la opción 5!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    Clear-Host
    #Establecer la variable de entorno que indica la finalización del script misceláneo
    $env:ScriptMiscOpción7 = "script-miscelaneo-terminado"
}
else {
Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
Start-Sleep -Seconds 3
Clear-Host
ImprimirAprobPreviaRMeter
}
