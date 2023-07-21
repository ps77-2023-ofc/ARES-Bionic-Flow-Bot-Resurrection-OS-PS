function Get-Check-Approved {
    Write-Host "¡Terminé! Aquí tengo tus resultados:"
    Write-Host "Estado de la compatibilidad: REQUISITOS CUMPLIDOS"
    Write-Host "¡Felicidades! Has pasado la prueba de los requisitos mínimos y/o recomendados para Microsoft PowerToys,"
    Write-Host "con lo que tienes luz verde para instalarlo."
}
Get-Check-Approved
$MSPTCompatPassedApproval = Read-Host "¿Listo para comenzar? (S/N)"
$env:MSPTCompatAprobInstal = $MSPTCompatPassedApproval