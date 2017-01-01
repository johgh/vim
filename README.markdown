# NeoVim Setup
This repository contains my Vim config with plugins (that I use as a PHP IDE).

## Manual installation

### Install LinuxBrew
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
// add to .zshrc
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

source ~/.zshrc

### Install NeoVim
brew install neovim/neovim/neovim

### Symlink vim install
ln -s ~/.vim ~/.config/nvim                                                                                                                                
ln -s ~/.vimrc ~/.config/nvim/init.vim                                                                                                                     

### Enjoy
nvim
