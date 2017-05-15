# myvim

A repo to deploy vim everywhere

## Install vim and plugins

1. Install [vim8](https://github.com/vim/vim/blob/master/runtime/doc/version8.txt)
    - download vim source file
        - `cd ~`
        - `git clone https://github.com/vim/vim.git`
        - `cd ~/vim`
    - install at local path with python3 (`redhat`)
        - `make clean`
        - `./configure --with-features=huge \
            --enable-multibyte \
            --enable-luainterp \
            --enable-python3interp \
            --enable-rubyinterp \
            --enable-cscope \
            --enable-gui=auto \
            --enable-gnome-check \
            --enable-fontset \
            --with-x \
            --with-compiledby="$USER" \
            --with-python3-config-dir=/path/to/python3.5/config-3.5m`
        - `make -j 20 && make install`
        - add alias or export vim path to PATH
    - install with python2 (`ubuntu16.04`)
        - `sudo apt install ncurses-dev`
        - `./configure --with-features=huge \
            --enable-multibyte \
            --enable-luainterp \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-cscope \
            --enable-gui=auto \
            --enable-gnome-check \
            --enable-fontset \
            --with-x \
            --with-compiledby="$USER"'
    - `sudo make -j 20`
        - `sudo make install`
    - check vim version
        - `vim --version`

2. Apply custom settings
    - install [vundle](https://github.com/VundleVim/Vundle.vim)
        - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    - copy the custom vimrc to ~/.vim/vimrc
        - `cd ~/.vim`
        - `wget https://raw.githubusercontent.com/mingjun90/vim/master/vimrc`
    - install plugins
        - Launch `vim` and run `:PluginInstall`

3. Install dependency

## Dependency

### [ale](https://github.com/w0rp/ale) (Asynchronous Lint Engine)
- python --> flake8
    - `which flake8`
    - `pip install flake8`
- javascript --> jshint
    - `which jshint`
    - `npm install -g jshint`

### [vim-autopep8](https://github.com/tell-k/vim-autopep8)
- autopep8
    - `which autopep8`
    - `pip install autopep8`
