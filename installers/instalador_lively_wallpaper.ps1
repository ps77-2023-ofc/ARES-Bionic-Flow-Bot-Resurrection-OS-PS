$containersFolderPath = ".\containers"
$installersFolderPath = ".\installers"
& "$containersFolderPath\buscador_chocolatey.ps1"
$confirmationChocolateyInstall = {
    Write-Host "Ahora bien, para que pueda descargar e instalar Lively Wallpaper, deberé primero instalar Chocolatey en tu PC." 
    Write-Host "Cuando la instalación finalice, podrás desinstalar Chocolatey si lo deseas yendo a Configuración > Aplicaciones > Aplicaciones instaladas." 
}
Write-Host ($confirmationChocolateyInstall)
$chocoInstallConsent = Read-Host "Dicho esto, ¿deseas continuar de todos modos? (S/N)"
if (($chocoInstallConsent -eq "S") -and ($env:EstadoChocolatey -eq "choco--no-esta-instalado")){
    Write-Host "¡Ok! FASE 1 COMENZADA: Comenzando tarea 1 de 2: Descarga e instalación de Chocolatey..."
    & "$installersFolderPath\instalador_chocolatey.ps1" -Wait
    if ($env:EstadoInstalacionChoco -eq "choco-instalado-correctamente"){
        Write-Host "Tarea 1 de 2 - Descarga e instalación de Chocolatey - ¡Completada!"
        $chocoInstalledLWConfirmationInstall = Read-Host "¡Fase 1 completada! Procedamos ahora a instalar Lively Wallpaper. ¿Listo para continuar? (S/N)"
        if ($chocoInstalledLWConfirmationInstall -eq "S"){
            Write-Host "¡Entendido! FASE 2 COMENZADA: Comenzando tarea 2 de 2: Descarga e instalación de Lively Wallpaper..."
            & "$installersFolderPath\sub-instalador_lively_wallpaper_chocolatey.ps1" -Wait
            if ($env:ResultadoInstalacionLively -eq "lively-instalado-correctamente"){
            Write-Host "¡Finalizado! Lively Wallpaper ha sido instalado correctamente." 
            Write-Host "Recuerda: si lo deseas, puedes desinstalar Chocolatey, yendo a Configuración > Aplicaciones > Aplicaciones instaladas."
            Write-Host "¡Disfruta tus wallpapers animados con Lively Wallpaper! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 8
            $env:InstaladorLWEstado = "regresar-al-menu"
            }
            elseif ($env:ResultadoInstalacionLively -eq "instalacion-lively-fallida"){
                Write-Host "¡Oh no! Ocurrió un error mientras instalaba Lively Wallpaper."
                Write-Host "Esto fue lo que pasó:" & Write-Host ($env:InstalacionLivelyLogsError)
                Write-Host "Por favor, si te es posible, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
                Write-Host "Presiona cualquier tecla para refrescar el menú..."
                $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
                $env:InstaladorLWEstado = "regresar-al-menu"
            }
        }
        elseif ($chocoInstalledLWConfirmationInstall -eq "N"){
            Write-Host "¡De acuerdo! Cuando estés listo para comenzar a instalar Lively, ¡entra nuevamente a la opción 8!"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 4
            $env:InstaladorLWEstado = "regresar-al-menu"
        }
    }
    elseif ($env:EstadoInstalacionChoco -eq "instalacion-lively-fallida"){
        Write-Host "¡Oh no! Ocurrió un error mientras descargaba e instalaba Chocolatey."
        Write-Host "Esto fue lo que pasó:" & Write-Host ($env:InstalacionLivelyLogsError)
        Write-Host "Por favor, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
        Write-Host "Presiona cualquier tecla para refrescar el menú..."
        $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
        $env:InstaladorLWEstado = "regresar-al-menu"
    }
elseif (($chocoInstallConsent -eq "S") -and ($env:EstadoChocolatey -eq "choco-ya-esta-instalado")){
    Write-Host "¡Vaya! Parece que fuiste un paso adelante de mí, y ya tienes instalado Chocolatey en tu PC. ¡Movimiento ingenioso!"
    $chocoAlrInstalledConsent = Read-Host "¿Te parece si vamos directo a la instalación de Lively Wallpaper? (S/N)"
    if ($chocoAlrInstalledConsent -eq "S"){
        Write-Host "¡Entendido! FASE 2 COMENZADA: Comenzando tarea 2 de 2: Descarga e instalación de Lively Wallpaper..."
        & "$installersFolderPath\sub-instalador_lively_wallpaper_chocolatey.ps1"
        if ($env:ResultadoInstalacionLively -eq "lively-instalado-correctamente"){
            Write-Host "¡Finalizado! Lively Wallpaper ha sido instalado correctamente." 
            Write-Host "Recuerda: si lo deseas, puedes desinstalar Chocolatey, yendo a Configuración > Aplicaciones > Aplicaciones instaladas."
            Write-Host "¡Disfruta tus wallpapers animados con Lively Wallpaper! :)"
            Write-Host "Refrescando el menú..."
            Start-Sleep -Seconds 8
            $env:InstaladorLWEstado = "regresar-al-menu"
        }
        elseif ($env:ResultadoInstalacionLively -eq "instalacion-lively-fallida"){
            Write-Host "¡Oh no! Ocurrió un error mientras instalaba Lively Wallpaper."
            Write-Host "Esto fue lo que pasó:" & Write-Host ($env:InstalacionLivelyLogsError)
            Write-Host "Por favor, si te es posible, ¡soluciona los errores que ocurrieron e intenta nuevamente la instalación para poderte ayudar instalando Lively Wallpaper!"
            Write-Host "Presiona cualquier tecla para refrescar el menú..."
            $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
            $env:InstaladorLWEstado = "regresar-al-menu"
        }
    }
    elseif ($chocoInstalledLWConfirmationInstall -eq "N"){
        Write-Host "¡De acuerdo! Cuando estés listo para comenzar a instalar Lively, ¡entra nuevamente a la opción 8!"
        Write-Host "Refrescando el menú..."
        Start-Sleep -Seconds 4
        $env:InstaladorLWEstado = "regresar-al-menu"
    }
    else{
        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
        Write-Host($chocoAlrInstalledConsent)
    }
}
}
