#!/bin/bash
# install ohmyzsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sfn "$HOME/dotfiles/config/zsh" "$HOME/.config/zsh"
ln -sfn "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
# setup tmux
ln -sfn "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
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
