# AddVPN.bat
This is a batch file that invokes PowerShell to install a VPN connection on a Windows computer


The default Windows VPN client requires you to use the SHA1 hash algorithim. SHA1 is no longer considered totally secure. This script allows you to repeatably deploy a VPN connection on a number of computers, that uses the SHA256 hash algorithm with out having to muck around reconfiguring the VPN after its created.

It is possible to hard code the things like, VPN name, username, and password. I dont suggest doing that but its possible by editing the "###configuration###" section of the script.


You will need to right click on the batch file and run as administrator, then follow the prompts, you will have to hit "Y" on a few prompts and enter your VPN info.

Thank You to whom ever I copy and pasted from!


For more information about some of the PowerShell commands please see:
https://docs.microsoft.com/en-us/powershell/module/vpnclient/add-vpnconnection?view=win10-ps

https://docs.microsoft.com/en-us/powershell/module/vpnclient/set-vpnconnectionipsecconfiguration?view=win10-ps

https://github.com/paulstancer/VPNCredentialsHelper
