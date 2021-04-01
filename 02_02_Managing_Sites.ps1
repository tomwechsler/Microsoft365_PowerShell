Set-Location C:\
Clear-Host

#List (almost all) sites
Get-SPOSite

#There are hundreds of sites use -all
Get-SPOSite -Limit All

#Site template
Get-SPOSite -Template GROUP#0

#We cerate a new site
New-SPOSite `
    -Url https://wechsler2022.sharepoint.com/sites/TestPSteamSite`
     -Owner fred.jonas@tomrocks.ch 	`
     -Title "Modern Stand Alone Team Site" `
     -Template STS#3	`
     -StorageQuota 10240

#An other site
New-SPOSite `
    -Url https://wechsler2022.sharepoint.com/sites/TestPSCommSite `
     -Owner fred.jonas@tomrocks.ch `
     -Title "Communication Site" `
     -Template SITEPAGEPUBLISHING#0`
-StorageQuota 10240

#Change some settings
Set-SPOSite `
    -Identity https://wechsler2022.sharepoint.com/sites/TestPSCommSite`
    -Title "EMEA Sales"`
    -SocialBarOnSitePagesDisabled $true`
    -SharingCapability ExternalUserSharingOnly

#To remove a site
Remove-SPOSite `
    -Identity https://wechsler2022.sharepoint.com/sites/TestPSCommSite `
    -Confirm:$false

#Restore a site
Restore-SPODeletedSite `
    -Identity https://wechsler2022.sharepoint.com/sites/TestPSCommSite

#How to register a hub site
Register-SPOHubSite `
    -Site https://wechsler2022.sharepoint.com/sites/TestPSCommSite  `
    -Principals $null

#Add a hub site association
Add-SPOHubSiteAssociation`
    -Site https://wechsler2022.sharepoint.com/sites/TestPSteamSite `
     -HubSite https://wechsler2022.sharepoint.com/sites/TestPSCommSite