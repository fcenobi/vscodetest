Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.zip -UseBasicParsing
Expand-Archive Ubuntu.zip C:\Distros\Ubuntu
cd C:\Distros\Ubuntu
.\ubuntu.exe
