# Import the Azure module
Import-Module Az

# Define parameters
param (
    [string]$storageAccountName,
    [string]$resourceGroupName,
    [string]$location = "West Europe"
)

# Login to Azure (if not already logged in)
Connect-AzAccount

# Create the resource group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                     -Name $storageAccountName `
                     -Location $location `
                     -SkuName "Standard_LRS" `
                     -Kind "StorageV2"