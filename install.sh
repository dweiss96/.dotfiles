#!/usr/bin/env bash

echo "\n ##### Enrich templates with values #####"
echo "\n ### Creating gitconfig from template"
read -p "> Enter git full name:" FULLNAME
read -p "> Enter git mail:" GITMAIL

cat .gitconfig.template | sed s/{{FULLNAME}}/$FULLNAME/g | sed s/{{MAIL}}/$GITMAIL/g > .gitconfig

echo "\n ### Creating zshrc from template"
cat .zshrc.template | sed s/{{GIT_DIR}}/$(pwd)/g > .zshrc

echo "\n ####### Platform Specific Stuff #######"
echo "\n ### Please enter your package manager (supported values below)"
echo "\n     - pacman | arch-linux based systems"
echo "\n     - yum    | fedora/rhel based systems"
# echo "\n     - apt    | debian/ubuntu based systems"
# echo "\n     - brew   | MacOS (homebrew is already installed)"
echo "\n     - mac    | MacOS (homebrew will be installed)"
echo "\n     - skip   | you installed the used tools already by yourself"
read -p "> " PACKAGEMANAGER


case $PACKAGEMANAGER in
  pacman)
    source ./installer/pacman.sh
    ;;
  # yum)
  #   source ./installer/yum.sh
  #   ;;
  # apt)
  #   source ./installer/apt.sh
  #   ;;
  brew)
    source ./installer/brew.sh
    ;;
  mac)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    source ./installer/brew.sh
    ;;
  *)
    echo "\n ### Nothing to do"
    ;;
esac


echo "\n ##### Link dotfiles and change shell ###"
echo "\n ### Using stow to link dotfiles into home dir"
stow --target=$HOME .

case $PACKAGEMANAGER in
  pacman | yum | apt)
    echo "\n ### Change shell to zsh"
    chsh -s /usr/bin/zsh 
    ;;

  *)
    echo "\n ### If not done you can now change your shell to zsh"
    ;;
esac