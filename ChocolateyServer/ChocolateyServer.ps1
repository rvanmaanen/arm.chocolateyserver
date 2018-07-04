#todo: finish this file, maybe split the DSC and the rest of the commands and make sure both are triggered from the arm template (see next todo).
#todo: fix the modulesUrl in the arm template and check out the uploadartifacts funcationality in the deploy.ps1 file, maybe we can use that?
#todo: remove the windowsosversion parameter from the arm file and hardcode it in the variables section
#todo: clean up naming for all the resources created: MyVmNic -> ChocolateServerVmNic, etc.

#tips: https://blogs.technet.microsoft.com/paulomarques/2016/07/06/azure-deployments-speeding-up-powershell-dsc-by-testing-locally-before-using-it-in-an-azure-resource-manager-template-or-from-a-powershell-deployment-script/
#manual for choco server: https://chocolatey.org/docs/how-to-set-up-chocolatey-server#requirements

Configuration ChocolateyServer
{
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

    WindowsFeature IIS
    {
        Ensure = “Present”
        Name = “Web-Server”
    }

    WindowsFeature ASP
    {
        Ensure = “Present”
        Name = “Web-Asp-Net45”
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


