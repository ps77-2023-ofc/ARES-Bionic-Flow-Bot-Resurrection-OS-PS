function Assert-Requirements-Error-Case-6 {
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 6."
    Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #6 de incompatibilidad."
    Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
    Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-11-microsoft-powertoys#casos-de-incompatibilidad"
    Start-Sleep -Seconds 5
    Write-Host "A pesar de esto, no puedo ofrecerte la instalación de todas maneras, ya que si llegase a intentarlo, de todas maneras"
    Write-Host "el instalador de Microsoft PowerToys arrojaría error, y no me permitiría instalarlo."
    Write-Host "Por favor, ¡intenta cumplir los requisitos que podrías no estar cumpliendo e inténtalo nuevamente!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
}
Assert-Requirements-Error-Case-6
$compatCheckFailedCase6 = "case-6-requirements-not-met"
$env:MSPTCompatFallidaCaso6 = $compatCheckFailedCase6