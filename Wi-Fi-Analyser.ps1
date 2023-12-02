<#
.SYNOPSIS
This script samples WiFi network data and saves it in JSON format for analysis.

.DESCRIPTION
Wi-Fi-Analyser.ps1 samples data from available WiFi networks, including SSIDs, 
signal strengths, and active status. The data is timestamped and saved in a JSON file, 
which is used by an accompanying HTML file for visualization.

.PARAMETER Delay
The delay in seconds between data samples.

.EXAMPLE
PS> .\Wi-Fi-Analyser.ps1
Runs the script with default settings.

.NOTES
This script requires PowerShell 5.1 or later and a compatible WiFi adapter.
#>

# Script parameters and initialization
$Delay = 5
$DataPath = ".\Website\data.json"

$AllData = @()

# Function to sample WiFi data with timestamps
function Sample-WiFi {
    $timestamp = Get-Date -Format "o" # ISO 8601 format
    $netshOutput = netsh wlan show networks mode=bssid
    $sample = @()
    foreach ($line in $netshOutput -split "`r`n") {
        if ($line -match "SSID \d+ : (?<ssid>.+)") {
            $currentSSID = $matches.ssid.Trim()
        }
        if ($line -match "Signal\s+: (?<signal>\d+)%") {
            $currentSignal = [int]$matches.signal
            if (-not [string]::IsNullOrWhiteSpace($currentSSID)) {
                $sample += @{
                    "SSID" = $currentSSID
                    "Signal" = $currentSignal
                    "Active" = $true
                    "Timestamp" = $timestamp
                }
            }
        }
    }
    return $sample
}

# Function to append WiFi data to the global data array
function Update-GlobalData {
    $global:AllData += Sample-WiFi
}

# Function to save the global data array to the JSON file
function Save-DataToFile {
    $global:AllData | ConvertTo-Json | Set-Content -Path $DataPath
}

# Initial data sample
Update-GlobalData
Save-DataToFile

# Main loop for periodic data sampling
while ($true) {
    Start-Sleep -Seconds $Delay
    Update-GlobalData
    Save-DataToFile
}
