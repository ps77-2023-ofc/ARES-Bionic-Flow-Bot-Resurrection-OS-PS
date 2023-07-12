$descargarKLCP = Read-Host "¿Deseas instalar K-Lite Codec Pack? (S/N)"

if ($descargarKLCP -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de K-Lite Codec Pack..."

    $url = "https://files3.codecguide.com/K-Lite_Codec_Pack_1768_Mega.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\K-Lite_Codec_Pack_1768_Mega.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 : Descarga de K-Lite Codec Pack - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de K-Lite Codec Pack..."

    # Ejecutar el instalador de Google Chrome de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/verysilent" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! K-Lite Codec Pack ha sido instalado correctamente." 
    Write-Host "Ve al menú Inicio para comprobar que ya fue instalado :)"
    Write-Host "¡Disfruta de tus archivos multimedia con mejor calidad!"
    $returnValue = "return-to-menu"
}
elseif ($descargarKLCP -eq "N"){
    Write-Host "De acuerdo. Regresando al menú principal..."
    Start-Sleep -Seconds 4
    Clear-Host
    $returnValue = "return-to-menu"
}
else {
    Write-Host "¡Ups, respuesta inválida! Inténtalo nuevamente."
    Start-Sleep -Seconds 3
    Clear-Host
    Write-Host ($descargarKLCP)
}
$returnValue