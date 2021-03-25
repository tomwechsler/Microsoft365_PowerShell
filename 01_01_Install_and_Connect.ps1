Set-Location c:\
Clear-Host

#Install the AzureADPreview
Install-Module -Name AzureADPreview -AllowClobber -Verbose -Force

#Connect without MFA
$cred = Get-Credential 
Connect-AzureAD -Credential $cred

#Connect with MFA
Connect-AzureAD -AccountId "tom@tomrocks.ch"

#IMPORTANT => You cannot install both modules on the same system!

#Install the AzureAD
Install-Module -Name AzureAD -AllowClobber -Verbose -Force

#Connect without MFA
$cred = Get-Credential 
Connect-AzureAD -Credential $cred

#Connect with MFA
Connect-AzureAD -AccountId "tom@tomrocks.ch"

#Did it work?
Get-AzureADUser