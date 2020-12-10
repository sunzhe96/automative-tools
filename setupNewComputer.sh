#!/usr/bin/bash

### update all the software ###
sudo apt update
sudo apt upgrade -y

### emacs ###
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt install emacs27 -y

### vs code ###
sudo apt install code -y

### golang ###
sudo apt install golang -y

### sunpinyi ###
sudo apt install fcitx-sunpinyin -y

###  racket ###
sudo apt install racket -y

### Git Config ###
echo -n "Enter the global user for Git: "
read GITUSER
git config --global user.name "${GITUSER}"

echo -n "Enter the global user emacs for Git: "
read GITEMAIL
git config --global user.email "${GITEMAIL}"

git config --global alias.co checkout

### Oh-My-Zsh ###
sudo apt install zsh -y
chsh --shell $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### reboot ###
reboot
