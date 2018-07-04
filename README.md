Creating an arm template with dsc and some other powershell to setup a vm with chocolatey.server

# todos
- finish the ChocolateServer.ps1 file, maybe split the DSC and the rest of the commands and make sure both are triggered from the arm template (see next todo).
- fix the modulesUrl in the arm template and check out the uploadartifacts funcationality in the deploy.ps1 file, maybe we can use that?
- remove the windowsosversion parameter from the arm file and hardcode it in the variables section
- clean up naming for all the resources created: MyVmNic -> ChocolateServerVmNic, etc.
- clean up the parameters file

# tips
- use this for testing the dsc locally: https://blogs.technet.microsoft.com/paulomarques/2016/07/06/azure-deployments-speeding-up-powershell-dsc-by-testing-locally-before-using-it-in-an-azure-resource-manager-template-or-from-a-powershell-deployment-script/

# manual for installing choco server
- https://chocolatey.org/docs/how-to-set-up-chocolatey-server#requirements
