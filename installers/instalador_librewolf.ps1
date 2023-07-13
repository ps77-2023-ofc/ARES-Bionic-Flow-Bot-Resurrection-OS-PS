$descargarLibWolf = Read-Host "¿Deseas instalar LibreWolf? (S/N)"

if ($descargarLibWolf -eq "S") {
    Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de LibreWolf..."

    $url = "https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/115.0.2-2/librewolf-115.0.2-2-windows-x86_64-setup.exe"
    $rutaDescarga = "C:\Users\Usuario-ROS\Downloads\librewolf-115.0.2-2-windows-x86_64-setup.exe"

    Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

    Write-Host "Tarea 1 de 2 - Descarga de LibreWolf - ¡Completada!"
    Write-Host "Comenzando tarea 2 de 2 - Instalación de LibreWolf..."

    # Ejecutar el instalador de LibreWolf de forma silenciosa
    Start-Process -FilePath $rutaDescarga -ArgumentList "/S" -Wait

    # Borrar el instalador descargado
    Remove-Item $rutaDescarga -Force

    Write-Host "¡Finalizado! LibreWolf ha sido instalado correctamente." 
    Write-Host "En unos minutos debería abrirse, pero si no lo hace, ve al Escritorio, al menú Inicio"
    Write-Host " o comprueba la barra de tareas para comprobar que ya fue instalado :)"
    Write-Host "Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
elseif ($descargarLibWolf -eq "N"){
    Write-Host "De acuerdo. Refrescando el menú..."
    Start-Sleep -Seconds 5
    $returnValue
    exit
}
else{
    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
    Write-Host ($descargarLibWolf)
}
$returnValue = "return-to-menu"
