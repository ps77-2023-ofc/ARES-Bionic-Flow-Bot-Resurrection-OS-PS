$installersFolderPath = ".\installers"
$checkersFolderPath = ".\checkers"
$showOption1optionsMenu = {
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                                                                                                                          |"
    Write-Host "|                                              DESCARGA / INSTALACIÓN DE SOFTWARE/PROGRAMAS                                |        |"
    Write-Host "|                                                                                                                                                                                                          |"
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
    Write-Host "1. Descargar / instalar Google Chrome"
    Write-Host "2. Descargar / instalar Microsoft Edge"
    Write-Host "3. Descargar / instalar Mozilla Firefox"
    Write-Host "4. Descargar / instalar Navegador LibreWolf"
    Write-Host "5. Descargar / instalar VLC Media Player"
    Write-Host "6. Descargar / instalar K-Lite Codec Pack"
    Write-Host "7. Descargar / instalar Rainmeter"
    Write-Host "8. Descargar / instalar Lively Wallpaper"
    Write-Host "9. Descargar / instalar 7-Zip"
    Write-Host "10. Descargar / instalar IDM (Internet Download Manager)"
    Write-Host "11. Descargar / instalar Microsoft PowerToys"
    Write-Host "12. Regresar al menú principal"
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
}
Write-Host ($showOption1optionsMenu)
$option = Read-Host "¿Qué deseas hacer?"
switch ($option) {
    "1" {
        Clear-Host
        & "$installersFolderPath\instalador_google_chrome.ps1"
        break
    }
    "2" {
        Clear-Host
        & "$installersFolderPath\instalador_ms_edge.ps1"
        break
    }
    "3" {
        Clear-Host
        & "$installersFolderPath\instalador_mozilla_firefox.ps1"
        break
    }
    "4" {
        Clear-Host
        & "$installersFolderPath\instalador_librewolf.ps1"
        break
    }
    "5" {
        Clear-Host
        & "$installersFolderPath\instalador_vlc_media_player.ps1"
        break
    }
    "6" {
        Clear-Host
        & "$installersFolderPath\instalador_klite_codec_pack.ps1"
    }
    "7" {
        Clear-Host
        $installPrevApproval = {
            Write-Host "¡Entendido! Para ofrecerte la mejor experiencia, y prevenir problemas de rendimiento cuando uses Rainmeter,"
            Write-Host "realizaré una comprobación rápida de tu equipo, para asegurarme que cumples con los requisitos mínimos y/o recomendados para usarlo."
            Write-Host "Cuando la comprobación finalice, te diré los resultados. De acuerdo a lo que obtengas, te diré qué debes hacer a continuación."
        }
        Write-Host ($installPrevApproval)
        $approval = Read-Host "¿Aceptas que realice la comprobación y comenzar con la instalación de Rainmeter? (S/N)"
        if ($approval -eq "S"){
            Write-Host "¡Muy bien! Comprobando tu equipo... (Espera a que la comprobación finalice)"
            & "$checkersFolderPath\comprobador_compatibilidad_rainmeter.ps1"
            if ($compatibilityStatus -eq "system-is-compatible" -and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: REQUISITOS CUMPLIDOS"
                Write-Host "¡Felicidades! Has pasado la prueba de los requisitos mínimos y/o recomendados para Rainmeter,"
                Write-Host "con lo que tienes luz verde para instalarlo."
                $compatPassedApproval = Read-Host "¿Listo para comenzar? (S/N)"
                if ($compatPassedApproval -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($compatPassedApproval -eq "N"){
                    Write-Host "De acuerdo. ¡Regresa cuando estés listo! Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($compatPassedApproval)
                }
            }
            elseif ($compatibilityStatus -eq "isFull_FullLegends_but_not_compatible"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: ESTÁS EN FULL/FULL LEGENDS, PERO NO CUMPLES LOS REQ. MÍNIMOS."
                Write-Host "Hmm... parece que sí tienes Resurrection OS Full o Full Legends instalado, pero alguno de los requisitos"
                Write-Host "mínimos o recomendados no los cumples. Verifica en la Base de Conocimientos oficial de Resurrection OS"
                Write-Host "y chequea qué requisito podrías no estar cumpliendo."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#requisitos"
                Start-Sleep -Seconds 5
                Write-Host "Independiente del requisito, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $FullFLegendsbutNotCompatDisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($FullFLegendsbutNotCompatDisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($FullFLegendsbutNotCompatDisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($FullFLegendsbutNotCompatDisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-1-ocurred" -and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 1."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #1 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case1DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case1DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case1DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case1DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-2-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 2."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #2 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case2DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case2DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case2DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case1DisclaimerAccepted)
                }
            }
        }
        elseif ($compatibilityStatus -eq "error-case-3-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
            Write-Host "¡Terminé! Aquí tengo tus resultados:"
            Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 3."
            Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #3 de incompatibilidad."
            Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
            Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
            Start-Sleep -Seconds 5
            Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
            Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
            Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
            $case3DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case3DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case3DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case3DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-4-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 4."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #4 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case4DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case4DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case4DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case4DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-5-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 5."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #5 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case5DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case5DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case5DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case5DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-6-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 6."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #6 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case6DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case6DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case6DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case6DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-7-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 7."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #7 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case7DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case7DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case7DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case7DisclaimerAccepted)
                }
            }
            elseif ($compatibilityStatus -eq "error-case-8-ocurred"-and $scriptExecutionStatus -eq "check-finished"){
                Write-Host "¡Terminé! Aquí tengo tus resultados:"
                Write-Host "Estado de la compatibilidad: NO CUMPLES LOS REQUISITOS: CASO 8."
                Write-Host "Hmm... parece que tu equipo no cumple con los requisitos mínimos/recomendados. En base a mis análisis, aplicas al Caso #8 de incompatibilidad."
                Write-Host "Ve a la Base de Conocimientos oficial de Resurrection OS y chequea el caso al que aplicas para saber qué he encontrado."
                Write-Host "Puedes acceder a ella en: https://docs-resurrectionos.gitbook.io/resurrection-os-knowledge-base/usando-al-ares-bot/opcion-6-rainmeter#casos-de-incompatibilidad"
                Start-Sleep -Seconds 5
                Write-Host "Independientemente del caso en el que te encuentres, aún puedo ayudarte a instalar Rainmeter, pero será bajo tu propio riesgo."
                Write-Host "Si decides instalar Rainmeter de todas maneras, y empiezas a experimentar problemas de rendimiento, y si al usar"
                Write-Host "mis herramientas de optimización no ves mejoría o ves muy poca, mi creador no tomará responsabilidad ante ello. Quedas advertido."
                $case8DisclaimerAccepted = Read-Host "Dicho esto, ¿quieres continuar de todos modos? (S/N)"
                if ($case8DisclaimerAccepted -eq "S"){
                    & "$installersFolderPath\instalador_rainmeter.ps1"
                }
                elseif ($case8DisclaimerAccepted -eq "N"){
                    Write-Host "Buena decisión. ¡Cuida siempre el rendimiento de tu equipo! :)"
                    Write-Host "Refrescando el menú..."
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($showOption1optionsMenu)
                }
                else {
                    Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo nuevamente!"
                    Start-Sleep -Seconds 5
                    Clear-Host
                    Write-Host ($case8DisclaimerAccepted)
                }
            }
            elseif ($approval -eq "N"){
                Write-Host "Para instalar Rainmeter, y asegurarme de que tendrás la mejor experiencia usándolo, necesito tu aprobación para realizar la comprobación."
                Write-Host "Debido a que la has negado, no podré ayudarte a instalar Rainmeter. ¡Si cambias de opinión, ejecuta nuevamente la opción 5!"
                Write-Host "Refrescando el menú..."
                Start-Sleep -Seconds 5
                Clear-Host
                Write-Host ($showOption1optionsMenu)
            }
            else {
                Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                Start-Sleep -Seconds 3
                Clear-Host
                Write-Host ($installPrevApproval)
            }
            break
        }
    "8" {
        Clear-Host
        & "$installersFolderPath\instalador_lively_wallpaper.ps1"
        break
    }
    "9" {
        Clear-Host
        & "$installersFolderPath\instalador_7zip.ps1"
        break
    }
    "10" {
        Clear-Host
        & "$installersFolderPath\instalador_idm.ps1"
        break
    }
    "11" {
        Clear-Host
        & "$installersFolderPath\instalador_ms_powertoys.ps1"
        break
    }
    "12"{
        Clear-Host
        Write-Host "De acuerdo. Regresando al menú principal..." -ForegroundColor Yellow
        Start-Sleep -Seconds 4
        # Devolver el valor que indica el regreso al menú principal
        $returnValue = "return-to-menu"
        break
    }
    default {
        Clear-Host
        Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
        Start-Sleep -Seconds 2
        break
    }
}
# Devolver el valor al script principal (menu_principal.ps1)
$returnValue