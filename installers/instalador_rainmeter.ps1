
$url = "https://objects.githubusercontent.com/github-production-release-asset-2e65be/3887375/3cf89ee0-8db2-42cc-b036-364bfcee203f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230711%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230711T221428Z&X-Amz-Expires=300&X-Amz-Signature=105ed2b7f70674d53a546a530aebb794aa019d832e285064cb9686c7e674da12&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=3887375&response-content-disposition=attachment%3B%20filename%3DRainmeter-4.5.17.exe&response-content-type=application%2Foctet-stream"
$rutaDescarga = "C:\Users\Usuario-ROS\Downloads\Rainmeter-4.5.17.exe"

Invoke-WebRequest -Uri $url -OutFile $rutaDescarga

Write-Host "Tarea 1 de 2 : Descarga de Rainmeter - ¡Completada!"
Write-Host "Comenzando tarea 2 de 2 - Instalación de Rainmeter..."

# Ejecutar el instalador de Google Chrome de forma silenciosa
Start-Process -FilePath $rutaDescarga -ArgumentList "/S /AUTOSTARTUP=0 /VERSION=64" -Wait

# Borrar el instalador descargado
Remove-Item $rutaDescarga -Force

Write-Host "¡Finalizado! Rainmeter ha sido instalado correctamente." 
Write-Host "Chequea en el Menú Inicio o en los atajos ocultos para comprobar si ya fue instalado :)"
Start-Sleep -Seconds 5
$returnValue = "return-to-menu"
$returnValue