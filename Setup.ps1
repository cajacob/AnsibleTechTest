#Requires -RunAsAdministrator
#install virtualbox
Process{

    #Install VirtualBox from Chocolatey 
    $chocopkg = Get-PackageProvider -ListAvailable | Where-Object {$_.Name -eq "Chocolatey"}
    if($chocopkg -eq $null){
        Write-Host "Installing Chocolatey to install VirtualBox"
        Install-PackageProvider Chocolatey -Force 
        Set-PackageSource -Name chocolatey -Trusted

    }
    $virtualBox = Find-Package VirtualBox 
    if($virtualBox -eq $null){
        throw "Cannot find VirtualBox Package"
    }

    $packagesToInstall = @("VirtualBox", "Vagrant")
    foreach ($pkg in $packagesToInstall){
        $pkgInstalled = Get-Package $pkg
        if($pkgInstalled -eq $null){
            Write-Host "Installed $pkg"
            Install-Package $pkg -ProviderName Chocolatey 
            Write-Host "Installed $pkg"
        }else {
            "$pkg is already installed. Skipping Installation"
        }

    }

}
      



#install vagrant 

# install virtualbox 
# copy the files from the folder 
#add the vagrant file with appropriate configuration. 
#install docker 
#install ansible
#run the playbook with the appropriate configuration. 
