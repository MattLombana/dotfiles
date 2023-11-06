# Matt Lombana's Dotfiles Repo

This repo is heavily influenced by other dotfiles repositories on github.
It has several main parts to it:

## Quickstart

```
curl https://raw.githubusercontent.com/MattLombana/dotfiles/master/autostart.sh | bash
```

## bashrc

    Contains my bash configurations, without my bash aliases

## bash_aliases

    Contains my bash aliases. It is sourced within .bashrc

## vimrc

    Contains my vim configurations. As of now there is an issue with switching
    tabs and keeping the file tree and tagbar panes in place

## tmux.conf

    Contains my tmux configurations. It is stable, and well commented, so using it
    shouldn't be an issue.
    This also installs my teamocil configuration files.

## makesymlinks.sh

    This script installs and configures my dotfiles. It is originally from
    https://github.com/michaeljsmalley/dotfiles
    It has been slightly modified for my use

# Common Fixes

VIM: E1312: Not allowed to change the window layout in this autocmd

This is caused because you cannot control windows from an autocmd in Vim
https://groups.google.com/g/vim_dev/c/Cw8McBH6DDM

There is a fix that need to be made to each of the following plugins. Note, the
timing is changeable, but the following order needs to be preserved:

1. Close Tagbar pane
2. Close NerdTree pane
3. Resize NerdTree
4. Return to original pane
5. Move right to main pane
6. Move right to tagbar pane
7. Resize tagbar pane
8. Move back to main pane


*Nerd Tree Tabs*

`~/.vim/bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim`

```
fun! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1 && winnr("$") == 1
    " Vim forbids closing the window inside an autocommand
    " Ref: https://groups.google.com/g/vim_dev/c/Cw8McBH6DDM?pli=1
    " So let's do it afterwards. Solution came from @mattmartini
    " Ref: https://github.com/jistr/vim-nerdtree-tabs/issues/102
    call timer_start(20, {-> execute('q', 'silent!') }) " close buffer after we exit autocmd
    "call timer_start(45, {-> execute('wincmd l', 'silent!') }) " shift focus from NerdTree window to buffer window
    call timer_start(50, {-> execute('vertical resize 25', 'silent!') }) " window sizing is goofed up, so fix it
    call timer_start(100, {-> execute('wincmd w', 'silent!') }) " shift focus from NerdTree window to buffer window
  endif
endfun
```

*tagbar*

`~/.vim/bundle/tagbar/autoload/tagbar`

```
" s:HandleOnlyWindow() {{{2
function! s:HandleOnlyWindow() abort
    let tagbarwinnr = bufwinnr(s:TagbarBufName())
    if tagbarwinnr == -1
        return
    endif

    let vim_quitting = s:vim_quitting
    let s:vim_quitting = 0

    let file_open = s:HasOpenFileWindows()

    if vim_quitting && file_open == 2 && !g:tagbar_autoclose_netrw
        call tagbar#debug#log('Closing Tagbar due to QuitPre - netrw only remaining window')
        " call s:CloseWindow()
        call timer_start(10, {-> execute('q', 'silent!') }) " close buffer after we exit autocmd"
        call timer_start(195, {-> execute('wincmd l', 'silent!') }) " shift focus from NerdTree window to buffer window
        call timer_start(197, {-> execute('wincmd l', 'silent!') }) " shift focus from NerdTree window to buffer window
        call timer_start(200, {-> execute('vertical resize 25', 'silent!') }) " window sizing is goofed up, so fix it
        call timer_start(250, {-> execute('wincmd h', 'silent!') }) " shift focus from NerdTree window to buffer window
    endif
    return
endfunction
```
