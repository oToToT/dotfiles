set -gx FFSEND_HOST https://send.dve.tw/
set -gx VISUAL vim
set -gx EDITOR "$VISUAL"
set -gx PULSE_SERVER tcp:127.0.0.1
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
set -gx LANG zh_TW.UTF-8
set -gx LANGUAGE zh_TW.UTF-8
set -gx LC_ALL zh_TW.UTF-8
set -gx GPG_TTY (tty)
for f in ~/.config/fish/envs/*.fish
    source $f
end
for f in ~/.config/fish/functions/*.fish
    source $f
end
#source ~/.cargo/env
