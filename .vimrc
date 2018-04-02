" Set incompatible
if &compatible
  set nocompatible
endif

" dein stuff
set runtimepath+=/home/kronicmage/.vim/bundle/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('/home/kronicmage/.vim/bundle'))
  call dein#begin(expand('/home/kronicmage/.vim/bundle'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('majutsushi/tagbar')
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

" plugin confs
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'
let g:airline#extensions#ale#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_crypt=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_min_count = 2
silent! call g:airline#extensions#whitespace#disable()
let g:deoplete#enable_at_startup = 1
let g:NERDTreeWinSize=24
let NERDTreeMinimalUI = 1
let g:tagbar_width = 20

" sets
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
set laststatus=1
set foldmethod=indent
set foldlevel=99
set smarttab
set scrolloff=3
" aus 
au Filetype c set shiftwidth=8 tabstop=8
au TermClose * exe "bd! " . expand('<abuf>')

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
nmap <F8> :NERDTreeTabsToggle<CR>
inoremap <F8> <ESC>:NERDTreeTabsToggle<CR>
map <F3> :set laststatus=0<CR>:set showmode<CR><CR>
map <F4> :set laststatus=2<CR>:set noshowmode<CR><CR>
map <F12> :make<CR>
nnoremap <F10> :call OpenTerminal()<cr>
nnoremap <F5> :call OpenTerminal()<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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
"inoremap <f10> <esc>:vimshellPop<CR>
"nmap <f10> :vimshellpop<cr>
"nmap <silent> <c-k> <plug>(ale_previous_wrap)
"nmap <silent> <c-j> <plug>(ale_next_wrap)
"nmap <f5> <plug>(ale_toggle)
