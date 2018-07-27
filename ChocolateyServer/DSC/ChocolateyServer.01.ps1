Configuration WindowsFeatures
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

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

# only run windows features here, use them in part 2. This way, the new cmdlets will be available in step 2
WindowsFeatures