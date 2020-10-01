if $Primavolta 
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile WSLUpdate.msi -UseBasicParsing
msiexec.exe /package WSLUpdate.msi /quiet
wsl --set-default-version 2

mkdir -p $env:userprofile/Ubuntu/Focal/Ubuntu-20.04
Invoke-WebRequest -Uri https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-wsl.rootfs.tar.gz -OutFile $env:userprofile/Ubuntu/Focal/Ubuntu-20.04.tar.gz -UseBasicParsing
wsl --import Ubuntu-20.04 $env:userprofile/Ubuntu/Focal/Ubuntu-20.04 $env:userprofile/Ubuntu/Focal/Ubuntu-20.04.tar.gz
List Distributions
wsl --list --all
wsl --setdefault Ubuntu-20.04
wsl --list --all
 Ubuntu-20.04
ubuntu2004.exe config --root

#disable beep
echo 'set bell-style none' >> ~/.inputrc

wsl -- apt-get update
wsl -- apt-get upgrade
wsl -- apt-get install -y net-tools


touch ~/.mount_aliases
chmod +x ~/.mount_aliases
echo #!/bin/bash > ~/.mount_aliases

mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  tolower($1) "=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  tolower($1) ":=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  $1 "=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  $1 ":=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
. ~/.mount_aliases

