$descargarMozillaFFox = Read-Host "¿Deseas instalar Mozilla Firefox? (S/N)"

if ($descargarMozillaFFox -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de Mozilla Firefox..."

    $url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/115.0.2/win32/es-ES/Firefox%20Installer.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\Firefox Installer.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 : Descarga de Mozilla Firefox - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de Mozilla Firefox..."

    # Ejecutar el instalador de Google Chrome de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/S" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! Mozilla Firefox ha sido instalado correctamente." 
    Write-Host "Si todo ha salido bien, verás a Firefox fijado en la barra de tareas. Así sabrás que ya está instalado :)"
    $returnValue = "return-to-menu"
}
elseif ($descargarMozillaFFox -eq "N"){
    Write-Host "De acuerdo. Regresando al menú principal..."
    Start-Sleep -Seconds 4
    Clear-Host
    $returnValue = "return-to-menu"
}
else {
    Write-Host "¡Ups, respuesta inválida! Inténtalo nuevamente."
    Start-Sleep -Seconds 3
    Clear-Host
    Write-Host ($descargarMozillaFFox)
}
$returnValue