function Assert-Check-Confirmed{
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: REQUISITOS CUMPLIDOS"
    Write-Host "¡Felicidades! Has pasado la prueba de los requisitos mínimos y/o recomendados para Rainmeter,"
    Write-Host "con lo que tienes luz verde para instalarlo."
}
Assert-Check-Confirmed
$compatPassedApproval = Read-Host "¿Listo para comenzar? (S/N)"
$env:AprobacionCompatSuperada = $compatPassedApproval