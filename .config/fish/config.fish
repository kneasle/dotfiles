set PATH ~/bin/node-v12.18.2-linux-x64/bin ~/complib-build /usr/lib/dart/bin ~/bin/dart-sass $PATH
set PATH ~/.local/bin/ $PATH
set PATH ~/.cargo/bin/ $PATH

set RUSTFLAGS "-C target-cpu=native"

# ===== FUNCTIONS AND ALIASES =====
# Shorthand to make and move into a directory
function mcd 
    mkdir -p $argv
    cd $argv
end

# Function which searches for merge conflict markers
function merge-conf
    rg "^(<<<<<<<|>>>>>>>|=======)"
end

# Function for word counting LaTeX files
function texwc
    detex $argv | sed "s/[^a-zA-Z ]//g" | wc -w
end

# Alias for generating random passwords
alias new-pwd="pwgen -cys 16 5 -C1"

# Alias for copying and pasting
alias copy="xclip -selection c"

# Alias for handling herbstlustwm
alias hc="herbstclient"

# Load environment vars for project directories
if test -e ~/.per-device-config.fish
    source ~/.per-device-config.fish
end
