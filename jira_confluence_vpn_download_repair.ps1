﻿$USER = $env:UserName
$VPNEnv = $Env:Temp = "C:\Users\$USER\Downloads\.env"
$URL = Get-Content $VPNEnv 

# removes any jira-confluence ovpn files in users downloads folder
Remove-Item -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn"

# accesses url for file download using users default browser
Start-Process $URL

# stalls the program until new jira-confluence ovpn file has been downloaded
# should have a termination condition after a certain amount of time but beyond scope of this change
While ((Test-Path -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn") -eq $false) {
    Start-Sleep -Seconds 10
}

# removes lines in ovpn file causing errors
Set-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" -Value (Get-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" | Where-Object {$_ -notmatch '\[inline\]'})