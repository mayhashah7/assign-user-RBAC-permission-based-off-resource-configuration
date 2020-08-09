$windowsVMs = Search-AzGraph -Query "Resources | where type =~ 'Microsoft.Compute/virtualMachines' | where tostring(properties.storageProfile.osDisk.osType) =~ 'Windows'"

foreach ($resource in $windowsVMs) {
	New-AzRoleAssignment -ObjectId <INSERT USER OBJECT ID HERE> -RoleDefinitionName "Virtual Machine Contributor" -ResourceName $resource.name `
	-ResourceType $resource.type -ResourceGroupName $resource.resourceGroup
}