function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    echo '        __  ___________  ________ '
    echo '       |  \/  |  _  |  \/  |  _  |'
    echo '       | .  . | | | | .  . | | | |'
    echo '       | |\/| | | | | |\/| | | | |'
    echo '       | |  | \ \_/ / |  | \ \_/ /'
    echo '       \_|  |_/\___/\_|  |_/\___/ '
    set_color normal
    fastfetch
end
