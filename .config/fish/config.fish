if status is-interactive
    # Commands to run in interactive sessions can go here
	
    #Variables
    set -gx VISUAL nvim
    set -gx EDITOR nvim
    set -gx BROWSER firefox
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh

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
    abbr ga  "git add"
    abbr gl  "git log"
    abbr gst "git status"
    abbr gd  "git diff"

    #Setting up zoxide
    zoxide init fish | source
end
