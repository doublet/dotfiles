# dotfiles

These are my dotfiles. I manage them using Ansible.

## Lay-out

The following stuff is set up:

| Name            | Completion status |
|-----------------|-------------------|
| insync          | COMPLETE          |
| keepass         | COMPLETE          |
| zsh             | Should set up `~/.zshrc` |
| utils_cli       | COMPLETE          |
| uticl_graphical | COMPLETE          |
| vim             | Should install YCM, `~/.vimrc`, powerline |
| update_upgrade  | COMPLETE          |
| cups            | COMPLETE          |
| xflux           | COMPLETE          |
| python_pip      | COMPLETE          |
| nvm             | COMPLETE          |
| spotify         | COMPLETE          |
| disable_pcskpr  | COMPLETE          |
|-----------------|-------------------|

TODO https://github.com/lmmx/devnotes/wiki/Bash-script:-screencast-GIF-(via-temp-.avi)

Note: Ansible 2 is needed for `xflux` since it uses the `unarchive` module to grab a binary over https.

### Not yet started

fonts (fonts-inconsolata
java/scala => openjdk-7-jdk oracle-java7-jdk oracle-java8-jdk sbt scala
mopidy, morituri, mpc, ncmpcpp, mopidy-scrobbler
smart card ( pcscd, scdaemon... ?)
qemu-kvm, virt-manager
spotify-client
latex (texstudio)
WebStorm & IDEA
bumblebee, drivers
gimp with psmenurc
xmonad with xmobar and xmobarrc
NUMIX GTK+ theme and icon theme https://www.youtube.com/watch?v=1G4XGNHMpNM http://satya164.deviantart.com/art/Numix-GTK3-theme-360223962 https://github.com/numixproject/numix-icon-theme https://github.com/numixproject/numix-icon-theme-circle
 > gtk2-engines-murrine => yes, install
atom
chromium
pulseaudio, pavucontrol
samba
postgresql, pgadmin
loffice
calibre with library
fonts (VDS krabbels, VAG rounded?)


## Installation

Run the `playbook.yml` on your local machine like this:

```
ansible-playbook -i hosts playbook.yml --ask-sudo-pass
```

