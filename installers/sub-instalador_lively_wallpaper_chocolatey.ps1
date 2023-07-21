try {
    $livelyInstallProcess = Start-Process "choco" -ArgumentList "install lively -y" -NoNewWindow -Wait -PassThru
    if ($livelyInstallProcess.ExitCode -eq 0) {
        $env:ResultadoInstalacionLively = "lively-instalado-correctamente"
    } else {
        $env:InstalacionLivelyLogsError = $livelyInstallProcess.StandardError.ReadToEnd()
        $env:ResultadoInstalacionLively = "instalacion-lively-fallida"
    }
} catch {
    $env:InstalacionLivelyLogsError = $_.Exception.Message
    $env:ResultadoInstalacionLively = "instalacion-lively-fallida"
}

