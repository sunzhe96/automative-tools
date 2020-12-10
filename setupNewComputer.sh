#!/usr/bin/bash

### change apt mirror ###
sudo sed -i 's/us/tw/g' /etc/apt/sources.list

### update all the software ###
sudo apt update
sudo apt upgrade -y

### emacs ###
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt update
sudo apt install emacs27 -y

### vs code ###
sudo apt install code -y

### golang ###
sudo apt install golang -y

### sunpinyi ###
sudo apt install fcitx-sunpinyin -y

###  racket ###
sudo apt install racket -y

### R ###
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt update
sudo apt install r-base r-base-dev -y

curl "https://rstudio.com/products/rstudio/download/#download" > rstudioDownload.html
rstudioPackage = $(cat test.html | grep -n bionic | head -1 |awk -F"\"" {'print $2'})
wget -O rstudio.deb "$rstudioPackage"
sudo dpkg -i rstudio.deb
rm rstudio*

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

