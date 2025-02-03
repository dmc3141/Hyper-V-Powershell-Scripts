Param
    (
    [parameter(Mandatory = $true)]
    [string]$targetVM
    )

$vmwareToolsGuid =$null
$regPath = 'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall' 
# Retrieve the GUID of the VMware Tools registry key
$vmwareToolsGuid = invoke-command -computername $targetVM -scriptblock {Get-ChildItem $using:regPath | Get-ItemProperty | Where-Object {'Vmware Tools' -contains $_.DisplayName }}
# Uninstall VMware Tools using the GUID 
if ($vmwareToolsGuid) {
    Write-Output "Removing VMware Tools"
    $uninstallstring = $vmwareToolsGuid.pschildname
    invoke-command -computername $targetVM -scriptblock { cmd.exe /c "msiexec /x $($using:uninstallstring) /qn" }   
    }
    
else { Write-Output "VMware Tools not found." }