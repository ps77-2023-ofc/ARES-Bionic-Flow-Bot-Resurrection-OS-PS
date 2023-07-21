function Assert-FullFLegends-Failed {
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: ESTÁS EN FULL/FULL LEGENDS, PERO NO CUMPLES LOS REQ. MÍNIMOS."
    Write-Host "Hmm... parece que sí tienes Resurrection OS Full o Full Legends instalado, pero alguno de los requisitos"
    Write-Host "mínimos o recomendados no los cumples. Verifica en la Base de Conocimientos oficial de Resurrection OS"
    Write-Host "y chequea qué requisito podrías no estar cumpliendo."
    Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-11-microsoft-powertoys#requisitos"
    Start-Sleep -Seconds 5
    Write-Host "A pesar de esto, no puedo ofrecerte la instalación de todas maneras, ya que si llegase a intentarlo, de todas maneras"
    Write-Host "el instalador de Microsoft PowerToys arrojaría error, y no me permitiría instalarlo."
    Write-Host "Por favor, ¡intenta cumplir los requisitos que podrías no estar cumpliendo e inténtalo nuevamente!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
}
Assert-FullFLegends-Failed
$compatCheckFailedFullFLegends = "basic-requirements-not-met"
$env:MSPTCompatFallidaFullFLegends = $compatCheckFailedFullFLegends
