if (!(Test-Path ~\scoop)) {
    Write-Host "Scoop is not installed. Installing now..."
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
} else {
    Write-Host "Scoop is already installed. Continuing..."
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
    Write-Host "11. Exit"
}

function Execute-Option {
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
            Write-Host "Out of date until scoop accepts my pull request. Installing Anyways.."
            scoop bucket add extras
            scoop install extras/thorium
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
            Write-Host "Mercury not on scoop yet. Try Another."
        }
        10 {
            Write-Host "You selected Github Desktop. Installing"
            scoop bucket add extras
            scoop install extras/github
        }
        11 {
            Write-Host "Exiting.."
            exit
        }
        default {
            Write-Host "Invalid option. Please select a valid option."
        }
    }
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Enter the number of your choice"

    if ($choice -match '^\d+$') {
        Execute-Option -choice $choice
    }
    else {
        Write-Host "Invalid input. Please enter a number."
    }

    Read-Host "Press Enter to continue..."
}