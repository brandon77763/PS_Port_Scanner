# Define the IP range
$IPRange = 10..20
$Subnet = "192.168.1"

# Define the port to check
$Port = 22

# Loop through the range and test the port
foreach ($IP in $IPRange) {
    $Address = "$Subnet.$IP"
    $TCPConnection = Test-NetConnection -ComputerName $Address -Port $Port -WarningAction SilentlyContinue
    if ($TCPConnection.TcpTestSucceeded) {
        Write-Host "Port $Port is open on $Address"
    } else {
        Write-Host "Port $Port is closed on $Address"
    }
}
