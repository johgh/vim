set nocompatible

" load plugins
silent! runtime bundles.vim

" core stuff
source ~/.vim/vimrc_core

" COLORSCHEME/LAYOUT {
    " GVIM {
        set guioptions-=T
        set guioptions-=m
        " set guioptions+=l
        " set guioptions-=r
    " }

    " highlight cursor line
    set cursorline

    if has('gui_running')
        colorscheme gruvbox
        let hour = strftime("%H")
        if hour >= 8 && hour < 19
            " set background=light
            set background=dark
        else
            set background=dark
        endif
        " set guifont=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 11
        set guifont=Sauce\ Code\ Pro\ 10.5
        " set less linespace is a must for source code pro font
        set lsp=-2
        " hide mouse when typing
        set mousehide
    else
        se t_Co=256
        colorscheme gruvbox
        set background=dark
    endif

" }

" GENERAL SETTINGS {
    set title
    set titlestring=%F\ %a%r%m

    syntax enable
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    nmap <RightMouse> <LeftMouse>"uyiwh/u<CR>
    vmap <RightMouse> *N
    " vmap <MiddleMouse> <C-n>

    " CLIPBOARD {
        " unnamed plus register set to default register instead of " register
        set clipboard=unnamedplus

        " :Gstatus uses the preview window
        set previewheight=20

        " paste yanked text multiple times in visual mode (trick lost -> exchange)
        vnoremap p pgvy

        " paste correctly indented on same line
        map <a-P> V<a-p>

        " don't save in default register when executing a 'c' command
        " nnoremap c "_c

        " paste default register in insert mode and command mode
        inoremap <C-v> <C-r>+
        cnoremap <C-v> <C-r>+

        " easy yank appending with 'gy'
        nnoremap <silent> gy :let @u=@+<CR>"Uyy:let @+=@u<CR>
        vnoremap <silent> gy :normal gy<CR>

        " swap unnamed register with alt "yank register" @p
        " nnoremap <F11> :let @u=@+ \| let @+=@p \| let @p=@u <CR>

    " }
" }

