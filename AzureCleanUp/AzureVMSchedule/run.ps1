# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

$amPM = $currentUTCtime.toString().split(" ")[-1]
$vm = Get-AzVM -Name 'testvm5'

if ($amPM -eq 'AM') {
    Start-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName
} else {
    Stop-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName -Force
}

# Write an information log with the current time.
Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"
