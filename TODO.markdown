# pending
* ver para que sirve c-u de bram
* autocompletar fail (da error 'returned bad value to YCM' mirar quitar silenciado para leer) -> no se ha sabido pq falló

# regexes
\<WORD\>
\$\_POST\[(.*)\]     -->    \$this\-\>request\-\>get\_POST(\1)
\$data\['([^]]*)'\]      -->    \$\1
:%s/\$_POST\[\([^]]*\)\]/\$this\-\>request\-\>get\_POST\(\1\)/gc

### NOTAS
* http://whileimautomaton.net/2008/11/vimm3/operator:
```
Forcing *wise (advanced)
You can force *wise with the following keys:
v - characterwise
V - linewise
<C-v> - blockwise
Usage: {operator}{*wise-specifier}{motion}
dvj - characterwise
dVj - linewise
d<C-v>j - blockwise
```
### IDEAS PARA MAPEOS

### listado plugins (tb ver vimawesome.com)
#### Javascript
* https://github.com/elzr/vim-json
* https://github.com/groenewege/vim-less
* https://github.com/pangloss/vim-javascript
* https://github.com/briancollins/vim-jst
* https://github.com/kchmck/vim-coffee-script

#### HTML
* https://github.com/amirh/HTML-AutoCloseTag
* https://github.com/hail2u/vim-css3-syntax
* https://github.com/gorodinskiy/vim-coloresque
* https://github.com/tpope/vim-haml
* https://github.com/tomtom/tlib_vim

* https://github.com/flazz/vim-colorschemes
* https://github.com/gmarik/vundle
* https://github.com/kana/vim-smartinput/blob/master/doc/smartinput.txt
* http://www.vim.org/scripts/script.php?script_id=2470
* http://kana.github.io/config/vim/textobj-indent.html
* https://github.com/kana/vim-repeat
* https://github.com/kana/vim-surround/blob/master/doc/surround.txt

#### from SPF13 dist
* https://github.com/mbbill/undotree
* https://github.com/Lokaltog/vim-easymotion
* https://github.com/vim-scripts/restore_view.vim
* https://github.com/garbas/vim-snipmate
* https://github.com/spf13/PIV
* https://github.com/arnaud-lb/vim-php-namespace
* https://github.com/mileszs/ack.vim
* https://github.com/mileszs/ack.vim
* https://github.com/mileszs/ack.vim
* https://github.com/spf13/vim-colors
* https://github.com/spf13/vim-autoclose
* https://github.com/kien/ctrlp.vim
* https://github.com/terryma/vim-multiple-cursors
* https://github.com/Lokaltog/powerline
* https://github.com/Lokaltog/vim-powerline
* https://github.com/bling/vim-bufferline
* https://github.com/godlygeek/csapprox
* https://github.com/jistr/vim-nerdtree-tabs
* https://github.com/mhinz/vim-signify
* https://github.com/tpope/vim-abolish.git
* https://github.com/osyo-manga/vim-over
* https://github.com/mattn/webapi-vim
* https://github.com/mattn/gist-vim
* https://github.com/scrooloose/nerdcommenter
* https://github.com/godlygeek/tabular
* https://github.com/honza/vim-snippets
* https://github.com/Valloric/YouCompleteMe
* https://github.com/SirVer/ultisnips
* https://github.com/honza/vim-snippets
* https://github.com/Shougo/neocomplcache
* https://github.com/Shougo/neosnippet
* https://github.com/Shougo/neosnippet-snippets
* https://github.com/honza/vim-snippets
* https://github.com/Shougo/neocomplete.vim.git
* https://github.com/Shougo/neosnippet
* https://github.com/Shougo/neosnippet-snippets
* https://github.com/honza/vim-snippets
* https://github.com/klen/python-mode
* https://github.com/python.vim
* https://github.com/python_match.vim
* https://github.com/pythoncomplete
* https://github.com/tpope/vim-markdown
* https://github.com/spf13/vim-preview
* https://github.com/tpope/vim-cucumber
* https://github.com/quentindecock/vim-cucumber-align-pipes
* https://github.com/Puppet-Syntax-Highlighting
