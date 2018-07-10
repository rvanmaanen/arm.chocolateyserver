Configuration ChocolateyServer
{
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

    WindowsFeature IIS
    {
        Ensure = "Present"
        Name = "Web-Server"
    }

    WindowsFeature ASP
    {
        Ensure = "Present"
        Name = "Web-Asp-Net45"
    }

    WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
}

ChocolateyServer

Set-ExecutionPolicy Bypass -Scope Process -Force

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco upgrade chocolatey.server -y

Remove-WebSite -Name "Default Web Site"

New-WebAppPool -Name "Chocolatey.Server"

set-itemProperty IIS:\apppools\Chocolatey.Server -name "enable32BitAppOnWin64" -Value "true"

New-WebSite -Name Chocolatey.Server -ApplicationPool Chocolatey.Server -PhysicalPath "c:\tools\chocolatey.server"


