This repository contains two powershell scripts for Hyper-V setups.

The first script DesktopRemove-VMTools.ps1 can be run from any host from an admininstrator PowerShell session. Enter the target vm with the flag -targetVM. It will run on that system and remove the VMware Tools and reboot the system.

The second script HyperVHostChunksize.ps1 will modify the Hyper-V host chunk size to allow for faster VMware to Hyper-V conversion. This script will require the hostname and the SCVMM server managing the host. 
