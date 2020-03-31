#!/usr/bin/fish

function install
    # log command (works in  3.1b1 and above)
    set -l fish_trace 1

    # install omf
    curl -L https://get.oh-my.fish > install
    fish install --path=~/.local/share/omf --config=~/.config/omf --yes --noninteractive
    rm install

    # copy omf config
    mkdir -p "$HOME/.config/"
    ln -sfn "$HOME/dotfiles/config/fish" "$HOME/.config/fish"
    
    # setup tmux
    ln -sfn "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
    # install tpm for tmux
    mkdir -p "$HOME/.tmux/plugins/"
    ln -sfn "$HOME/dotfiles/tpm" "$HOME/.tmux/plugins/tpm"

    # setup screen
    ln -sfn "$HOME/dotfiles/screenrc" "$HOME/.screenrc"

    # install gdb stuff
    ln -sfn "$HOME/dotfiles/Pwngdb" "$HOME/pwngdb"
    ln -sfn "$HOME/dotfiles/peda" "$HOME/peda"
    ln -sfn "$HOME/dotfiles/gdbinit" "$HOME/.gdbinit"
    
    # install git stuff
    ln -sfn "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
    
    # install vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sfn "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
    vim +PlugInstall +qa
end

install