" MAPPINGS {
    " INIT
    " fix gnome terminal problem with alt keys (a-z only)
    set esckeys
    let c='a'
    while c <= 'z'
        exec "set <A-".c.">=\e".c
        exec "imap \e".c." <A-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
    set ttimeout ttimeoutlen=50


    " NORMAL MODE COMMANDS
    " add indented blank line and leave insert mode
    nnoremap <A-o> o<esc>
    nnoremap <A-O> O<esc>
    inoremap <A-o> <esc>o<esc>
    inoremap <A-O> <esc>O<esc>
    " set uppercase word (insert/visual/normal)
    inoremap <A-u> <C-O>b<C-O>gUiw<C-O>e<C-O>a
    vmap <A-u> gU
    nmap <A-u> gUiw

    " INSERT MODE NAVIGATION
    imap <A-h> <C-left>
    imap <A-l> <C-right>
    imap <A-b> <C-left>
    imap <A-f> <C-right>
    imap <A-d> <ESC><SPACE>cw
    imap <C-e> <C-o>A
    imap <C-b> <C-o>I
    imap <C-k> <C-o>D

    " COMMMAND LINE NAVIGATION
    cnoremap <C-b>  <Home>
    cnoremap <C-e>  <End>
    cnoremap <M-j>  <Left>
    cnoremap <M-k>  <Right>
    cnoremap <M-b>  <S-Left>
    cnoremap <M-f>  <S-Right>
    cnoremap <C-k>  <S-right><C-w>

    " Remap [ and ] for easy typing
    nmap <A-h>  [
    nmap <A-l>  ]
    omap <A-h>  [
    omap <A-l>  ]
    xmap <A-h>  [
    xmap <A-l>  ]

    " Close all other windows
    nmap <silent> <leader>o :only<CR>
    " Close all other windows keeping panes open (eclim util)
    nmap <silent> <leader>O :Only<CR>
    " Close tip window

    " Restart Vim
    " nmap <C-c> :w<CR>:RestartVim<CR>

    " INSERT MODE
    " substitute from VERY start of line (unlike cc)
    nmap S 0C

    nnoremap <A-o> o<space><BS><esc>
    nnoremap <A-O> O<space><BS><esc>
    inoremap <A-o> <esc>o<space><BS><esc>
    inoremap <A-O> <esc>O<space><BS><esc>

    " avoid autoclean lines (eclipse-like), and don't save in default register with cc
    inoremap <CR> <CR><space><BS>
    " nnoremap cc "_cc<space><BS>
    " nnoremap C "_C<space><BS>

    " delete in insert mode (only works in gvim)
    inoremap <C-BS> <delete>

    " smartwords mappings
    " noremap ÷ w
    map × <Plug>(smartword-w)
    " noremap â b
    map Â <Plug>(smartword-b)
    map <silent> ÷ <Plug>CamelCaseMotion_w
    map <silent> â <Plug>CamelCaseMotion_b
    " map <Leader><Leader>e <Plug>(smartword-e)
    " map <Leader><Leader>ge <Plug>(smartword-ge)

    cnoremap <expr> ~~ getcmdtype() == ':' ? expand('%:h').'/' : '~~'
    cnoremap <expr> ~ getcmdtype() == ':' ? expand('~').'/' : '~'

    inoremap {} {<CR>}<C-o>O

    inoremap {% {%<space><space>%}<left><left><left>
    " } workaround to force matching of braces
    inoremap {{ {{<space><space>}}<left><left><left>
    " }} workaround to force matching of braces

    " autocompletion
    " inoremap <C-p> <C-X><C-O>
    " imap <C-CR> -><C-space>
    imap <C-CR> ->
" }

" AUTOCOMMANDS {
    augroup my_group
        autocmd!
        " maximize at startup
        autocmd GUIEnter * call system("wmctrl -ir " . v:windowid . " -b add,maximized_vert,maximized_horz")
        " hybrid numbers normal mode / no relative insert mode
        " autocmd InsertEnter * set number|set norelativenumber
        " autocmd InsertLeave * set relativenumber

        " documentor
        autocmd BufRead,BufNewFile *.php nnoremap <buffer> <Leader>c :call pdv#DocumentWithSnip()<CR>

        autocmd FileType php autocmd BufWritePre <buffer> call StripWhitespace('keep_whitespace_only_lines')
        autocmd FileType vim autocmd BufWritePre <buffer> call StripWhitespace('strip_only_space_only_lines')
        autocmd FileType sh autocmd BufWritePre <buffer> call StripWhitespace('all')
        autocmd BufRead,BufNewFile *.html.twig set textwidth=0
        autocmd BufRead,BufNewFile *.markdown set wrap linebreak nolist textwidth=0 nonumber
        autocmd BufRead,BufNewFile *.md set wrap linebreak nolist textwidth=0 nonumber
        autocmd BufRead,BufNewFile *.txt set wrap linebreak nolist textwidth=0 nonumber

        " For your list of filetypes where you want Eclim semantic completion 
        " as the default YCM completion mode:
        if exists('g:eclim')
            autocmd FileType php,java,ruby,c,cpp,perl,python
                \ if &completefunc != '' | let &omnifunc=&completefunc | endif
        endif
    augroup END
" }

" FUNCTIONS {
    " Delete hidden buffers
    function! DeleteHiddenBuffers()
        let tpbl=[]
        call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
        for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
            silent execute 'bwipeout' buf
        endfor
    endfunction

    " function! GrepProject(...)
    "     if a:0 > 0
    "         let @/= '\V' . a:1
    "     end
    "     execute 'vimgrep /' . @/ . '/ **'
    " endfunction

    " function! AgProject(...)
    "     if a:0 > 0
    "         let @/= '\V' . a:1
    "     end
    "     execute 'AgFromSearch'
    " endfunction

    " Strip whitespace
    function! StripWhitespace(strip_whitespace_mode)
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        if a:strip_whitespace_mode == 'strip_only_space_only_lines'
            %s/^ \+$//e
        else
            if a:strip_whitespace_mode == 'keep_whitespace_only_lines'
                " clean up trailing except lines with only white spaces
                %s/\([^ ]\+\)[ ]\+$/\1/e
            else
                " clean up all trailing spaces
                %s/\s\+$//e
            endif
        endif
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

    " Setting up the directories
    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif

    " Initialize directories
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()

    " ucfirst words selected
    function! TitleCase(str)
    return substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    endfunction
    vnoremap ~ y:call setreg('', TitleCase(@"), getregtype(''))<CR>gv""P

    " set pastetoggle=<F12>
    " nnoremap <F12> :set invpaste paste?<CR>
    map <F12> :call PasteToggle()<CR>
    function! PasteToggle()
        let s:inPaste = &paste
        if !s:inPaste
            set paste
            set indentexpr=
        else
            set nopaste
            " echo &indentexpr funcion eclim??
            set indentexpr=
        endif

    endfunction
" }

" PLUGINS {

    " DOCUMENTOR {
        let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    " }

    " DELIMITMATE {
        let delimitMate_matchpairs = "(:),[:],<:>"
        let b:delimitMate_jump_expansion = 1
        " let delimitMate_expand_cr = 1
        let delimitMate_expand_space = 1
        imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
        imap <Leader><Leader> <Plug>delimitMateS-Tab
        imap <Leader>. <Plug>delimitMateJumpMany
        " let delimitMate_balance_matchpairs = 1
        " let delimitMate_autoclose = 1
        nmap <Leader>d :DelimitMateSwitch<CR>
    " }

    " ECLIM {
        if exists('g:eclim')
            map <Leader><F2> :call ProjTree()<CR>

            function! ProjTree()
                if expand('%:t')==''
                    ProjectsTree
                else
                    ProjectTreeToggle
                endif
            endfunction

            let g:EclimDefaultFileOpenAction = 'edit'
            let g:EclimProjectTreeActions = [
                \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
            \ ]

            map <F3> :PhpSearch -s project -t function<CR>
            nnoremap <silent> <F4> :PhpSearchContext<cr>

            nnoremap <C-F3> :cex []<CR><C-]>
            nnoremap <C-F4> <C-t>

            " let g:EclimCompletionMethod = 'omnifunc'
            let g:EclimPhpValidate = 0
            let g:EclimFileTypeValidate = 0
        else
            nnoremap <F3> :cex []<CR><C-]>
            nnoremap <F4> <C-t>
        endif
    " }

    " SNIPPETS {
        let g:UltiSnipsExpandTrigger = '<a-e>'
        let g:UltiSnipsJumpForwardTrigger = '<a-n>'
        let g:UltiSnipsJumpBackwardTrigger = '<a-p>'

        let g:UltiSnipsEditSplit="vertical"
    " }

    " TMUX COMPATIBLE {
        set mouse+=a
        if &term =~ '^screen'
            " tmux knows the extended mouse mode
            set ttymouse=xterm2
        endif
    " }

    " AIRLINE {
        let g:airline_powerline_fonts = 1
        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1
        " Show just the filename
        " let g:airline#extensions#tabline#fnamemod = ':t'
        " let g:airline#extensions#eclim#enabled = 1
        " let g:airline#extensions#tmuxline#enabled = 1
        let g:airline#extensions#tagbar#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline_exclude_preview = 1
        let g:airline#extensions#whitespace#checks = ['']
        let g:airline#extensions#whitespace#enabled = 0
        let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
        let g:airline#extensions#tabline#show_tab_nr = 1
        let g:airline#extensions#tabline#buffer_idx_mode = 1
        let g:airline#extensions#hunks#enabled = 1
        " map <leader>1 <Plug>AirlineSelectTab1
        " map <leader>2 <Plug>AirlineSelectTab2
        " map <leader>3 <Plug>AirlineSelectTab3
        " map <leader>4 <Plug>AirlineSelectTab4
        " map <leader>5 <Plug>AirlineSelectTab5
        " map <leader>6 <Plug>AirlineSelectTab6
        " map <leader>7 <Plug>AirlineSelectTab7
        " map <leader>8 <Plug>AirlineSelectTab8
        " map <leader>9 <Plug>AirlineSelectTab9
    " }

    " NERDTREE {
        map Q :silent NERDTreeCWD<CR>
    " }

    " TAGBAR {
        " nmap <C-t> :TagbarOpenAutoClose<CR>
        nmap <C-t> :TagbarOpen fj<CR>
        " go to previous tag on tagbar
        nmap <A-T> :TagbarOpen fj<CR>k<CR>
        " go to next tag on tagbar
        nmap <A-t> :TagbarOpen fj<CR>j<CR>

        " got default with ':TagbarGetTypeConfig php'
        let g:tagbar_type_php = {
            \ 'kinds' : [
                \ 'i:interfaces',
                \ 'c:classes',
                \ 'd:constant definitions:0:0',
                \ 'f:functions',
                \ 'j:javascript functions',
            \ ],
        \ }

        let g:tagbar_sort = 0
        let g:tagbar_compact = 1
        let g:tagbar_autoshowtag = 1
        let g:tagbar_autofocus = 1
        let g:tagbar_singleclick = 1
    " }
    " SYNTASTIC {
        nnoremap <F9> :SyntasticCheck<CR>
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_auto_loc_list = 2
        let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_check_on_wq = 1
        " let g:syntastic_check_on_open = 1
        let g:syntastic_enable_signs = 1
        let g:syntastic_error_symbol = "✗"
        let g:syntastic_warning_symbol = "⚠"
        let g:syntastic_style_error_symbol = "⚑"
        let g:syntastic_style_warning_symbol = "⚑"
        " let g:syntastic_aggregate_errors = 1
        " let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
        " }

    " CTRLP {
        let g:ctrlp_map = '<c-s-tab>'
        let g:ctrlp_by_filename = 1
        map <C-tab> :CtrlPMRU<CR>
        let g:ctrlp_match_window = 'max:30,results:30'

        " let g:ctrlp_open_multiple_files = 'i'
        " let g:ctrlp_extensions = ['buffertag', 'changes']


        " let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

        " func! MyCtrlPMappings()
        "     nnoremap <buffer> <silent> <c-_> :call <sid>DeleteBuffer()<cr>
        " endfunc

        " func! s:DeleteBuffer()
        "     let line = getline('.')
        "     let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        "                 \ : fnamemodify(line[2:], ':p')
        "     exec "bd" bufid
        "     exec "norm \<F5>"
        " endfunc
    " }

    " FUGITIVE {
        set diffopt+=vertical
        nnoremap <F7> :Gstatus<CR>
        nnoremap <F8> :Gdiff<CR>
        autocmd BufReadPost fugitive://* set bufhidden=delete
        nnoremap <C-F7> :!~/bin/ansbot '*?assword*' "$GIT_PASS" ''/usr/bin/git r''<CR>
        nnoremap <C-F8> :!~/bin/ansbot '*?assword*' "$GIT_PASS" ''/usr/bin/git p''<CR>
        " :set winheight=20<CR>
    " }

    " SESSION {
        " let g:session_autosave = 'yes'
        " let g:session_autoload = 'no'
        " let g:session_persist_colors = 0
    " }

    " GUNDO {
        nnoremap <F5> :GundoToggle<CR>
    " }

    " TEXTOBJ_FUNC {
        " map am <Plug>(textobj-function-a)
        " map im <Plug>(textobj-function-i)
        " map aM <Plug>(textobj-function-A)
        " map iM <Plug>(textobj-function-I)
    " }

    " TEXTOBJ_QUOTES {
        " select inner quotes
        xmap q iq
        omap q iq
    " }

    " YCM {
        " let g:loaded_youcompleteme = 0
        let g:ycm_autoclose_preview_window_after_insertion = 1
    " }

    " INDENT GUIDES {
        nmap <Leader><F9> :IndentGuidesToggle<CR>
        " let g:indent_guides_enable_on_vim_startup = 1
    " }

    " INDEXER/TAGS {
        let g:indexer_disableCtagsWarning=1
    " }


    " PHPCOMPLETE {
        if exists('g:phpcomplete')
            let g:phpcomplete_cache_taglists = 0
        endif
    " }

     " PHPCOMPLETE-EXTENDED {
        if exists('g:phpcomplete_extended')
            " this plugin provides autocompletion for composer/symfony projects
            autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
            let g:phpcomplete_index_composer_command='/usr/local/bin/composer'
        endif
    " }

    " " EASYTAGS {
    "     " autocmd BufWritePost * call system("ctags -R") // autocmd ctags execution
    "     " let g:easytags_include_members = 1
    "     let g:easytags_file ="~/.vimtags"
    "     let g:easytags_async = 1
    "     let g:easytags_opts = ['--fields=+aimS --languages=PHP,Javascript,HTML,Sh']
    "     let g:easytags_auto_highlight = 0
    "     " let g:easytags_syntax_keyword = 'always'
    "     " let g:easytags_auto_update = 0

    "     autocmd FileType vim let b:easytags_auto_highlight = 0
    "     autocmd FileType vim let b:easytags_auto_update = 0


    "     " let g:phpcomplete_mappings = {
    "     "             \ 'jump_to_def': '<F3>'
    "     "             \ }
    "     " nnoremap <F3> :cex []<CR><C-]>
    "     " nnoremap <F3> <C-]>
    " " }

    " EASYALIGN {
        " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
        vmap <Enter> <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign) 
    " }

    " VIMPASTA {
        " let g:pasta_paste_before_mapping = '<a-P>'
        let g:pasta_paste_after_mapping = '<a-p>'
    " }

    " PHPMANUAL
    let g:php_manual_online_search_shortcut = '<C-a-k>'

