set PATH ~/bin/node-v12.18.2-linux-x64/bin ~/complib-build /usr/lib/dart/bin ~/bin/dart-sass $PATH

# ===== FUNCTIONS AND ALIASES =====
# Shorthand to make and move into a directory
function mcd 
    mkdir $argv
    cd $argv
end

# Alias for generating random passwords
alias new-pwd="pwgen -cys 16 5 -C1"

# Alias for copying and pasting
alias xclip="xclip -selection c"

# Alias for handling herbstlustwm
alias hc="herbstclient"

# Load environment vars for project directories
source ~/documents/dirs.fish
