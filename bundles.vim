" VUNDLE {
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'evidens/vim-twig'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'glts/vim-textobj-comment'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'tpope/vim-commentary'
Plugin 'tommcdo/vim-exchange'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'scottmcginness/vim-jquery'
Plugin 'thinca/vim-textobj-between'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-fold'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-indent'
Plugin 'beloglazov/vim-textobj-quotes'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-niceblock'
Plugin 'kana/vim-textobj-underscore'
Plugin 'kana/vim-smartword'
Plugin 'Julian/vim-textobj-brace'
Plugin 'Raimondi/delimitMate'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'danro/rename.vim'
Plugin 'alvan/vim-php-manual'
Plugin 'airblade/vim-rooter'
Plugin 'sjl/gundo.vim.git'
Plugin 'bronson/vim-visual-star-search'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-unimpaired'
Plugin 'ap/vim-css-color'
" Plugin 'xolox/vim-easytags'
" Plugin 'xolox/vim-misc'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'sickill/vim-pasta'
Plugin 'vim-scripts/indexer.tar.gz.git'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'szw/vim-ctrlspace'
Plugin 'vim-scripts/mru.vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/vimproc.vim.git'
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'idanarye/vim-merginal.git'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'vim-scripts/YankRing.vim'

call vundle#end()
filetype plugin indent on
" }

" DISABLE PLUGINS {
    let g:phpcomplete = 1
    " let g:phpcomplete_extended = 1
    " let g:eclim = 1

    if !exists('g:eclim')
        let g:EclimDisable = 1
    endif
" }
