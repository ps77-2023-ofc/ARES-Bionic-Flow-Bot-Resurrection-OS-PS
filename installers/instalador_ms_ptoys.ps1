Write-Host "De acuerdo. Comenzando tarea 1 de 2: Descarga de Microsoft PowerToys..."

$url = "https://github.com/microsoft/PowerToys/releases/download/v0.69.1/PowerToysSetup-0.69.1-x64.exe"
$rutaDescarga = "C:\Users\Usuario-ROS\Downloads\PowerToysSetup-0.69.1-x64.exe"

Invoke-WebRequest -Uri $url -OutFile $rutaDescarga -Quiet

Write-Host "Tarea 1 de 2 - Descarga de Microsoft PowerToys - ¡Completada!"
Write-Host "Comenzando tarea 2 de 2 - Instalación de Microsoft PowerToys..."

# Ejecutar el instalador de Microsoft PowerToys de forma silenciosa
Start-Process -FilePath $rutaDescarga -ArgumentList "/S /D=C:\PowerToys" -Wait

# Borrar el instalador descargado
Remove-Item $rutaDescarga -Force

Write-Host "¡Finalizado! Microsoft PowerToys ha sido instalado correctamente." 
Write-Host "Puedes comprobarlo yendo al menú Inicio o al Escritorio :)"
Write-Host "Refrescando el menú..."
Start-Sleep -Seconds 5
Clear-Host
$env:EstadoInstalacionMSPowerToys = "regresar-al-menu"