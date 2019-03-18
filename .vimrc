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
    call dein#add('tpope/vim-surround')
    call dein#add('the-lambda-church/coquille') " coq
    call dein#add('let-def/vimbufsync')
    call dein#add('Konfekt/Fastfold')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('w0rp/ale')
    if has('nvim')
        call dein#add('Shougo/deoplete.nvim', {'lazy': 1, 'on_i': 1}) " autocompleter
        call dein#add('Shougo/neco-syntax', {'lazy': 1, 'on_i': 1})
        call dein#add('Shougo/neosnippet.vim', {'lazy': 1, 'on_i': 1})
        call dein#add('Shougo/neosnippet-snippets', {'lazy': 1, 'on_i': 1})
        call dein#add('zchee/deoplete-jedi', {'lazy': 1, 'on_ft': 'python', 'on_i': 1})
        call dein#add('Rip-Rip/clang_complete', {'lazy': 1, 'on_ft': '[c, cpp]', 'on_i': 1})
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
    " hi LineNr ctermfg=59 ctermbg=NONE
    hi LineNr ctermfg=NONE ctermbg=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=NONE
    hi CursorLineNr ctermfg=59 ctermbg=234
    hi TabLineFill term=bold cterm=bold ctermfg=NONE ctermbg=NONE
    hi TabLine ctermfg=NONE ctermbg=NONE
    hi TabLineSel ctermfg=NONE ctermbg=NONE
    set colorcolumn=0
    " hi StatusLine ctermfg=NONE ctermbg=NONE
    " hi StatusLineNC ctermfg=NONE ctermbg=NONE
    hi TabLine gui=none
    " hi TabLineSel guibg=240
    hi TabLineFill gui=none
endfunction
fu! TabFix()
    hi TabLine gui=none
    " hi TabLineSel guibg=240
    hi TabLineFill gui=none
endfu
fu! s:goyo_enter()
    Limelight
    set wrap
    " call ColorFix()
endfunction
fu! s:goyo_leave()
    Limelight!
    set nowrap
    " call ColorFix()
endfunction

" sets 
set termguicolors
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
set ttimeout
set ttimeoutlen=100
set laststatus=2
set foldmethod=indent
set foldlevel=99
set showmatch
set smarttab
set scrolloff=10
set sidescrolloff=5
" set scrolloff=9999
set splitbelow
set splitright
set guicursor=
set background=dark
" set tw=80
set colorcolumn=0
set formatoptions=tcrqj
set wildmenu
set autoread

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
set statusline+=%#Visual#                 " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#               " colour
set statusline+=%r                        " readonly flag
set statusline+=%m                        " modified [+] flag
set statusline+=%#Cursor#                 " colour
set statusline+=%#CursorLine#             " colour
set statusline+=\ %t\                     " short file name
set statusline+=%=                        " right align
set statusline+=%#CursorLine#             " colour
set statusline+=\ %y\                     " file type
set statusline+=%#CursorIM#               " colour
set statusline+=\ %3l:%-2c\               " line + column
set statusline+=%#Cursor#                 " colour
set statusline+=\ %3p%%\                  " percentage

" aus
au Filetype tex set tw=80 formatoptions+=wn2 spell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
" au Filetype markdown nnoremap <F12> :!pandoc -o math136.pdf math136.md<CR>
au Filetype ruby set shiftwidth=2 tabstop=2
au FileType coq set scrolloff=9999
au FileType coq call coquille#FNMapping()
if has('nvim')
    au TermOpen * set nonumber norelativenumber nospell
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
hi CheckedByCoq ctermbg=24 
hi SentToCoq ctermbg=24 
hi TabLine gui=none
" hi TabLineSel guibg=240
hi TabLineFill gui=none
" call ColorFix()

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
let g:coquille_auto_move='true'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:ale_set_balloons = 1

" keymaps
imap kj <Esc>
tmap kj <Esc>
map      <F3> :set laststatus=0<CR>
map      <F4> :set laststatus=2<CR>
nnoremap <F5> :Goyo<cr>
map      <F6> :set colorcolumn=0<CR>:set tw=0<CR>
map      <F7> :set colorcolumn=81<CR>:set tw=80<CR>
inoremap <F8> <ESC>:Lex<CR>
nmap     <F8> :Lex<CR>
nmap     <F9> :TagbarToggle<CR>
inoremap <F9> <ESC>:TagbarToggle<CR>
nnoremap <F10> :call OpenTerminal()<cr>
map      <F11> <Plug>(ale_toggle_buffer)
map      <F12> :make<CR>

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
" tnoremap <C-Left> <c-\><c-n><C-w>h
" tnoremap <C-Down> <c-\><c-n><C-w>j
" tnoremap <C-Up> <c-\><c-n><C-w>k
" tnoremap <C-Right> <c-\><c-n><C-w>l
" inoremap <C-Left> <c-\><c-n><C-w>h
" inoremap <C-Down> <c-\><c-n><C-w>j
" inoremap <C-Up> <c-\><c-n><C-w>k
" inoremap <C-Right> <c-\><c-n><C-w>l
" nnoremap <C-Left> <c-w>h
" nnoremap <C-Down> <c-w>j
" nnoremap <C-Up> <c-w>k
" nnoremap <C-Right> <c-w>l
imap     <C-k> <Plug>(neosnippet_expand_or_jump)
smap     <C-k> <Plug>(neosnippet_expand_or_jump)
xmap     <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><CR>
            \ (pumvisible() && neosnippet#expandable()) ?
            \ "\<Plug>(neosnippet_expand)" : "\<CR>"

nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>c :noh<CR>
nmap <Leader>r :checktime<CR>
nmap <Leader>b :bN<CR>
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

