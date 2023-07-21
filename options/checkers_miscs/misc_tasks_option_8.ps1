$installersFolderPath = ".\installers"
$checkersFolderPath = ".\checkers"
$miscTasksFolderPath = ".\miscellaneous"
Clear-Host
function LWAprobPrevia {
    Write-Host "¡Entendido! Para ofrecerte la mejor experiencia, y prevenir problemas de rendimiento cuando uses Lively Wallpaper,"
    Write-Host "realizaré una comprobación rápida de tu equipo, para asegurarme que cumples con los requisitos mínimos y/o recomendados para usarlo."
    Write-Host "Cuando la comprobación finalice, te diré los resultados. De acuerdo a lo que obtengas, te diré qué debes hacer a continuación."
}
LWAprobPrevia
$lwCheckapproval = Read-Host "¿Aceptas que realice la comprobación y comenzar con la instalación de Rainmeter? (S/N)"
if ($lwCheckapproval -eq "S"){
    Write-Host "¡Muy bien! Comprobando tu equipo... (Espera a que la comprobación finalice)"
    & "$checkersFolderPath\comprobador_compatibilidad_lively_wallpaper.ps1" -Wait
    if (($env:EstadoCompatibilidadLW -eq "lively-es-compatible") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\positive_results\lively_wallpaper_compat_passed.ps1"
        if ($env:LivelyCompatAprobInstal -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyCompatAprobInstal -eq "N"){
            Write-Host "De acuerdo. ¡Regresa cuando estés listo! Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyCompatAprobInstal)
        }
    }
    elseif (($env:EstadoCompatLively -eq "es-Full-o-Full-Legends-pero-incompatible") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\mid_compatible_results\lively_wallpaper_isFullFLegends_not_compatible.ps1"
        if ($env:EsFullFullLegendsIncompatibleAdvert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:EsFullFullLegendsIncompatibleAdvert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:EsFullFullLegendsIncompatibleAdvert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-1") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_1.ps1"
        if ($env:LivelyIncompatCaso1Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso1Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso1Advert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-2") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_2.ps1"
        if ($env:LivelyIncompatCaso2Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1"-Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso2Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso2Advert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-3") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_3.ps1"
        if ($env:LivelyIncompatCaso3Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso3Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso3Advert)
            }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-4") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_4.ps1"
        if ($env:LivelyIncompatCaso4Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso4Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso4Advert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-5") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_5.ps1"
        if ($env:LivelyIncompatCaso5Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso5Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso5Advert)
        }
    }       
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-6") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_6.ps1"
        if ($env:LivelyIncompatCaso6Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso6Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso6Advert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-7") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_7.ps1"
        if ($env:LivelyIncompatCaso7Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso7Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso7Advert)
        }
    }
    elseif (($env:EstadoCompatLively -eq "lively-incompatible-caso-8") -and ($env:EstadoComprobaciónCompatibilidadLW -eq "prueba-terminada")){
        & "$miscTasksFolderPath\lively_wallpaper\incompat_error_cases\lively_error_case_8.ps1"
        if ($env:LivelyIncompatCaso8Advert -eq "S"){
            & "$installersFolderPath\instalador_lively_wallpaper.ps1" -Wait
            if ($env:InstaladorLWEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:LivelyIncompatCaso8Advert -eq "N"){
            Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:LivelyIncompatCaso8Advert)
        }
    }
}
elseif ($lwCheckapproval -eq "N"){
    Write-Host "Para instalar Lively Wallpaper, y asegurarme de que tendrás la mejor experiencia usándolo, necesito tu aprobación para realizar la comprobación."
    Write-Host "Debido a que la has negado, no podré ayudarte a instalar Lively Wallpaper. ¡Si cambias de opinión, ejecuta nuevamente la opción 8!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    Clear-Host
    #Establecer la variable de entorno que indica la finalización del script misceláneo
    $env:ScriptMiscOpción8 = "script-miscelaneo-terminado"
}
else {
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Start-Sleep -Seconds 3
    Clear-Host
    Write-Host ($lwCheckapproval)
}