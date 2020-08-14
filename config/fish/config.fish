set -gx VISUAL vim
set -gx EDITOR "$VISUAL"
set -gx DISPLAY 127.0.0.1:0
set -gx XDG_SESSION_TYPE x11
set -gx PULSE_SERVER tcp:127.0.0.1
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
set -gx LANG zh_TW.UTF-8
set -gx LANGUAGE zh_TW.UTF-8
set -gx LC_ALL zh_TW.UTF-8
source ~/.config/fish/envs/*.fish
