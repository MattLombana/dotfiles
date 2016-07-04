" NOTE: If sections are collapsed, za will reopen them. similarly <space> f has been remapped to za
"       ff<space> will open all folds, and <space>ff will close all folds



""""""""""""""""""""""""""""""""""""""""Awesome Vim Configurations""""""""""""""""""""""""""""""""""""""""
" {{{
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
" }}}

""""""""""""""""""""""""""""""""""""""""Personal Vim Configurations""""""""""""""""""""""""""""""""""""""""

""""""""""Lines with two sets of quotes are included in the ~./vim_runtime/vimrcs/basic.vim file"""""""""""


""filetype plugin on
" {{{
execute pathogen#infect()
" }}}


" Menus
" {{{
    set wildmenu                                " Visual autocomplete for command menu
" }}}


" Compatibility
" {{{
    set nocompatible                            " Disable vi compatibility mode
" }}}


" Mouse, Scrolling, Tabs, and Windows
" {{{
    "set mouse=a                                 " Enable mouse for all modes
    set mousefocus                              " Window focus follows mouse
    set mousehide                               " Hide mouse pointer when characters are typed
    set scrolloff=10                            " Keep at least x lines above/below cursor if possilbe
    set whichwrap+=<,>,[,],h,l,                 " <Left>, <Right>, h, and l wrap around line breaks
    set nostartofline                           " Don't reset cursor to start of line when moving around
    set cursorline                              " Show a horizontal line underneath the cursor
    " Close the last window automatically if it is a quickfix/location list window
    :autocmd WinEnter * if &buftype ==# 'location' && winnr('$') == 1 | quit | endif
    " Use ctrl + t to open a new tab
    nnoremap <C-t> :call NewTab()<cr>
" }}}


" Numbers, Lines, and Folding
" {{{
    set number                                  " Display line numbers
    set relativenumber                          " Display relative line numbers
    ""set ruler                                   " Display cursor position
    set colorcolumn=101                         " Display a line at 101 characters
    " Sets the color column to grey, default is red
    highlight ColorColumn ctermbg=0 guibg=lightgrey
    set showcmd                                 " Display commands at the bottom of the screen
    set foldenable                              " Enable folding
    set foldlevelstart=10                          " Open up to 10 folds by default/start
    "set foldnestmax=10                          " Display at most up to 10 folds
    set foldmethod=indent                       " Fold based on indent level
" }}}


" Searching Criteria
" {{{
    ""set ignorecase                              " Ignore Case in searching criteria
    ""set smartcase                               " Override ignore case if search pattern has capitol letters
    set wildmode=longest,list                   " List all matches
    set showmatch                               " Highlight matching parenthesis/brackets
    ""set hlsearch                                " Highlight search results
    ""set incsearch                               " Show matches while typing pattern
" }}}


" Spell Checking
" {{{
    " Turn on spell checking by default for markdown files
    autocmd BufRead,BufNewFile *.md setlocal spell
    " Turn on spell checking by default for git commit files
    autocmd BufRead,BufNewFile gitcommit setlocal spell
    " Turn on spell checking by default for tex files
    autocmd BufRead,BufNewFile *.tex setlocal spell
    " Turn on spell checking by default for html files
    autocmd BufRead,BufNewFile *.html setlocal spell
    " Turn on spell checking by default for txt files
    autocmd BufRead,BufNewFile *.txt setlocal spell
    " Turn on spell checking by default for yml files
    autocmd BufRead,BufNewFile *.yml setlocal spell
    " Turn on spell checking by default for yaml files
    autocmd BufRead,BufNewFile *.yaml setlocal spell
    " Set a red background for misspelled words
    hi SpellBad ctermbg=red
" }}}


" Flake8 Linter
" {{{
    " Lint any .py file on write
    autocmd BufWritePost *.py call Flake8()
" }}}


