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
