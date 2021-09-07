$USER = $env:UserName
$BROWSER_PATH = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

Remove-Item -path C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn

Start-Process -FilePath $BROWSER_PATH "https://access-acp.digital.homeoffice.gov.uk/ui/profiles/jira-confluence/issue?template=Default"

While ((Test-Path -Path C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn) -eq $false) {
    Start-Sleep -Seconds 10
}

Set-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" -Value (Get-Content -Path "C:\Users\$USER\Downloads\vpn-jira-confluence*.ovpn" | Where-Object {$_ -notmatch '\[inline\]'})