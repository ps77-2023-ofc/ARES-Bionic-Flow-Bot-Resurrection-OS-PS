$containersFolderPath = ".\containers"
$installersFolderPath = ".\installers"
& "$containersFolderPath\buscador_chocolatey.ps1"
$confirmationChocolateyInstall = {
    Write-Host "Ahora bien, para que pueda descargar e instalar Lively Wallpaper, deberé primero instalar Chocolatey en tu PC." 
    Write-Host "Cuando la instalación finalice, podrás desinstalar Chocolatey si lo deseas yendo a Configuración > Aplicaciones > Aplicaciones instaladas." 
}
Write-Host ($confirmationChocolateyInstall)
$chocoInstallConsent = Read-Host "Dicho esto, ¿deseas continuar de todos modos? (S/N)"
if ($chocoInstallConsent -eq "S" -and $chocoInstallStatus -eq "choco-is-not-installed"){
    Write-Host "¡Ok! FASE 1 COMENZADA: Comenzando tarea 1 de 2: Descarga e instalación de Chocolatey..."
    & "$installersFolderPath\instalador_chocolatey.ps1"
    if ($chocoInstallProcessExit -eq "choco-successfully-installed"){
        Write-Host "Tarea 1 de 2 - Descarga e instalación de Chocolatey - ¡Completada!"
        $chocoInstalledLWConfirmationInstall = Read-Host "¡Fase 1 completada! Procedamos ahora a instalar Lively Wallpaper. ¿Listo para continuar? (S/N)"
        if ($chocoInstalledLWConfirmationInstall -eq "S"){
            Write-Host "¡Entendido! FASE 2 COMENZADA: Comenzando tarea 2 de 2: Descarga e instalación de Lively Wallpaper..."
            & "$installersFolderPath\sub-instalador_lively_wallpaper_chocolatey.ps1"
            if ($livelyInstallProcessExit -eq "lively-successfully-installed"){
            Write-Host "¡Finalizado! Lively Wallpaper ha sido instalado correctamente." 
            Write-Host "Recuerda: si lo deseas, puedes desinstalar Chocolatey, yendo a Configuración > Aplicaciones > Aplicaciones instaladas."
            Write-Host "¡Disfruta tus wallpapers animados con Lively Wallpaper! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 8
            $returnValue
            exit
            }
            elseif ($livelyInstallProcessExit -eq "lively-installation-failed"){
                Write-Host "¡Oh no! Ocurrió un error mientras instalaba Lively Wallpaper."
                Write-Host "Esto fue lo que pasó:" & Write-Host ($livelyInstallProcessErrorLogs)
                Write-Host "Por favor, si te es posible, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
                Write-Host "Presiona cualquier tecla para refrescar el menú..."
                $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
                $returnValue
            }
        }
        elseif ($chocoInstalledLWConfirmationInstall -eq "N"){
            Write-Host "¡De acuerdo! Cuando estés listo para comenzar a instalar Lively, ¡entra nuevamente a la opción 8!"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 4
            $returnValue
            exit
        }
    }
    elseif ($chocoInstallProcessExit -eq "choco-installation-error-ocurred"){
        Write-Host "¡Oh no! Ocurrió un error mientras descargaba e instalaba Chocolatey."
        Write-Host "Esto fue lo que pasó:" & Write-Host ($chocoInstallProcessErrorLogs)
        Write-Host "Por favor, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
        Write-Host "Presiona cualquier tecla para refrescar el menú..."
        $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
        $returnValue
    }
elseif ($chocoInstallConsent -eq "S" -and $chocoInstallStatus -eq "choco-is-already-installed"){
    Write-Host "¡Vaya! Parece que fuiste un paso adelante de mí, y ya tienes instalado Chocolatey en tu PC. ¡Movimiento ingenioso!"
    $chocoAlrInstalledConsent = Read-Host "¿Te parece si vamos directo a la instalación de Lively Wallpaper? (S/N)"
    if ($chocoAlrInstalledConsent -eq "S"){
        Write-Host "¡Entendido! FASE 2 COMENZADA: Comenzando tarea 2 de 2: Descarga e instalación de Lively Wallpaper..."
        & "$installersFolderPath\sub-instalador_lively_wallpaper_chocolatey.ps1"
        if ($livelyInstallProcessExit -eq "lively-successfully-installed"){
            Write-Host "¡Finalizado! Lively Wallpaper ha sido instalado correctamente." 
            Write-Host "Recuerda: si lo deseas, puedes desinstalar Chocolatey, yendo a Configuración > Aplicaciones > Aplicaciones instaladas."
            Write-Host "¡Disfruta tus wallpapers animados con Lively Wallpaper! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 8
            $returnValue
            exit
        }
        elseif ($livelyInstallProcessExit -eq "lively-installation-failed"){
            Write-Host "¡Oh no! Ocurrió un error mientras instalaba Lively Wallpaper."
            Write-Host "Esto fue lo que pasó:" & Write-Host ($livelyInstallProcessErrorLogs)
            Write-Host "Por favor, si te es posible, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
            Write-Host "Presiona cualquier tecla para refrescar el menú..."
            $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
            $returnValue
            exit
        }
    }
    elseif ($chocoInstalledLWConfirmationInstall -eq "N"){
        Write-Host "¡De acuerdo! Cuando estés listo para comenzar a instalar Lively, ¡entra nuevamente a la opción 8!"
        Write-Host "Refrescando el menú..."
        Start-Sleep -Seconds 4
        $returnValue
        exit
    }
    else{
        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
        Write-Host($chocoAlrInstalledConsent)
    }
}
}
$returnValue = "return-to-menu"