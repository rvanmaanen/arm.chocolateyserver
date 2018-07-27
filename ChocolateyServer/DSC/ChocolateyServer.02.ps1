# builds upon part 1. Now the windows features should be available

Configuration ChocolateyServer
{
	Set-ExecutionPolicy Bypass -Scope Process -Force

	Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

	choco upgrade chocolatey.server -y

	Remove-WebSite -Name "Default Web Site"

	New-WebAppPool -Name "Chocolatey.Server"

	set-itemProperty IIS:\apppools\Chocolatey.Server -name "enable32BitAppOnWin64" -Value "true"

	New-WebSite -Name Chocolatey.Server -ApplicationPool Chocolatey.Server -PhysicalPath "c:\tools\chocolatey.server"
}

ChocolateyServer

