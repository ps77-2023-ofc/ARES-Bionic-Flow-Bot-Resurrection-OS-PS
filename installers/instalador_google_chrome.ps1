$descargarChrome = Read-Host "¿Deseas instalar Google Chrome? (S/N)"

if ($descargarChrome -eq "S") {
    Write-Host "¡Entendido! Descargando Google Chrome..."

    $url = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\chrome_installer.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 : Descarga de Google Chrome - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de Google Chrome..."

    # Ejecutar el instalador de Google Chrome de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/silent /install" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! Google Chrome ha sido instalado correctamente." 
    Write-Host "En unos minutos debería abrirse, pero si no lo hace, ve al Escritorio o al menú Inicio para comprobar que ya fue instalado :)"
    $returnValue = "return-to-menu"
}
elseif ($descargarChrome -eq "N"){
    Write-Host "De acuerdo. Regresando al menú principal..."
    Start-Sleep -Seconds 4
    Clear-Host
    $returnValue = "return-to-menu"
}
else {
    Write-Host "¡Ups, respuesta inválida! Inténtalo nuevamente."
    Start-Sleep -Seconds 3
    Clear-Host
    Write-Host ($descargarChrome)
}
$returnValue
