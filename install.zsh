#!/bin/zsh

# install ohmyzsh 
curl -Lo ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh ohmyzsh.sh
rm ohmyzsh.sh
rm -rf "$HOME/.oh-my-zsh/custom/"
ln -sfn "$HOME/dotfiles/config/zsh" "$HOME/.oh-my-zsh/custom"
mkdir -p "$HOME/.oh-my-zsh/custom/themes/"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
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
