$installersFolderPath = ".\installers"
$checkersFolderPath = ".\checkers"
$miscTasksFolderPath = ".\miscellaneous"
Clear-Host
function MSPTInstalAprobPrevia {
    Write-Host "¡Entendido! Para ofrecerte la mejor experiencia, y prevenir problemas de rendimiento cuando uses Microsoft PowerToys,"
    Write-Host "realizaré una comprobación rápida de tu equipo, para asegurarme que cumples con los requisitos mínimos y/o recomendados para usarlo."
    Write-Host "Cuando la comprobación finalice, te diré los resultados. De acuerdo a lo que obtengas, te diré qué debes hacer a continuación."
}
MSPTInstalAprobPrevia
$MSPTCheckapproval = Read-Host "¿Aceptas que realice la comprobación y comenzar con la instalación de Microsoft PowerToys? (S/N)"
if ($MSPTCheckapproval -eq "S"){
    Write-Host "¡Muy bien! Comprobando tu equipo... (Espera a que la comprobación finalice)"
    & "$checkersFolderPath\comprobador_compatibilidad_ms_ptoys.ps1" -Wait
    if (($env:EstadoCompatMSPT -eq "mspt-es-compatible") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\positive_results\ms_ptoys_compat_passed.ps1" 
        if ($env:MSPTCompatAprobInstal -eq "S"){
            & "$installersFolderPath\instalador_ms_ptoys.ps1" -Wait
            if ($env:InstaladorMSPTEstado -eq "regresar-al-menu"){
                Clear-Host
                #Establecer la variable de entorno que indica la finalización del script misceláneo
                $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
            }
        }
        elseif ($env:MSPTCompatAprobInstal -eq "N"){
            Write-Host "De acuerdo. ¡Regresa cuando estés listo! Refrescando el menú..."
            Start-Sleep -Seconds 5
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
        else {
            Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
            Start-Sleep -Seconds 5
            Clear-Host
            Write-Host ($env:MSPTCompatAprobInstal)
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "es-Full-o-Full-Legends-pero-incompatible") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\mid_compat_results\ms_ptoys_isFullFLegends_not_compatible.ps1" -Wait
        if ($env:MSPTCompatFallidaFullFLegends -eq "basic-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-1") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_1.ps1"
        if ($env:MSPTCompatFallidaCaso1 -eq "case-1-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-2") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_2.ps1"
        if ($env:MSPTCompatFallidaCaso2 -eq "case-2-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-3") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_3.ps1"
        if ($env:MSPTCompatFallidaCaso3 -eq "case-3-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-4") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_4.ps1"
        if ($env:MSPTCompatFallidaCaso4 -eq "case-4-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-5") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_5.ps1"
        if ($env:MSPTCompatFallidaCaso5 -eq "case-5-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
    elseif (($env:EstadoCompatMSPT -eq "mspt-incompatible-caso-6") -and ($env:EstadoComprobaciónCompatibilidadMSPT -eq "prueba-terminada")){
        & "$miscTasksFolderPath\check_results\microsoft_ptoys\error_cases\ms_ptoys_error_case_6.ps1"
        if ($env:MSPTCompatFallidaCaso6 -eq "case-6-requirements-not-met"){
            Clear-Host
            #Establecer la variable de entorno que indica la finalización del script misceláneo
            $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
        }
    }
}
elseif ($MSPTCheckapproval -eq "N"){
    Write-Host "Para instalar Microsoft PowerToys, y asegurarme de que tendrás la mejor experiencia usándolo, necesito tu aprobación para realizar la comprobación."
    Write-Host "Debido a que la has negado, no podré ayudarte a instalar Microsoft PowerToys. ¡Si cambias de opinión, ejecuta nuevamente la opción 11!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    Clear-Host
    #Establecer la variable de entorno que indica la finalización del script misceláneo
    $env:ScriptMiscOpción11 = "script-miscelaneo-terminado"
}
else {
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Start-Sleep -Seconds 3
    Clear-Host
    Write-Host ($MSPTInstallPrevApproval)
}