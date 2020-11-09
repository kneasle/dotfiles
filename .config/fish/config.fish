set PATH ~/bin/node-v12.18.2-linux-x64/bin ~/complib-build /usr/lib/dart/bin ~/bin/dart-sass $PATH

# ===== FUNCTIONS AND ALIASES =====
# Shorthand to make and move into a directory
function mcd 
    mkdir $argv
    cd $argv
end

# Alias for generating random passwords
alias new_pwd="pwgen -Ays 16 5 -C1"

# Load environment vars for project directories
source ~/documents/dirs.fish
