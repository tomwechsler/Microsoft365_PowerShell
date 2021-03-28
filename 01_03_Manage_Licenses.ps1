Set-Location c:\
Clear-Host

#What licenses are available?
Get-AzureADSubscribedSku 

#More info about the license package
Get-AzureADSubscribedSku | Select-Object  -Property ObjectId, SkuPartNumber, ConsumedUnits -ExpandProperty PrepaidUnits

#What is included in the license package
Get-AzureADSubscribedSku `
    -ObjectId fa17dd8f-73cb-4300-9dfd-265b06fd8901_6fd2c87f-b296-42f0-b197-1e91e994b900 | Select-Object -ExpandProperty ServicePlans

#We select a user
$User = Get-AzureADUser -ObjectId fred.prefect@tomrocks.ch

#The user needs a location
Set-AzureADUser -ObjectId $User.ObjectId -UsageLocation CH

#Create the AssignedLicense object
$Sku = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense

#We need the SKU ID
$Sku.SkuId = "6fd2c87f-b296-42f0-b197-1e91e994b900"

#Create the AssignedLicenses Object
$Licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses

#Add the SKU
$Licenses.AddLicenses = $Sku

#Setting a License to a User
Set-AzureADUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses

#Creating a Custom License
$User = Get-AzureADUser -ObjectId fred.prefect@tomrocks.ch

#Create the AssignedLicense object
$Sku = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$Sku.SkuId = "6fd2c87f-b296-42f0-b197-1e91e994b900"

#Show the ServicePlans
Get-AzureADSubscribedSku -ObjectId fa17dd8f-73cb-4300-9dfd-265b06fd8901_6fd2c87f-b296-42f0-b197-1e91e994b900 | Select-Object -ExpandProperty ServicePlans

#Get the LicenseSKU and create the Disabled ServicePlans object
$Sku.DisabledPlans = @("7547a3fe-08ee-4ccb-b430-5077c5041653","aebd3021-9f8f-4bf8-bbe3-0ed2f4f047a1")

#Create the AssignedLicenses Object
$Licenses = New-Object –TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses

#Add the SKU
$Licenses.AddLicenses = $Sku

#Assign the license to the user
Set-AzureADUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses