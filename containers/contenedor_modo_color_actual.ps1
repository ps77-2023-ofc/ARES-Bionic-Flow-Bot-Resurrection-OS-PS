$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$appsUseLightTheme = Get-ItemPropertyValue -Path $regPath -Name AppsUseLightTheme

if ($appsUseLightTheme -eq 0) {
    $colorModeStatus = "actual-cms-is-dark-mode-enabled"
} elseif ($appsUseLightTheme -eq 1) {
    $colorModeStatus = "actual-cms-is-light-mode-enabled"
}

$colorModeStatus