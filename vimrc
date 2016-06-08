set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim




""""""""""Lines with two sets of quotes are included in the ~./vim_runtime/vimrcs/basic.vim file"""""""""""




""filetype plugin on
execute pathogen#infect()


" Compatability
set nocompatible                            " Disable vi compatability mode


" Mouse and Scrolling
"set mouse=a                                 " Enable mouse for all modes
set mousefocus                              " Window focus follows mouse
set mousehide                               " Hide mouse pointer when characters are typed
set scrolloff=10                            " Keep at least x lines above/below cursor if possilbe
set whichwrap+=<,>,[,],h,l,                 " <Left>, <Right>, h, and l wrap around line breaks
set nostartofline                           " don't reset cursor to start of line when moving around


"" Numbers and Lines
set number                                  " Display line numbers
""set ruler                                   " Display cursor position
set showcmd                                 " Display commands at the bottom of the screen


" Searching Criteria
""set ignorecase                              " Ignore Case in searching criteria
""set smartcase                               " Override ignore case if search pattern has capitol letters
set wildmode=longest,list                   " List all matches
set showmatch                               " Highlight matching parenthesis/brackets
""set hlsearch                                " Highlight search results
""set incsearch                               " Show matches while typing pattern


" Word Wrap
""set wrap                                   " Wrap visually instead of changing text in buffer
"set linebreak                               " Only wrap at characters listed in the breakat option
"set nolist                                  " List disables linebreaks


" Indentation
""set autoindent                              " Copy indentation from current line when starting new line
set copyindent                              " Copy structure of indentation from previous line, ex. comment symbols
set expandtab                               " <Tab> inserts soft tabstop spaces. use <Ctrl>-V <Tab> to get reatl tabstop
autocmd FileType make set noexpandtab       " Don't convert tabs to spaces for Makefiles
""set tabstop=4                               " Set the number of spaces <Tab> equals to x
""set shiftwidth=4                            " Set the number of spaces to use for each auto-indent, ex. >>, <<, commands
set softtabstop=4


" Key Remaps
nmap <silent> ,/ :nohlsearch<CR>
nnoremap ; :
inoremap jk <esc>
inoremap kj <esc>
nnoremap E $


" Make searches always 'very magic'
nnoremap / /\v
cnoremap %s/ %s/\v


" Jump to last known position in a file just after opening it
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Whitespace Handling
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e                             " Delete trailing whitespace
    call cursor(l,c )                       " Return cursor to previous position
endfunction
autocmd FileType perl,sh,python,vi autocmd BufWrite <buffer> :call StripTrailingWhitespaces()


" Clear searches when opening files
autocmd BufReadPre <buffer> :let @/ = ""


" Use JavaScript syntax highlighting for JSON files
autocmd BufNewFile, BufRead *.json set ft=javascript



try
source ~/.vim_runtime/my_configs.vim
catch
endtry
