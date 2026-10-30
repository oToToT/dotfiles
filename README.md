My dotfiles
===========

## Includes ##

- [Pwngdb](https://github.com/scwuaptx/Pwngdb)
- [GEF](https://github.com/hugsy/gef)
- [fish](https://github.com/fish-shell/fish-shell/) config
    - [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
- [zsh](https://www.zsh.org/) config
    - [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [vim](https://www.vim.org/) config
    - [vim-plug](https://github.com/junegunn/vim-plug)
- [tmux](https://github.com/tmux/tmux) config
    - [tpm](https://github.com/tmux-plugins/tpm)
- [screen](https://www.gnu.org/software/screen/) config
- [mpv](https://mpv.io/) config
    - [uosc](https://github.com/tomasklaen/uosc)
    - [thumbfast](https://github.com/po5/thumbfast)

... and more

## Install ##

1. `git clone --recurse-submodules -j8 https://github.com/oToToT/dotfiles ~/dotfiles`
2. `cd ~/dotfiles`
3. Run `./install.sh` and pick the packages you want from the menu  
   (or `./install.sh nvim mpv` for specific ones, `./install.sh --all` for everything)
4. For [tpm](https://github.com/tmux-plugins/tpm), please press `prefix` + <kbd>I</kbd> (capital i, as in Install) to fetch the plugin.
5. Enjoy !!

## Customize ##
* zsh
    You could put your own config as what ohmyzsh recommend.
* fish
    You could do what omf suggest you, some custom config inside this repo may broken, lol.
