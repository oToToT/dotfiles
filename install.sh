#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# name|description|selected by default
PACKAGES=(
    "fish|fish config + oh-my-fish|off"
    "zsh|zsh config + ohmyzsh + powerlevel10k|off"
    "tmux|tmux config + tpm|on"
    "screen|screen config|on"
    "gdb|gdb config + GEF + Pwngdb|on"
    "git|git config|on"
    "vim|vim config + vim-plug|on"
    "nvim|neovim config|on"
    "mpv|mpv config + uosc + thumbfast|on"
)

link() {
    mkdir -p "$(dirname "$2")"
    ln -sfn "$DOTFILES/$1" "$2"
}

install_fish() {
    local tmp
    tmp="$(mktemp)"
    curl -fL https://get.oh-my.fish > "$tmp"
    fish "$tmp" --path=~/.local/share/omf --config=~/.config/omf --yes --noninteractive
    rm "$tmp"
    link config/fish "$HOME/.config/fish"
}

install_zsh() {
    local tmp
    tmp="$(mktemp)"
    curl -fLo "$tmp" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    RUNZSH=no sh "$tmp"
    rm "$tmp"
    rm -rf "$HOME/.oh-my-zsh/custom/"
    link config/zsh "$HOME/.oh-my-zsh/custom"
    link zshrc "$HOME/.zshrc"
    link p10k.zsh "$HOME/.p10k.zsh"
    local p10k="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
    [[ -d "$p10k" ]] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k"
}

install_tmux() {
    link tmux.conf "$HOME/.tmux.conf"
    link tpm "$HOME/.tmux/plugins/tpm"
}

install_screen() {
    link screenrc "$HOME/.screenrc"
}

install_gdb() {
    mkdir -p "$HOME/.gdb/"
    curl -fsSLo "$HOME/.gdb/gef.py" http://gef.blah.cat/py
    link Pwngdb "$HOME/.gdb/pwngdb"
    link gdbinit "$HOME/.gdbinit"
}

install_git() {
    link gitconfig "$HOME/.gitconfig"
}

install_vim() {
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    link vimrc "$HOME/.vimrc"
    vim +PlugInstall +qa
}

install_nvim() {
    link config/nvim "$HOME/.config/nvim"
}

install_mpv() {
    link config/mpv "$HOME/.config/mpv"
    # pin the target dir: also skips the installer's Linux/macOS-only check
    MPV_CONFIG_DIR="$HOME/.config/mpv" \
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)"
    curl -fLo "$HOME/.config/mpv/scripts/thumbfast.lua" --create-dirs \
        https://raw.githubusercontent.com/po5/thumbfast/master/thumbfast.lua
}

select_packages() {
    local entry name desc default
    if command -v whiptail > /dev/null; then
        local args=()
        for entry in "${PACKAGES[@]}"; do
            IFS='|' read -r name desc default <<< "$entry"
            args+=("$name" "$desc" "$default")
        done
        whiptail --title "dotfiles" --separate-output \
            --checklist "Select packages to install (space to toggle):" \
            20 70 "${#PACKAGES[@]}" "${args[@]}" 3>&1 1>&2 2>&3
    else
        local answer
        for entry in "${PACKAGES[@]}"; do
            IFS='|' read -r name desc default <<< "$entry"
            read -rp "Install $name ($desc)? [$([[ $default == on ]] && echo Y/n || echo y/N)] " answer < /dev/tty
            answer="${answer:-$([[ $default == on ]] && echo y || echo n)}"
            if [[ "$answer" == [yY]* ]]; then echo "$name"; fi
        done
    fi
}

usage() {
    cat <<EOF
Usage: $0 [--all | --list | --help | PACKAGE...]

  (no arguments)  pick packages from a menu
  PACKAGE...      install the given packages only, e.g. \`$0 nvim mpv\`
  --all           install every package
  --list          list available packages
  --help          show this help
EOF
}

list_packages() {
    local entry name desc default
    for entry in "${PACKAGES[@]}"; do
        IFS='|' read -r name desc default <<< "$entry"
        printf '%-8s %s%s\n' "$name" "$desc" "$([[ $default == on ]] && echo ' (default)')"
    done
}

main() {
    local selected=() entry name
    case "${1:-}" in
        -h|--help) usage; exit 0 ;;
        -l|--list) list_packages; exit 0 ;;
        --all)
            for entry in "${PACKAGES[@]}"; do selected+=("${entry%%|*}"); done
            ;;
        -*) usage >&2; exit 1 ;;
        "")
            local choice
            choice="$(select_packages)" || { echo "Cancelled."; exit 1; }
            # no mapfile: macOS still ships bash 3.2
            while IFS= read -r name; do
                if [[ -n "$name" ]]; then selected+=("$name"); fi
            done <<< "$choice"
            ;;
        *) selected=("$@") ;;
    esac

    if (( ${#selected[@]} == 0 )); then
        echo "Nothing selected."
        exit 0
    fi

    for name in "${selected[@]}"; do
        if ! declare -F "install_$name" > /dev/null; then
            echo "Unknown package: $name" >&2
            exit 1
        fi
    done

    for name in "${selected[@]}"; do
        echo "==> Installing $name"
        "install_$name"
    done

    echo "Done."
}

main "$@"
