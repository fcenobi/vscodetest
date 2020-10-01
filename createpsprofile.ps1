Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

if(!(Test-Path -Path $profile  )){New-Item -path $profile -type file -force}

if(!(Test-Path -Path $profile.AllUsersAllHosts  )){New-Item -path $profile.AllUsersAllHosts -type file -force}

if(!(Test-Path -Path $profile.AllUsersCurrentHost  )){New-Item -path $profile.AllUsersCurrentHost -type file -force}

if(!(Test-Path -Path $profile.CurrentUserAllHosts  )){New-Item -path $profile.CurrentUserAllHosts -type file -force}

if(!(Test-Path -Path $profile.CurrentUserCurrentHost )){New-Item -path $profile.CurrentUserCurrentHost -type file -force}

Test-Path -Path $profile
Test-Path -Path $profile.AllUsersAllHosts 
Test-Path -Path $profile.AllUsersCurrentHost 
Test-Path -Path $profile.CurrentUserAllHosts 
Test-Path -Path $profile.CurrentUserCurrentHost 

write-host "profile"
echo $profile
write-host "------------------------------------"
get-content $profile
write-host "------------------------------------"

write-host "AllUsersAllHosts" 
echo $profile.AllUsersAllHosts 
write-host "------------------------------------"
get-content $profile.AllUsersAllHosts 
write-host "------------------------------------"
write-host "AllUsersCurrentHost"
echo $profile.AllUsersCurrentHost 
write-host "------------------------------------"

get-content $profile.AllUsersCurrentHost  
write-host "------------------------------------"
write-host "Current User All Host "
echo $profile.CurrentUserAllHosts 
write-host "------------------------------------"
get-content  $profile.CurrentUserAllHosts 
write-host "------------------------------------"
Write-host "CurrentUserCurrentHost "
echo $profile.CurrentUserCurrentHost 
write-host "------------------------------------"
get-content $profile.CurrentUserCurrentHost 
write-host "------------------------------------"
