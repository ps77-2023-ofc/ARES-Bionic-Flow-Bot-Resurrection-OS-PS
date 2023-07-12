$descargarMSEdge = Read-Host "¿Deseas instalar Microsoft Edge? (S/N)"

if ($descargarMSEdge -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de Microsoft Edge..."

    $url = "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=es&brand=M100"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\MicrosoftEdgeSetup.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de Microsoft Edge - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de Microsoft Edge..."

    # Ejecutar el instalador de Microsoft Edge de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/silent /install" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! Microsoft Edge ha sido instalado correctamente." 
    Write-Host "En unos minutos debería abrirse, pero si no lo hace, ve al Escritorio o al menú Inicio para comprobar que ya fue instalado :)"
}

$returnValue = "return-to-menu"