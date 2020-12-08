# Run the standard key-bindings, such as remapping right control
echo "===== running xmodmap non-emoji config ====="
xmodmap ~/.Xmodmap

# Compile the emoji map into a temp file and execute that with xmodmap
echo "===== compiling xmodmap emoji config ====="
~/.config/emoji/emoji-mod.py ~/.config/emoji/emoji.conf > /tmp/xmodmap-emoji
echo "===== running xmodmap emoji config ====="
xmodmap /tmp/xmodmap-emoji
