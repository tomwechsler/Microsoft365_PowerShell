Set-Location C:\
Clear-Host

#The SharePoint Module
Install-Module -Name Microsoft.Online.SharePoint.PowerShell

#Credential
$cred = get-credential

#Let's connect
Connect-SPOService `
    -Url https://<SP Admin Center>.sharepoint.com `
    -Credential $cred

#Did it work?
Get-SPOSite
