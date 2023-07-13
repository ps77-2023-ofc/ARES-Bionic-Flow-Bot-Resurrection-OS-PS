$descargarChrome = Read-Host "¿Deseas instalar Google Chrome? (S/N)"

if ($descargarChrome -eq "S") {
    Write-Host "¡Entendido! Descargando Google Chrome..."

    $url = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\chrome_installer.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de Google Chrome - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de Google Chrome..."

    # Ejecutar el instalador de Google Chrome de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/silent /install" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! Google Chrome ha sido instalado correctamente. En unos minutos debería abrirse, pero si no lo hace, ve al Escritorio o al menú Inicio para comprobar que ya fue instalado :)"
}
elseif ($descargarChrome -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargarChrome)
}
$returnValue = "return-to-menu"
