$descargarMozillaFFox = Read-Host "¿Deseas instalar Mozilla Firefox? (S/N)"

if ($descargarMozillaFFox -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de Mozilla Firefox..."

    $url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/115.0.2/win32/es-ES/Firefox%20Installer.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\Firefox Installer.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga -Quiet

    Write-Host "Tarea 1 de 2 - Descarga de Mozilla Firefox - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de Mozilla Firefox..."

    # Ejecutar el instalador de Mozilla Firefox de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/S" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! Mozilla Firefox ha sido instalado correctamente." 
    Write-Host "Firefox se ha autofijado en la barra de tareas, lo que indica que ya fue instalado :)"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    #Establecer variable de entorno para indicar el regreso, una vez terminada la instalación.
    $env:InstaladorMZFFoxEstado = "regresar-al-menu"
}
elseif ($descargarMozillaFFox -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    #Establecer variable de entorno para indicar el regreso, una vez terminada la instalación.
    $env:InstaladorMZFFoxEstado = "regresar-al-menu"
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargarMozillaFFox)
}

