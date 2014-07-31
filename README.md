# dotfiles

These are my dotfiles.
I cloned this repo in `~/.dotfiles` but any directory will do.

## Lay-out

* In `dotfiles`, you will find all the dotfiles
* In `scripts`, some modular scripts live
* `old_files` will be created by the backup script and contains old dotfiles.

## Installation

You can just clone the repo and run `copy.sh`. This assumes that you already have `git` installed, `zsh` installed and `oh-my-zsh` set up.

An easier way is `deploy_debian.sh`. This will install `git`, `zsh`, change your default shell to `zsh` and grab `oh-my-zsh`.

### Debian boxes

This will do everything for you

`wget https://raw.githubusercontent.com/doublet/dotfiles/master/deploy_debian.sh -O - | sh`

### Arch boxes

Still working on this. Ideally, this will set up all manually installed packages and do some setup work.

