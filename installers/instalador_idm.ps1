$descargarIDM = Read-Host "¿Deseas instalar IDM (Internet Download Manager)? (S/N)"

if ($descargarIDM -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de IDM (Internet Download Manager)..."

    $url = "https://download.internetdownloadmanager.com/idman641build15.exe?v=lt&filename=idman641build15.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\idman641build15.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de IDM (Internet Download Manager) - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de IDM (Internet Download Manager)..."

    # Ejecutar el instalador de IDM (Internet Download Manager) de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/skipdlgs" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! IDM (Internet Download Manager) ha sido instalado correctamente." 
    Write-Host "Chequea en el Escritorio y en el menú Inicio para que compruebes que ya está instalado :)"
    Write-Host "En un momento, en tu navegador debería de aparecer un aviso de que la extensión "IDM Integration Module" está solicitando activación."
    Write-Host "Dale en Permitir y si se te abre una pestaña indicando "'IDM Integration Module for {tu navegador} has been installed'" sin ningún error,"
    Write-Host "¡has terminado de configurar IDM!"
    Start-Sleep -Seconds 7
    Write-Host "Recuerda: IDM NO es gratuito; debes adquirir licencia para usarlo sin límites."
    Write-Host "Si no puedes comprar la licencia, puedes usarlo sin límites durante 15 días."
    Write-Host "Si se te termina el período de prueba, desinstala IDM y descarga la versión crackeada, usando el enlace de aquí abajo:"
    Write-Host "https://www.descarga.xyz/internet-download-manager-full-crack/"
    Write-Host "Asegúrate de seguir las instrucciones para crackear IDM y usarlo sin límites."
    Write-Host "¡Disfruta una mejor velocidad para tus descargas!"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 9
    Clear-Host
    $env:InstaladorIDMEstado = "regresar-al-menu"
}
elseif ($descargarIDM -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    $env:InstaladorIDMEstado = "regresar-al-menu"
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargarIDM)
}