" Trailer Trash
" {{{
    " Set automatic highlighting in blue
    hi UnwantedTrailerTrash guibg=blue ctermbg=blue
    autocmd BufWritePost call Trim()            " trim trailing whitespace
    autocmd BufWritePost * TrailerTrim
" }}}


" Word Wrap
" {{{
    ""set wrap                                   " Wrap visually instead of changing text in buffer
    "set linebreak                               " Only wrap at characters listed in the breakat option
    "set nolist                                  " List disables linebreaks
"" }}}


" Indentation
" {{{
    ""set autoindent                              " Copy indentation from current line when starting new line
    set copyindent                              " Copy structure of indentation from previous line, ex. comment symbols
    set expandtab                               " <Tab> inserts soft tabstop spaces. use <Ctrl>-V <Tab> to get reatl tabstop
    autocmd FileType make set noexpandtab       " Don't convert tabs to spaces for Makefiles
    ""set tabstop=4                               " Set the number of spaces <Tab> equals to x
    ""set shiftwidth=4                            " Set the number of spaces to use for each auto-indent, ex. >>, <<, commands
    set softtabstop=4                           " Set the number of columns vim uses when you hit <Tab>
    " Set tabstop to be 2 spaces if the editing file is yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    " Set tabstop to be 2 spaces if the editing file is yml
    autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
" }}}


" Undo and Backup
" {{{
    ""set undofile                                " Enable persistent undo commands for a file
    ""set undodir=~/.vim_runtime/temp_dirs/undo   " The directory to save undo files
    set undolevels=1000                         " The number of undo's to save (max=1000)
    set undoreload=10000                        " The number of undo's to reload upon open (max=10000)
    set backupdir=~/.vim/backup/                " The directory for vim to backup to
    set directory=~/.vim/backup/                " Set the directory to save vim files
" }}}


" Control-P Settings
" {{{
    let g:ctrlp_map = '<c-p>'                   " Sets the mapping for CtrlP
    let g:ctrlp_command = 'CtrlP'               " Sets the command for CtrlP
    let g:ctrlp_working_path_mode = 'ra'        " Sets the working path to nearest ancestor that has a root marker
    "let g:ctrlp_root_markers = ''               " Sets the root markers for project directories
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " Tells the fuzzy finder to ignore files that match the expressions (Linux/MacOSX)
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Tells the fuzzy finder to ignore files that match the expressions (Windows)

" }}}


" NERDTree Settings
" {{{
    " Set NERDTree to open on left
    let g:NERDTreeWinPos = "left"
    " Use <leader>nn to toggle NERDTree
    nnoremap <leader>nn :NERDTreeToggle<cr>
    " Close NerdTree if its the only buffer open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " Open NerdTree on start
    let g:nerdtree_tabs_open_on_console_startup=1
    autocmd vimenter * NERDTreeTabsToggle
    autocmd vimenter * 13 wincmd <
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 1 && !exists("s:std_in") | NERDTree | endif
    map <C-n> :NERDTreeTabsToggle<CR>
    autocmd VimEnter * wincmd l
" }}}


" NERDTree File highlighting
" {{{
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
    call NERDTreeHighlightFile('py', 'yellow', 'none', '#ffda4c', '#151515')
" }}}


" Tagbar Settings
" {{{
    " Open Tagbar on entering a new tab
    autocmd TabEnter * :TagbarOpen<cr>
    "let Tagbar open on startup
    let g:tagbar_open_on_console_startup=1
    autocmd vimenter * TagbarOpen
    autocmd VimEnter * wincmd l
    autocmd VimEnter * 12 wincmd <
    autocmd VimEnter * wincmd h
    "Allow <leader>tb to open Tagbar
    nnoremap <leader>tb :TagbarToggle<cr>
" }}}


