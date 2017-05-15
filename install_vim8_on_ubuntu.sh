#!/bin/bash

cd ~
git clone https://github.com/vim/vim.git
cd ~/vim

sudo apt install ncurses-dev
make clean
./configure --with-features=huge \ --enable-multibyte \ --enable-luainterp \ --enable-pythoninterp \ --enable-rubyinterp \ --enable-cscope \ --enable-gui=auto \ --enable-gnome-check \ --enable-fontset \ --with-x \ --with-compiledby="$USER"

sudo make -j 20
sudo make install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim
wget https://raw.githubusercontent.com/mingjun90/vim/master/vimrc
