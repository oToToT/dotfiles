#!/bin/zsh

set -x

# install ohmyzsh 
curl -Lo ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh ohmyzsh.sh
rm ohmyzsh.sh
rm -rf "$HOME/.oh-my-zsh/custom/"
ln -sfn "$HOME/dotfiles/config/zsh" "$HOME/.oh-my-zsh/custom"
ln -sfn "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -sfn "$HOME/dotfiles/p10k.zsh" "$HOME/.p10k.zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# setup tmux
ln -sfn "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.tmux/plugins/"
ln -sfn "$HOME/dotfiles/tpm" "$HOME/.tmux/plugins/tpm"

# install screenrc
ln -sfn "$HOME/dotfiles/screenrc" "$HOME/.screenrc"

# install gdb stuff
mkdir -p "$HOME/.gdb/"
wget -O "$HOME/.gdb/gef.py" -q http://gef.blah.cat/py
ln -sfn "$HOME/dotfiles/Pwngdb" "$HOME/.gdb/pwngdb"
ln -sfn "$HOME/dotfiles/gdbinit" "$HOME/.gdbinit"

# install git stuff
ln -sfn "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"

# install vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfn "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
vim +PlugInstall +qa
