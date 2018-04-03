" sets
set guioptions=M
set clipboard+=unnamedplus
set number
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set nowrap
set mouse=a
set pastetoggle=<F2>
set cursorline
set ttimeoutlen=10
set laststatus=2
set foldmethod=indent
set foldlevel=99
set smarttab
set scrolloff=3
" statusline
set statusline=                                        " Override default
set statusline+=%2*\ %f\ %m\ %r%*                      " Show filename/path
set statusline+=%3*%=%*                                " Set right-side status info after this line
set statusline+=%4*%y\ %l/%L:%v%*                      " Set [filetype] <line number>/<total lines>:<column>
set statusline+=%5*\ %*                                " Set ending space
" aus 
au Filetype c set shiftwidth=8 tabstop=8
au TermClose * exe "bd! " . expand('<abuf>')

" dein stuff
set runtimepath+=/home/kronicmage/.vim/bundle/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('/home/kronicmage/.vim/bundle'))
    call dein#begin(expand('/home/kronicmage/.vim/bundle'))
    call dein#add('majutsushi/tagbar', { 'on_cmd': 'TagbarToggle'})
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
    call dein#add('tpope/vim-commentary')
    call dein#end()
    call dein#save_state()
endif

" colorscheme stuff
filetype plugin indent on
syntax enable
set t_Co=256
colorscheme monokai
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi Comment ctermfg=243
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi VertSplit ctermbg=NONE ctermfg=234
hi Visual ctermbg=240
hi LineNr ctermfg=59 ctermbg=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=NONE
hi CursorLineNr ctermfg=59 ctermbg=234
hi TabLineFill term=bold cterm=bold ctermfg=NONE ctermbg=NONE
hi TabLine ctermfg=NONE ctermbg=NONE
hi TabLineSel ctermfg=NONE ctermbg=NONE
hi StatusLine ctermfg=NONE ctermbg=NONE
hi StatusLineNC ctermfg=NONE ctermbg=NONE

" plugin confs
let g:deoplete#enable_at_startup = 1
let g:netrw_browse_split = 2
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:tagbar_width = 20
let mapleader = " "

" functions
fu! OpenTerminal()
    botright split
    resize 10
    set nonumber
    terminal
    startinsert
endf

" keymaps
nmap <F9> :TagbarToggle<CR>
inoremap <F9> <ESC>:TagbarToggle<CR>
nmap <F8> :Lex<CR>
inoremap <F8> <ESC>:Lex<CR>
map <F12> :make<CR>
map <F3> :set laststatus=0<CR>
map <F4> :set laststatus=2<CR>
nnoremap <F10> :call OpenTerminal()<cr>
nnoremap <F5> :call OpenTerminal()<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" split movement binds
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <c-\><c-n><C-w>h
tnoremap <C-j> <c-\><c-n><C-w>j
tnoremap <C-k> <c-\><c-n><C-w>k
tnoremap <C-l> <c-\><c-n><C-w>l
inoremap <C-h> <c-\><c-n><C-w>h
inoremap <C-j> <c-\><c-n><C-w>j
inoremap <C-k> <c-\><c-n><C-w>k
inoremap <C-l> <c-\><c-n><C-w>l
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
tnoremap <C-Left> <c-\><c-n><C-w>h
tnoremap <C-Down> <c-\><c-n><C-w>j
tnoremap <C-Up> <c-\><c-n><C-w>k
tnoremap <C-Right> <c-\><c-n><C-w>l
inoremap <C-Left> <c-\><c-n><C-w>h
inoremap <C-Down> <c-\><c-n><C-w>j
inoremap <C-Up> <c-\><c-n><C-w>k
inoremap <C-Right> <c-\><c-n><C-w>l
nnoremap <C-Left> <c-w>h
nnoremap <C-Down> <c-w>j
nnoremap <C-Up> <c-w>k
nnoremap <C-Right> <c-w>l

