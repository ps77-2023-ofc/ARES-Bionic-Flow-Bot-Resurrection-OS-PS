try {
    $livelyInstallProcessExit = ""
    $livelyInstallProcess = Start-Process "choco" -ArgumentList "install lively -y" -NoNewWindow -Wait -PassThru
    if ($livelyInstallProcess.ExitCode -eq 0) {
        $livelyInstallProcessExit = "lively-successfully-installed"
    } else {
        $livelyInstallProcessErrorLogs = $livelyInstallProcess.StandardError.ReadToEnd()
        $livelyInstallProcessExit = "lively-installation-failed"
    }
} catch {
    $livelyInstallProcessErrorLogs = $_.Exception.Message
    $livelyInstallProcessExit = "lively-installation-failed"
}

$livelyInstallProcessExit
