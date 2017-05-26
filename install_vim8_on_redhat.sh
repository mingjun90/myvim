#!/bin/bash

# clean and backup
cd $HOME
if [ -d $HOME/.vim ]; then
    mv $HOME/.vim $HOME/.vim_bak
fi

if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/.vimrc_bak
fi


# clone vim repo and install to local path
if [ ! -d vim ]; then
    git clone https://github.com/vim/vim.git
fi

cd $HOME/vim
make clean
./configure --with-features=huge \
            --enable-multibyte \
            --enable-luainterp \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-cscope \
            --enable-gui=auto \
            --enable-gnome-check \
            --enable-fontset \
            --with-x \
            --with-compiledby=$USER \
            --prefix=/home/$USER/.local
make -j 20 && make install


# install vundle and set vimrc
if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi

cd $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

#cat > vimrc << HEREDOC
#HEREDOC
wget https://raw.githubusercontent.com/mingjun90/vim/master/vimrc


# set env path
if [ -f $HOME/.bashrc ]; then
    cat >> $HOME/.bashrc << HEREDOC
export PATH=/home/$USER/.local/bin:\$PATH
HEREDOC
fi

if [ -f $HOME/.cshrc ]; then
    cat >> $HOME/.cshrc << HEREDOC
setenv PATH /home/$USER/.local/bin:\$PATH
HEREDOC
fi


# final step
echo "+-----------------------------------------+"
echo "open vim and run :PluginInstall"
echo "+-----------------------------------------+"
