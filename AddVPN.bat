<# : Begin batch (batch script is in commentary of powershell v2.0+)
@echo off
: Use local variables
setlocal
: Change current directory to script location - useful for including .ps1 files
cd %~dp0
: Invoke this file as powershell expression
powershell -executionpolicy remotesigned -Command "Invoke-Expression $([System.IO.File]::ReadAllText('%~f0'))"
: Restore environment variables present before setlocal and restore current directory
endlocal
: End batch - go to end of file
goto:eof
#>
# here start your powershell script
###get_necessary_packages###
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name VPNCredentialsHelper

###configuration###
$name = Read-host -Prompt "Enter the name of the VPN connection?"
$address = Read-Host -Prompt "Enter the IP of the VPN server?"
$username = Read-Host -Prompt "Enter your VPN username?"
$plainpassword = Read-Host -Prompt "Enter your VPN password?"
$ipsecsecret = Read-Host -Prompt "Enter the IPSec Secret / Pre-Shared Key of the VPN"


###create_vpn_connection###
add-VpnConnection -Name $name -ServerAddress $address -TunnelType "L2tp" -RememberCredential -EncryptionLevel Required -L2tpPsk $ipsecsecret -AuthenticationMethod MSChapv2
Set-VpnConnectionIPsecConfiguration -ConnectionName $name -AuthenticationTransformConstants SHA256128 -CipherTransformConstants AES128 -EncryptionMethod AES128 -IntegrityCheckMethod SHA256 -PfsGroup PFS2 -DHGroup Group2 -PassThru -Force
Set-VpnConnectionUsernamePassword -connectionname $name -username $username -password $plainpassword
# example: include another .ps1 scripts (commented, for quick copy-paste and test run)
#. ".\anotherScript.ps1"

# example: standard input from console
$variableInput = Read-Host "Continue? [Y/N]"
if ($variableInput -ne "Y") {
    Write-Host "Exit script..."
    break
}

# example: call standard powershell command
Get-Item .
