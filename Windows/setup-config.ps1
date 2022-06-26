setx HOME $env:USERPROFILE
New-Item -Path $env:HOME\AppData\Local\nvim -ItemType Junction -Value $env:HOME\dev\Config\nvim

[string]$PROFILE_DIRECTORY = Split-Path $PROFILE
New-Item -ItemType Directory -Path $PROFILE_DIRECTORY -Force
New-Item -Path $PROFILE -ItemType HardLink -Value $env:HOME\dev\Config\Windows\PowerShell_profile.ps1
New-Item -Path $env:HOME\.config\starship.toml -ItemType HardLink -Value $env:HOME\dev\Config\starship.toml
