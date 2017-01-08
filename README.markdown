# Vim/NeoVim setup
This repository contains my vim/neovim config that I use as a PHP IDE.

# NeoVim Setup

## Quick installation (ppa)

[Download](https://raw.githubusercontent.com/johgh/scripts/master/nvim_setup.sh) and execute this shell script


## Manual installation (LinuxBrew)

See below 'Additional steps for manual installation'

### Install LinuxBrew
```
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
// add to .zshrc
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
source ~/.zshrc
```

### Install NeoVim from LinuxBrew
```
brew install neovim/neovim/neovim
```

### Install and symlink vim and nvim configs
```
git clone --recursive https://github.com/johgh/vim .vim
ln -s ~/.vim ~/.config/nvim
nvim +PlugInstall +qall
```

# Vim Setup

## Quick installation

[Download](https://raw.githubusercontent.com/johgh/scripts/master/vim_setup.sh) and execute this shell script

## Manual installation

See below 'Additional steps for manual installation'

### Download .vim dir & symlink .vimrc
```
cd ~

# clean Vim files
rm -Rf .vim .vimrc .viminfo .vimbackup .vimswap .vimundo .vimviews

# get .vim dir
git clone --recursive https://github.com/johgh/vim .vim

# install plugins from command line
vim -E -u NONE -S ~/.vim/bundles.vim +PluginInstall +qall

# symlink .vimrc to $HOME
ln -s $HOME/.vim/.vimrc .
```

# Additional steps for manual installation

## Vim 7.4.X Installation (Required By YCM plugin for "silent" completion)
```
# purge current vim version (if any)
sudo apt-get purge vim-*

# add this repo
echo 'deb http://ppa.launchpad.net/pkg-vim/vim-daily/ubuntu UBUNTU_VERSION_HERE main' | sudo tee -a  /etc/apt/sources.list
# or this other one
echo 'deb http://ppa.launchpad.net/pi-rho/dev/ubuntu UBUNTU_VERSION_HERE main' | sudo tee -a  /etc/apt/sources.list

# update and install gvim
sudo apt-get update && sudo apt-get install vim vim-gnome
```

## Install the "silversearcher" (required by Ag plugin)
```
sudo apt-get install silversearcher-ag
```

## Install and configure PHPCodeSniffer (required by Syntastic plugin)
```
sudo apt-get install php-codesniffer
```

On file /etc/php-codesniffer/CodeSniffer.conf put this for PSR2 support (PHP code style standard):
```
<?php
$phpCodeSnifferConfig = array (
        'default_standard' => 'PSR2',
        )
?>
```

## Nerd-fonts Install
```
cp -R ~/.vim/fonts/* ~/.local/share/fonts
fc-cache -f ~/.local/share/fonts
```

## Ycm Plugin Installation
```
# Vim 7.3.584 with python2 support required
# e.g.: https://launchpad.net/~kalakris/+archive/ubuntu/vim

# install with Vundle

# install build packages and compile
# (repeat this step if some YCM update requires it in the future)
sudo apt-get install build-essential cmake python-dev
$HOME/.vim/bundle/YouCompleteMe/install.sh
```
## Wmctrl Installation
```
sudo apt-get install wmctrl
```

## OLD bundles management (with Git and Pathogen)

### Setup Pathogen
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# put these on .vimrc
execute pathogen#infect()
call pathogen#helptags()
syntax enable
filetype plugin indent on
```

### Add Plugins as git submodules
```
git submodule add <github url>
```
* Add 'ignore = dirty' on your .gitmodules file for submodules that generate internal files
 

### Update Config (to main repository)
```
cd ~/.vim
# update repository files
git pull
# update submodules
git submodule update --init --recursive

# pull in the changes from main repo and submodules (same as the 2 above)
git pull --recurse-submodules
```

### Upgrade Config (on main repository)
```
# upgrade specific plugin
cd bundle/<plugin>
git pull origin master

# upgrade all plugins
git submodule foreach git pull origin master
```

### Remove Submodule
```
# delete the relevant section from the .gitmodules file at the root of the parent project
git add .gitmodules
# delete the relevant section from the config file located in the .git directory at the root of the project
git rm --cached path/to/submodule
rm -rf .git/modules/submodule_name
git commit -m "Removed <vendor> submodule." # only necessary if submodule was comitted
rm -rf path/to/submodule
```

## Eclipse (Kepler) and Eclim installation
- Download third party software
```
$ cd ~
$ git clone https://github.com/johgh/thirdparty
```

- [Download](http://eclipse.org/downloads/packages/eclipse-standard-432/keplersr2) and install Eclipse Kepler

- Install PDT on Eclipse: Open Eclipse and go to `Help` > `Install New Software...` > `Add...` > `Archive...` >
and select `pdt-Update-3.2.0.201306051924.zip` file from thirdparty repository

- Install Eclim into Eclipse
```
$ cd thirdparty/
$ java -Dvim.skip=true -Declipse.home=/opt/eclipse -jar eclim_2.3.4.jar install
```
> Check if PDT feature is installed on eclim startup, if not, reinstall in GUI mode (double click .jar file) then select 'do not install Vim files' and install pdt features when asked