" CUSTOM COMMANDS/MACROS {
    " file it was loaded from, thus the changes you made.
    " Only define it when not defined already.
    if !exists(":DiffOrig")
    command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis
    endif

    "execute macro in a register in all open buffers
    command! ExecMacroAllBuffers bufdo execute "normal! @a"
    command! ExecMacroAllArgList argdo execute "normal! @a"
    command! ExecMacroAllBuffersAndSave bufdo execute "normal! @a" | update
    command! ExecMacroAllArgListAndSave argdo execute "normal! @a" | update
    command! OrderCss execute ":g/{/ .+1,/}/-1 sort"
    " search project-wide
    " command! -nargs=* GrepProject call GrepProject(<f-args>)
    " command! -nargs=* AgProject call AgProject(<f-args>)
    command! DeleteHiddenBuffers execute "call DeleteHiddenBuffers()"
    command! StripWhitespace execute "call StripWhitespace('all')"

    " fold a 'matchit' (%)
    let @f = 'V%zf'
    let @s = 'f, xi'
    let @m = 'f(ak$%ik0dwV:s% %\r%g:nohlsearchviI='
    let @M = '0f(ak$%ik0dwV:s% %\r%g:nohlsearchviI='

    " visual selection mappings
    " Allow using macros with visual selection
    vnoremap @@ :normal @@<CR>
    vnoremap @a :normal @a<CR>
    vnoremap @q :normal @q<CR>
    " allow using previous macro in visual mode
    vnoremap @f :normal @f<CR>
    " Allow using the repeat operator with a visual selection (!)
    vnoremap . :normal .<CR>
