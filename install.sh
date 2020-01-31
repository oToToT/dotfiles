#!/bin/bash
# install ohmyzsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s "$HOME/dotfiles/config/zsh" "$HOME/.config/zsh"
ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
# setup tmux
ln -s "$HOME/dotfiles/tmux.conf" "$HOME/tmux.conf"
# install gdb stuff
ln -s "$HOME/dotfiles/Pwngdb" "$HOME/pwngdb"
ln -s "$HOME/dotfiles/peda" "$HOME/peda"
ln -s "$HOME/dotfiles/gdbinit" "$HOME/.gdbinit"
# install git stuff
ln -s "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
# install vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
vim +PlugInstall +qa
