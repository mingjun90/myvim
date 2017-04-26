"-----------------------------------------------------------+
""" vundle

set nocompatible              " be iMproved, required
filetype off                  " required

""" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""" alternatively, pass a path where Vundle should install plugins
"""call vundle#begin('~/some/path/here')

""" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" vim style 
Plugin 'scrooloose/nerdTree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

""" language lint
Plugin 'w0rp/ale'

""" python
Plugin 'tell-k/vim-autopep8'
Plugin 'davidhalter/jedi-vim'
Plugin 'heavenshell/vim-pydocstring'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" To ignore plugin indent changes, instead use:
"filetype plugin on
"
""" Brief help
""" :PluginList       - lists configured plugins
""" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
""" :PluginSearch foo - searches for foo; append `!` to refresh local cache
""" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

""" see :h vundle for more details or wiki for FAQ
""" Put your non-Plugin stuff after this line

""" Inistall Plugins --> Launch vim and run :PluginInstall
""" Just delete the line {Plugin XXXX} and then :PluginUpdate


"-----------------------------------------------------------+
""" basic coding settings

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
" set autoindent
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set list

syntax on
set background=dark

set hlsearch         "highlight search pattern"

set listchars=nbsp:_,tab:>-,trail:~,extends:>,precedes:<

set number
set rnu

set backspace=indent,eol,start

""" show column number
" set ruler
" set statusline+=col:\ %c,


"-----------------------------------------------------------+
""" NERDTree

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"-----------------------------------------------------------+
""" Tab navigation like Firefox.

nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>
" let mapleader=" "
let mapleader = "\<Space>"


"-----------------------------------------------------------+
""" airline

let g:ailine_section_b = '%{strftime("%c")}'
let g:ailine_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme = 'simple'
set laststatus=2
""" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
""" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

""" This allows buffers to be hidden if you've modified a buffer.
""" This is almost a must if you wish to use buffers in this way.
set hidden
""" To open a new empty buffer
""" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
""" Move to the next buffer
nmap <leader><Tab> :bnext<CR>
"" Move to the previous buffer
nmap <leader>l :bprevious<CR>
""" Close the current buffer and move to the previous one
""" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
""" Show all open buffers and their status
nmap <leader>bl :ls<CR>


"-----------------------------------------------------------+
""" ale (asynchronous lint engine)

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'


"-----------------------------------------------------------+
""" jedi-vim

autocmd FileType python setlocal completeopt-=preview


"-----------------------------------------------------------+
""" pydocstring

nmap <silent> <C-I> <Plug>(pydocstring)


"-----------------------------------------------------------+
""" autopep8

fun MyCallAutoPEP8()
    "let g:autopep8_disable_show_diff=0
    :call Autopep8()
    "let g:autopep8_disable_show_diff=1
endfun
autocmd FileType python nnoremap <buffer> <F8> :call Autopep8()<CR>
autocmd FileType python nnoremap <buffer> <C-F8> :call MyCallAutoPEP8()<CR>
autocmd FileType python inoremap <buffer> <F8> <ESC>:call Autopep8()<CR>