" Syntastic Settings
" {{{
    " C
    let g:syntastic_c_checkers = ['gcc']
    " HTML
    let g:syntastic_html_checkers = ['tidy']
    " Markdown
    let g:syntastic_markdown_checkers = ['mdl']
    " Java
    let g:syntastic_java_checkers = ['javac']
    " JavaScript
    let g:syntastic_javascript_checkers = ['jshint']
    " OCaml
    let g:syntastic_ocaml_checkers = ['camlp4o']
    " Perl
    let g:syntastic_perl_checkers = ['perl']
    let g:syntastic_enable_perl_checker = 1
    " Bash/sh
    let g:syntastic_sh_checkers = ['sh']
    " YAML
    let g:syntastic_yaml_checkers = ['jsyaml']
" }}}


" YouCompleteMe Settings
" {{{
    " Turn off diagnostics to enable syntastic
    let g:ycm_show_diagnostics_ui = 0
" }}}


" Key Remaps
" {{{
    " Cannot use inline comments otherwise they will be interpreted as part of the command
    " It is possible to do <command>| " Comment

    " Turn off highlighted search results with ,<space>
    nmap <silent> <leader><space> :nohlsearch<CR>
    " Allow semicolon to insert a colon
    nnoremap ; :
    " Enter normal mode by hitting jk
    inoremap jk <esc>
    " Enter normal mode by hitting kj
    inoremap kj <esc>
    " Use E to get to the end of the lines
    nnoremap E $
    " Use B to get to the beginning of the lines
    nnoremap B ^
    " Press space bartwice to insert a space in normal mode
    nnoremap <space><space> i<space><esc>
    " Press space bar and f to open/close folds
    nnoremap <space>f za
    " Press f twice then space to open all folds
    nnoremap ff<space> zR
    " Press spacebar, and f twice to close all folds
    nnoremap <space>ff zM
    " Press leader twice to switch between two buffers
    nnoremap    <leader><leader> <C-^>
    " Use H, J, K, L to switch buffers
    nnoremap H <C-w>h
    nnoremap J <C-w>j
    nnoremap K <C-w>k
    nnoremap L <C-w>l
    " Press v twice to hightlight an entire line in normal mode
    nnoremap vv V
    " Allow w! to write to sudo files
    cnoremap w! w !sudo tee % >/dev/null/
    " Allow qq to quit without typing !
    cnoremap qq q!
    " Call Number Toggle with <ctrl> + l
    nnoremap <C-l> :call NumberToggle()<cr>
    inoremap <C-l> <esc>:call NumberToggle()<cr>i
" }}}


" Number Toggle Function
" {{{
    function! NumberToggle()
        if(&relativenumber == 1)
            set norelativenumber
        else
            set relativenumber
        endif
    endfunc
" }}}


" New Tab Function
" {{{
    function! NewTab()
       :tabnew
       :NERDTreeToggle
    endfunc
" }}}


" Make searches always 'very magic'
" {{{
    nnoremap / /\v
    cnoremap %s/ %s/\v
" }}}


" Jump to last known position in a file just after opening it
" {{{
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" }}}


" Clear searches when opening files
" {{{
    autocmd BufReadPre <buffer> :let @/ = ""
" }}}


" Use JavaScript syntax highlighting for JSON files
" {{{
    autocmd BufNewFile, BufRead *.json set ft=javascript
" }}}


"Get vim to open this file folded for easier readability
" {{{
        " How this works:
        " foldmethod=marker tells vim to use markers instead of tabs
        " foldlevel=0 tells vim to fold everything
        " Because we set foldmethod to markers, we must wrap each section with {{{ to start, and }}} to end:
        "     example:
        "               " Section Name {{{
        "               section commands " These will be folded
        "               " }}}
" }}}

set modelines=1                             " Set vim to only use these settings for THIS file
" THIS NEXT LINE MUST BE AT THE BOTTOM OF THE FILE, AND LEFT COMMENTED OUT!!!!!!!!!!!!
" vim:foldmethod=marker:foldlevel=0
