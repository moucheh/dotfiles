#                  _          _ _                    __ _       
#  _ __  _   _ ___| |__   ___| | |   ___ ___  _ __  / _(_) __ _ 
# | '_ \| | | / __| '_ \ / _ \ | |  / __/ _ \| '_ \| |_| |/ _` |
# | | | | |_| \__ \ | | |  __/ | | | (_| (_) | | | |  _| | (_| |
# |_| |_|\__,_|___/_| |_|\___|_|_|  \___\___/|_| |_|_| |_|\__, |
#                                                         |___/ 

$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.cursor_shape.vi_insert = 'line'
$env.config.cursor_shape.vi_normal = 'block'

alias c = clear
alias ll = ls -l
alias la = ls -la
alias lg = lazygit
alias fetch = fetch -l nixos-old
alias v = nvim
alias nixvim = nix run ~/.config/nixvim

source zoxide.nu

alias cd = z

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
