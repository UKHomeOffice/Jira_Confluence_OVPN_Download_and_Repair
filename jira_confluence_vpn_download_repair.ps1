$USER = $env:UserName

Remove-Item -path C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn

Start-Process "https://access-acp.digital.homeoffice.gov.uk/ui/profiles/jira-confluence/issue?template=Default"

While ((Test-Path -Path C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn) -eq $false) {
    Start-Sleep -Seconds 10
}

Set-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" -Value (Get-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" | Where-Object {$_ -notmatch '\[inline\]'})