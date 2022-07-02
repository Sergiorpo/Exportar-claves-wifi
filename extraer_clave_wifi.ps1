Write-Output "Lista de redes Wifi."
netsh wlan show profile | findstr "todos"  
$data = @()

while($clave -ne 'salir')
{   
    $clave = Read-Host "Introduce SSID"
    netsh wlan show profile name=$clave Key=clear | Select-String -Pattern "Nombre de SSID"
    netsh wlan show profile name=$clave Key=clear | Select-String -Pattern "Contenido"
    $data += netsh wlan show profile name=$clave Key=clear | Select-String -Pattern "Nombre de SSID" 
    $data += netsh wlan show profile name=$clave Key=clear | Select-String -Pattern "Contenido" 
    $data += " "
}
$data | Out-File -Append Clave_wifi.txt  
Write-Output "Guardando fichero con claves..."
$end = Read-Host "Pulsa cualquier tecla para salir..."