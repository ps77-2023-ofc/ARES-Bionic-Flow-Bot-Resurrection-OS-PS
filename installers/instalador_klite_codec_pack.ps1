$descargarKLCP = Read-Host "¿Deseas instalar K-Lite Codec Pack? (S/N)"

if ($descargarKLCP -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de K-Lite Codec Pack..."

    $url = "https://files3.codecguide.com/K-Lite_Codec_Pack_1768_Mega.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\K-Lite_Codec_Pack_1768_Mega.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de K-Lite Codec Pack - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de K-Lite Codec Pack..."

    # Ejecutar el instalador de K-Lite Codec Pack de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/silent /install" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! K-Lite Codec Pack ha sido instalado correctamente." 
    Write-Host "Ve al menú Inicio o abre la bandeja de íconos ocultos para comprobar que ya fue instalado :)"
    Write-Host "¡Disfruta una calidad mejorada en tus archivos multimedia!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
elseif ($descargarKLCP -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargarKLCP)
}
$returnValue = "return-to-menu"
