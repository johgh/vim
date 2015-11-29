# My Vim Setup
This repository contains my Vim config with plugins (that I use as a PHP IDE).

## Quick installation

1. [Download](https://raw.githubusercontent.com/johgh/scripts/master/vim_setup.sh) and execute this shell script
2. Enjoy!

(3.) Read quick reference about the plugins I use [here](http://cheat-sheets.tk/vim/)

## Manual installation

### Download .vim dir & symlink .vimrc
```
cd ~

# clean Vim files
rm -Rf .vim .vimrc .viminfo .vimbackup .vimswap .vimundo .vimviews

# get .vim dir and submodules
git clone https://github.com/johgh/vim .vim
git submodule update --init --recursive
# or
git clone --recursive https://github.com/johgh/vim .vim

# symlink .vimrc to $HOME
ln -s $HOME/.vim/.vimrc .
```

### Vim 7.4.X Installation (Required By YCM plugin for "silent" completion)
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
UBUNTU_VERSION_HERE => Elementary 'Luna' is based on Ubuntu 'Precise'

### Install the "silversearcher" (required by Ag plugin)
```
sudo apt-get install silversearcher-ag
```

### Install and configure PHPCodeSniffer (PSR2 support)
```
sudo apt-get install php-codesniffer
```

On file /etc/php-codesniffer/CodeSniffer.conf put this:
```
<?php
$phpCodeSnifferConfig = array (
        'default_standard' => 'PSR2',
        )
?>
```

### Powerline Fonts Install
```
git clone https://github.com/powerline/fonts
cd fonts
./install
```

### Ycm Plugin Installation
```
# Vim 7.3.584 with python2 support required
# e.g.: https://launchpad.net/~kalakris/+archive/ubuntu/vim

# add submodule and install recursive dependencies
git submodule add https://github.com/Valloric/YouCompleteMe
git submodule update --init --recursive

# install build packages and compile
# (repeat this step if some YCM update requires it in the future)
sudo apt-get install build-essential cmake python-dev
./install.sh
```
### Wmctrl Installation
```
sudo apt-get install wmctrl
```

## Submodules management (with Git and Pathogen)

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

## Why do I use Vim?
[The answer (in spanish)](http://cheat-sheets.tk/Vim-incomprendido/)

