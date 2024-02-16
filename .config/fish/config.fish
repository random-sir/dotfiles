if status is-interactive
    # Commands to run in interactive sessions can go here
    
    #Variables
    set VISUAL nvim
    set BROWSER firefox

    #Pacman abbreviations
    abbr pi "sudo pacman -S"
    abbr pu "sudo pacman -Syu"
    abbr pd "sudo pacman -Rs"
    abbr pq "pacman -Q"
    abbr pf "pacman -F /usr/bin/"

    #Git abbreviations
    abbr gco "git checkout"
    abbr gcm "git checkout master"
    abbr gca "git commit -a"
    abbr gl "git log"

    #Setting up zoxide
    zoxide init fish | source
end
