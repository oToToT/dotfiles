#!/usr/bin/fish

# install fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf --yes --noninteractive
rm install
ln -sfn "$HOME/dotfiles/config" "$HOME/.config"
# setup tmux
ln -sfn "$HOME/dotfiles/tmux.conf" "$HOME/tmux.conf"
mkdir -p "$HOME/.tmux/plugins/"
ln -sfn "$HOME/dotfiles/tpm" "$HOME/.tmux/plugins/tpm"
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
