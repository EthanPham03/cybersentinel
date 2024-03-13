# Script Name:                 project.ps1
# Author:                      Cody Blahnik
# Date of latest revision:     3/12/2024
# Purpose:                     This creates a new User and assigns the user to a group.
# Execution:                   Individual commands in PowerShell or using "powershell -File"
# Resources:                   https://chat.openai.com/share/4fea9f21-4b04-4f43-a7f0-bd9e1e070fce


# Script Name:                 project.ps1
# Author:                      Cody Blahnik
# Date of latest revision:     3/12/2024
# Purpose:                     This creates a new User and assigns the user to a group.
# Execution:                   Individual commands in PowerShell or using "powershell -File"
# Resources:                   https://chat.openai.com/share/4fea9f21-4b04-4f43-a7f0-bd9e1e070fce

# Prompt user for the desired username
$username = Read-Host "Enter the desired username for the new user"

# Prompt user for the desired password (masked)
$password = Read-Host "Enter the initial password for $username" -AsSecureString


# This line creats a new user with the credintails provided by the variables we set
New-LocalUser -Name $username -Password $password -PasswordNeverExpires:$true -UserMayNotChangePassword:$false

# Add the user straight to the users group
 Add-LocalGroupMember -Group "Users" -Member $username

# This displays a message for the person who is running the script! 
Write-Output "User account created for $username"