set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 's-zeng/repl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set number

syntax enable
colorscheme monokai

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set hlsearch
set nowrap
set mouse=a

set pastetoggle=<F2>
nmap <F8> :TagbarToggle<CR>
