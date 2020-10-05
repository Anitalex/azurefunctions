# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

Write-Host "Current UTC time:  $currentUTCtime"

$rgs = Get-AzResourceGroup
foreach ($rg in $rgs){
    if ($rg.ResourceId -ne '/subscriptions/8348c69f-7f45-46be-8513-7cb4762c69c2/resourceGroups/azurecleanup'){
        Remove-AzResourceGroup -Name $rg.ResourceGroupName -Force
    }
}

# Write an information log with the current time.
Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"
