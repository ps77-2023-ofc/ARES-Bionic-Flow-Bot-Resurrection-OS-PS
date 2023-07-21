function Assert-Check-FullFLegendsNotCompatible {
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: ESTÁS EN FULL/FULL LEGENDS, PERO NO CUMPLES LOS REQ. MÍNIMOS."
    Write-Host "Hmm... parece que sí tienes Resurrection OS Full o Full Legends instalado, pero alguno de los requisitos"
    Write-Host "mínimos o recomendados no los cumples. Verifica en la Base de Conocimientos oficial de Resurrection OS"
    Write-Host "y chequea qué requisito podrías no estar cumpliendo."
    Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-8-lively-wallpaper#requisitos"
    Start-Sleep -Seconds 5
    Write-Host "Independiente del requisito, aún puedo ayudarte a instalar Lively Wallpaper, pero será bajo tu propio riesgo."
    Write-Host "Si decides instalar Lively Wallpaper de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
    Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
}
Assert-Check-FullFLegendsNotCompatible
$LWFullFLegendsbutNotCompatDisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
$env:EsFullFullLegendsIncompatibleAdvert = $LWFullFLegendsbutNotCompatDisclaimerAccepted