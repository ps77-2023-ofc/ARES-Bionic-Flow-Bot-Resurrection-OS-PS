function Assert-Error-Case-7 {
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 7."
    Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #7 de incompatibilidad."
    Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
    Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
    Start-Sleep -Seconds 5
    Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
    Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
    Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
}
Assert-Error-Case-7
$case7DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
$env:RainmeterIncompatibleCaso7AdvertAceptada = $case7DisclaimerAccepted