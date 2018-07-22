" speed set at top
set guioptions=M

" plugins via dein
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.vim/bundle'))
    call dein#begin(expand('~/.vim/bundle'))
    call dein#add('cohama/lexima.vim', {'lazy': 1, 'on_i': 1}) " autopairs
    call dein#add('junegunn/goyo.vim', {'lazy': 1, 'on_cmd': 'Goyo'}) " focus mode
    call dein#add('junegunn/limelight.vim', {'lazy': 1, 'on_cmd': 'Goyo'}) " focus mode
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('majutsushi/tagbar', {'lazy': 1, 'on_cmd': 'TagbarToggle'}) " ctags gui
    call dein#add('Shougo/dein.vim') " plugin manager
    call dein#add('tpope/vim-commentary') " commenter
    if has('nvim')
        call dein#add('Shougo/deoplete.nvim', {'lazy': 1, 'on_i': 1}) " autocompleter
        call dein#add('Shougo/neco-syntax', {'lazy': 1, 'on_i': 1})
        call dein#add('Shougo/neosnippet.vim', {'lazy': 1, 'on_i': 1})
        call dein#add('Shougo/neosnippet-snippets', {'lazy': 1, 'on_i': 1})
        call dein#add('zchee/deoplete-jedi', {'lazy': 1, 'on_ft': 'python', 'on_i': 1})
    endif
    call dein#end()
    call dein#save_state()
endif

" functions
fu! OpenTerminal()
    botright split
    resize 10
    terminal
    startinsert
endf
fu! ColorFix()
    hi Normal ctermbg=NONE guibg=NONE
    hi NonText ctermbg=NONE guibg=NONE
    hi Comment ctermfg=243
    hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
    " hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
    hi VertSplit ctermbg=NONE ctermfg=234
    hi Visual ctermbg=240
    hi LineNr ctermfg=59 ctermbg=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=NONE
    hi CursorLineNr ctermfg=59 ctermbg=234
    hi TabLineFill term=bold cterm=bold ctermfg=NONE ctermbg=NONE
    hi TabLine ctermfg=NONE ctermbg=NONE
    hi TabLineSel ctermfg=NONE ctermbg=NONE
    " hi StatusLine ctermfg=NONE ctermbg=NONE
    " hi StatusLineNC ctermfg=NONE ctermbg=NONE
endfunction
fu! s:goyo_enter()
    Limelight
    set wrap
    call ColorFix()
endfunction
fu! s:goyo_leave()
    Limelight!
    set nowrap
    call ColorFix()
endfunction

" sets
set clipboard+=unnamedplus
set number
set relativenumber
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
set showmatch
set smarttab
" set scrolloff=9999
" set splitbelow
set splitright
set guicursor=
set background=dark

" statusline
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='c')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffText#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffText#%{(mode()=='t')?'\ \ \ TERM\ \ ':''}
set statusline+=%#DiffDelete#%{(mode()=='R')?'\ \ RPLACE\ ':''}
set statusline+=%#Search#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Search#%{(mode()=='V')?'\ \ V-LINE\ ':''}
set statusline+=%#Search#%{(mode()=='\<C-V>')?'\ \ VBLOCK\ ':''}
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%r                        " readonly flag
set statusline+=%m                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

" aus
au Filetype tex set tw=80 formatoptions+=w spell
au Filetype markdown set tw=80 formatoptions+=w spell
au Filetype c set shiftwidth=8 tabstop=8
au TermOpen * set nonumber norelativenumber
if has('nvim')
    au TermClose * exe "bd! " . expand('<abuf>')
endif
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd CompleteDone * silent! pclose!

" colorscheme stuff
filetype plugin indent on
syntax enable
set t_Co=256
colorscheme monokai
call ColorFix()

" plugin confs
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer', 'tag']
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#sources#jedi#show_docstring = 1
let g:netrw_browse_split = 2
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:tagbar_width = 20
let g:limelight_conceal_ctermfg = 243
let mapleader = " "

" keymaps
imap kj <Esc>
tmap kj <Esc>
nmap <F9> :TagbarToggle<CR>
inoremap <F9> <ESC>:TagbarToggle<CR>
nmap <F8> :Lex<CR>
inoremap <F8> <ESC>:Lex<CR>
map <F12> :make<CR>
map <F3> :set laststatus=0<CR>
map <F4> :set laststatus=2<CR>
nnoremap <F10> :call OpenTerminal()<cr>
nnoremap <F5> :Goyo<cr>
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
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><CR>
\ (pumvisible() && neosnippet#expandable()) ?
\ "\<Plug>(neosnippet_expand)" : "\<CR>"

