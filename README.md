# dotfiles

These are my dotfiles.
I usually clone this repo in `~/.dotfiles` but any directory will do.

## Lay-out

* In `dotfiles`, you will find all the dotfiles
* In `scripts`, some modular scripts pertaining to the deployment of these files live 
* Files in `bin` are small scripts that will become available on the $PATH (a symlink to them is placed in `~/bin`)
* `old_files` will be created by the backup script and contains old dotfiles.

## Installation

You can just clone the repo and run `deploy.sh`. This assumes that you already have `git` installed, `zsh` installed and `oh-my-zsh` set up.

An easier way is `deploy_debian.sh`. This will install `git`, `zsh`, change your default shell to `zsh` and grab `oh-my-zsh`.

### Debian boxes

This will do everything for you

`wget https://raw.githubusercontent.com/doublet/dotfiles/master/deploy_debian.sh -O - | sh`

