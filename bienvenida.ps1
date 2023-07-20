# Cambiar el título de la consola
$consoleTitle = "ARES Bionic-Flow Bot Assistant for Resurrection OS v1.0"
$host.ui.RawUI.WindowTitle = $consoleTitle

# Verificar privilegios de Administrador
$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Mensaje de bienvenida
function Show-Welcome-Message {
    Write-Host "---- BIENVENIDO AL ARES BIONIC-FLOW BOT ASSISTANT FOR RESURRECTION OS V1.0 ------"
    Write-Host "¡Hola! Te doy la bienvenida. Soy ARES Bionic-Flow, el script tipo bot automatizado oficial de Resurrection OS," 
    Write-Host "y estoy aquí para ayudarte a dar tus primeros pasos con Resurrection OS, o ayudarte mientras lo usas."
    Write-Host "Esto es de lo que soy capaz:"
    Write-Host "- Puedo ayudarte a descargar e instalar el software y programas que usas de forma automática."
    Write-Host "- Puedo configurar por ti ciertos perfiles de personalización en el sistema, para hacerlo más único."
    Write-Host "- Puedo ayudarte a optimizarlo en casos de emergencia, para desbloquear su potencial."
    Write-Host "- Puedo ayudarte a habilitar algunos parámetros útiles en el sistema, y así brindarte acceso a algunas herramientas o cosas útiles."
    Write-Host ""
    Write-Host "Cabe aclararte que, en mi menú principal, luego de esta pantalla, habrá una opción que te permitirá habilitar la Protección del sistema (en caso de que no la tengas activada) y crear un punto de restauración, en caso de que alguna de las cosas que realizo cause algún daño en el sistema."
    Write-Host ""
    Write-Host "¡Estoy aquí para ayudarte! Si me necesitas, abre el Menú Extendido de Resurrection OS y allí me encontrarás. Dale a la opción 'Iniciar ARES Bionic-Flow Bot'."
    Write-Host ""
    Write-Host "Cuando estés listo para comenzar, responde abajo con una S y pulsa Enter para comenzar."
    Write-Host ""
}


if ($isAdmin) {
    Show-Welcome-Message
    $ready = Read-Host "¿Estas listo para comenzar?"
    if ($ready -eq "S") {
        Write-Host ""
        Write-Host "¡Perfecto! Vamos a comenzar."
        Start-Sleep -Seconds 3
        $scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "menu_principal.ps1"
        Clear-Host
        & $scriptPath
    } elseif ($ready -eq "N") {
        Write-Host "¡Nos vemos! Recuerda, si me necesitas de nuevo, me puedes encontrar en el Menú Extendido de Resurrection OS, haciendo clic en la opción 'Iniciar ARES Bionic-Flow Bot'. ¡Nos vemos luego!" -ForegroundColor Yellow
        Start-Sleep -Seconds 4
        exit
    }
    else {
        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
        Write-Host ($ready)
    }
} else {
    # Mensaje de error si no se ejecuta como Administrador
    Write-Host "¡Oh no! Algo ha pasado. :("
    Write-Host "Esto pasó: No me has ejecutado con privilegios de Administrador." 
    Write-Host "¡No puedo funcionar correctamente si no me ejecutas con privilegios de Administrador!" 
    Write-Host "Ya que muchas de las cosas que hago requieren realizar cambios en el sistema, que requieren de aprobación."
    Write-Host "Por favor, cierra esta ventana y ejecútame nuevamente, pero dando en la opción 'Ejecutar como Administrador', e intenta nuevamente."
    Write-Host ""
    Write-Host "¡Espero verte por acá de nuevo! Recuerda ejecutarme como Administrador." -ForegroundColor Yellow
    Write-Host "Presiona cualquier tecla para salir..."
    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
}
