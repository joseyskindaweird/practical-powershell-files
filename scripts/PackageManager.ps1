if (!(Test-Path ~\scoop)) {
    Write-Host "Scoop is not installed. Installing now..."
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
} else {
    Write-Host "Scoop is already installed. Continuing..."
}

if (!(Test-Path ~\chocolatey)) {
    Write-Host "Chocolatey is not installed. Installing now..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is already installed. Continuing..."
}

function Show-Menu {
    Clear-Host
    Write-Host "Select an option:"
    Write-Host "1. Discord"
    Write-Host "2. Spotify"
    Write-Host "3. LibreOffice"
    Write-Host "4. Thorium"
    Write-Host "5. Steam"
    Write-Host "6. Retroarch"
    Write-Host "7. CPU-Z"
    Write-Host "8. VSCodium"
    Write-Host "9. Mercury"
    Write-Host "10. Github Desktop"
    Write-Host "11. Brave"
    Write-Host "12. Google Chrome"
    Write-Host "13. Chromium"
    Write-Host "14. Firefox"
    Write-Host "15. KDE Connect"
    Write-Host "16. qBittorent"
    Write-Host "17. RustDesk"
    Write-Host "18. Spicetify"
    Write-Host "19. GIMP"
    Write-Host "20. Filezilla"
    Write-Host "21. Handbrake"
    Write-Host "22. Java"
    Write-Host "23. Neovim"
    Write-Host "24. Kodi"
    Write-Host "25. OBS"
    Write-Host "26. Exit"
}

function Invoke-Option {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 {
            Write-Host "You selected Discord. Installing.."
            scoop bucket add extras
            scoop install extras/discord
        }
        2 {
            Write-Host "You selected Spotify. Installing.."
            scoop bucket add extras
            scoop install extras/spotify
        }
        3 {
            Write-Host "You selected LibreOffice. Installing.."
            scoop bucket add extras
            scoop install extras/libreoffice
        }    
        4 {
            Write-Host "You selected Thorium. Installing.."
            choco install thorium
        }
        5 {
            Write-Host "You selected Steam. Installing.."
            scoop bucket add games
            scoop install games/steam
        }
        6 {
            Write-Host "You selected Retroarch. Installing.."
            scoop bucket add extras
            scoop bucket install extras/retroarch
        }
        7 {
            Write-Host "You selected CPU-Z. Installing.."
            scoop bucket add extras
            scoop install extras/cpu-z
        }
        8 {
            Write-Host "You selected VSCodium. Installing.."
            scoop bucket add extras
            scoop install extras/vscodium
        }
        9 {
            Write-Host "Still tryna firgure this out. Gimmie a sec, mkay?"
        }
        10 {
            Write-Host "You selected Github Desktop. Installing.."
            scoop bucket add extras
            scoop install extras/github
        }
        11 {
            Write-Host "You selected Brave. Installing.."
            scoop bucket add extras
            scoop install extras/brave
        }
        12 {
            Write-Host "Why? Okay..."
            scoop bucket add extras
            scoop install extras/googlechrome
        }
        13 {
            Write-Host "You Selected Chromium. Installing.."
            scoop bucket add extras
            scoop install extras/chromium
        }
        14 {
           Write-Host "You selected Firefox. Installing.."
           scoop bucket add extras
           scoop install extras/firefox
        }
        15 {
           Write-Host "You selected KDE Connect. Installing.."
           scoop bucket add extras
           scoop install extras/kdeconnect
        }
        16 {
            Write-Host "You selected qBittorent. Installing.."
            scoop bucket add extras
            scoop install extras/qbittorent
        }
        17 {
            Write-Host "You selected RustDesk. Installing.."
            scoop bucket add extras
            scoop install extras/rustdesk
        }
        18 {
            Write-Host "You selected Spicetify. Installing.."
            scoop install spicetify-cli
        }
        19 {
            Write-Host "You selected GIMP. Installing.."
            scoop bucket add extras
            scoop install extras/gimp 
        }
        20 {
            Write-Host "You selected Filezilla. Installing.."
            scoop bucket add extras
            scoop install extras/filezilla 
        }
        21 {
           Write-Host "You selected Handbrake. Installing.."
           scoop bucket add extras
           scoop install extras/handbrake 
        }
        22 {
            Write-Host "You selected Java. Installing.."
            choco install javaruntime
        }
        23 {
            Write-Host "You selected Neovim. Installing.."
            scoop install neovim 
        }
        24 {
            Write-Host "You selected Kodi. Installing.."
            scoop bucket add extras
            scoop install extras/kodi
        }
        25 {
            Write-Host "You selected OBS. Installing."
            scoop bucket add extras
            scoop install extras/obs-studio
        }
        26 {
            Write-Host "Exiting.."
            exit
        }
        default {
            Write-Host "Invalid option. Please select a valid option. >:("
        }
    }
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Enter the number of the program you want."

    if ($choice -match '^\d+$') {
        Invoke-Option -choice $choice
    }
    else {
        Write-Host "Invalid input. Please enter a number."
    }

    Read-Host "Press Enter to continue..."
}