$descargar7z = Read-Host "¿Deseas instalar 7-Zip? (S/N)"

if ($descargar7z -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de 7-Zip..."

    $url = "https://7-zip.org/a/7z2301-x64.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\7z2301.x64.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de 7-Zip - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de 7-Zip..."

    # Ejecutar el instalador de 7-Zip de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/S /D="C:\Program Files\7-Zip"" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! 7-Zip ha sido instalado correctamente." 
    Write-Host "Chequea en el Menú Inicio y comprueba que ya fue instalado :)"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
elseif ($descargar7z -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargar7z)
}

$returnValue = "return-to-menu"