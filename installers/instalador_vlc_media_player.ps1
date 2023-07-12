$descargarMSEdge = Read-Host "¿Deseas instalar VLC Media Player? (S/N)"

if ($descargarMSEdge -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de VLC Media Player..."

    $url = "https://edgeuno-bog2.mm.fcix.net/videolan-ftp/vlc/3.0.18/win64/vlc-3.0.18-win64.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\vlc-3.0.18-win64.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de VLC Media Player - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de VLC Media Player..."

    # Ejecutar el instalador de VLC Media Player de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/L=1034 /S" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! VLC Media Player ha sido instalado correctamente." 
    Write-Host "Ve al menú Inicio para comprobar que ya fue instalado :)"
}

$returnValue = "return-to-menu"