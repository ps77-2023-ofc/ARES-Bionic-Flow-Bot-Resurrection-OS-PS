Write-Host "¡Entendido! Comenzando tarea 1 de 2: Descarga de Rainmeter..."

$url = "https://objects.githubusercontent.com/github-production-release-asset-2e65be/3887375/3cf89ee0-8db2-42cc-b036-364bfcee203f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230712%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230712T210835Z&X-Amz-Expires=300&X-Amz-Signature=57a77b2a237d84118f1e0c95fdbc8c6f6dd4c980e4dd82d299028130cdf3e91d&X-Amz-SignedHeaders=host&actor_id=96272833&key_id=0&repo_id=3887375&response-content-disposition=attachment%3B%20filename%3DRainmeter-4.5.17.exe&response-content-type=application%2Foctet-stream"
$rutaDescarga = "C:\Users\Usuario-ROS\Downloads\Rainmeter-4.5.17.exe"

Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

Write-Host "Tarea 1 de 2 - Descarga de Rainmeter - ¡Completada!"
Write-Host "Comenzando tarea 2 de 2 - Instalación de Rainmeter..."

# Ejecutar el instalador de Rainmeter de forma silenciosa
Start-Process -FilePath $rutaDescarga -ArgumentList "Rainmeter-4.5.17.exe /S /AUTOSTARTUP=0 /VERSION=64 /LANGUAGE=3082" -Wait

# Borrar el instalador descargado
Remove-Item $rutaDescarga -Force

Write-Host "¡Finalizado! Rainmeter ha sido instalado correctamente." 
Write-Host "En unos minutos debería abrirse, pero si no lo hace, ve al Escritorio o al menú Inicio para comprobar que ya fue instalado :)"


$returnValue = "return-to-menu"