" }

" SHORTCUTS {
    " resize current buffer by +/- 5
    nnoremap <leader><left> :vertical resize -10<cr>
    nnoremap <leader><down> :resize +5<cr>
    nnoremap <leader><up> :resize -5<cr>
    nnoremap <leader><right> :vertical resize +10<cr>

    map <C-h> :AgFromSearch<CR>

    " nmap <leader>X :CloseSession<CR>:SaveSession<CR>

    " Soft wrap
    command! -nargs=* Wrap set wrap linebreak nolist textwidth=0 nonumber
    map <Leader><F4> :Wrap<CR>
    " filetypes
    map <Leader><F5> :set filetype=php <CR>
    map <Leader><F6> :set filetype=html <CR>
    map <Leader><F7> :set filetype=css <CR>
    "sudo apt-get install libxml2-utils
    map <Leader><F8> :silent %!xmllint --encode UTF-8 --format - <CR>

    " opens .vimrc and sets pwd to .vim
    map <C-F12> :e ~/.vim/vimrc<CR>

    " save and reload firefox current tab
    map <leader>f :silent !WID=`xdotool search --name "Mozilla Firefox" \| head -1`; xdotool windowactivate $WID > /dev/null 2>&1 ; xdotool key F5 > /dev/null 2>&1<CR> \ | execute ':redraw!'

    " ignore swap files (backup)
    map <C-S-Del> :! mv ~/.vimswap/* ~/.vimswap/kk > /dev/null 2>&1 &<CR>

    " fullscreen mode, need 'wmctrl' in you PATH
    map <silent> <C-F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

    nnoremap <C-F2> :if &go=~#'mT'<Bar>set go-=mT<Bar>else<Bar>set go+=mT<Bar>endif<CR>

" }
" ABBREV {
    inoreabbr pf print_f();<C-o>h
    iab >> =>
    " imap -_ ->
" }

" CTRL-SPACE
    if executable("ag") 
        let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'
    endif

    let g:ctrlspace_save_workspace_on_exit = 1

    nmap <C-S-space> :CtrlSpace a<CR>
    nmap <S-space> :CtrlSpace *<CR>

    " Move to the next buffer (alphabetically) on current tab
    noremap <A-j> :CtrlSpaceGoDown<CR>
    " Move to the previous buffer (alphabetically) on current tab
    noremap <A-k> :CtrlSpaceGoUp<CR>

    nmap <leader>s :CtrlSpaceSaveWorkspace default<CR>
    nmap <leader>l :CtrlSpaceLoadWorkspace! default<CR>
    nmap <leader>N :CtrlSpaceNewWorkspace<CR>

" }

" VIM-ROOTER
    let g:rooter_manual_only = 1
    " let g:rooter_use_lcd = 1
" }


" VIM-EXPAND-REGION
" map + <Plug>(expand_region_expand)
map <A-+> <Plug>(expand_region_shrink)

" Default settings. (NOTE: Remove comments in dictionary before sourcing)
" let g:expand_region_text_objects = {
"       \ 'iw'  :0,
"       \ 'iW'  :0,
"       \ 'i"'  :0,
"       \ 'i''' :0,
"       \ 'i]'  :1, " Support nesting of square brackets
"       \ 'ib'  :1, " Support nesting of parentheses
"       \ 'iB'  :1, " Support nesting of braces
"       \ 'il'  :0, " 'inside line'. Available through https://github.com/kana/vim-textobj-line
"       \ 'ip'  :0,
"       \ 'ie'  :0, " 'entire file'. Available through https://github.com/kana/vim-textobj-entire
"       \ }

let g:expand_region_text_objects = {
      \ 'iq'  :1,
      \ 'aq'  :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'i>' :0,
      \ 'a>' :0,
      \ 'it' :1,
      \ 'iT' :0,
      \ 'ie' :0,
      \ }

" VIM-MULTIPLE-CURSORS
    set selection=inclusive
" }

" VIM-SMOOTH-SCROLL
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }

" YANK-RING
    nnoremap <silent> <F11> :YRShow<CR>
    let g:yankring_replace_n_nkey = '<C-Y>'
    " to allow nnoremap Y y$ mapping
    let g:yankring_n_keys = 'D x X'
" }

call textobj#user#plugin('twig', {
\   'code': {
\     'pattern': ['%}', '{%'],
\     'select-a': 'aT',
\     'select-i': 'iT',
\   },
\ })

" enable debug mode
" set vbs=1
