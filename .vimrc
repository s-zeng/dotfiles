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
    call dein#add('majutsushi/tagbar') " ctags gui
    call dein#add('Shougo/dein.vim') " plugin manager
    call dein#add('tpope/vim-commentary') " commenter
    call dein#add('tpope/vim-surround') " bracket and quotes utils
    " call dein#add('the-lambda-church/coquille') " coq
    " call dein#add('let-def/vimbufsync')
    call dein#add('Konfekt/Fastfold') " fold improvements
    call dein#add('sheerun/vim-polyglot') " all in one language syntax packs
    call dein#add('dylanaraps/wal.vim') " coloscheme
    call dein#add('icymind/NeoSolarized') " colorscheme
    call dein#add('morhetz/gruvbox') " colorscheme
    call dein#add('kshenoy/vim-signature') " navigate marks
    call dein#add('junegunn/rainbow_parentheses.vim') 
    call dein#add('eraserhd/parinfer-rust', {'build': 'cargo build --release'})
    call dein#add('tpope/vim-fireplace')
    if has('nvim')
        call dein#add('Shougo/denite.nvim') " helm
        call dein#add('Shougo/neco-vim')
        call dein#add('honza/vim-snippets')
        call dein#add('neoclide/coc-neco')
        call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})
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
fu! ColorFix(n)
    set termguicolors
    set background=dark
    exe "color ".a:n
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
fu! NoColorFix()
    set notermguicolors
    set background=dark
    colorscheme wal
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=238
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
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


" sets 
set termguicolors
" set clipboard+=unnamedplus
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
set updatetime=300
set shortmess+=c
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
set guicursor=n-v-c:ver100-iCursor
set ssop-=options
set hidden

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
set statusline+=%#Function#                 " colour
set statusline+=\ %3p%%\                  " percentage

" aus
au Filetype tex set tw=80 formatoptions+=wn2 spell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
au Filetype ruby set shiftwidth=2 tabstop=2
au FileType coq set scrolloff=9999
au FileType coq call coquille#FNMapping()
au FileType clojure let g:LanguageClient_diagnosticsEnable=0
if has('nvim')
    au TermOpen * set nonumber norelativenumber nospell
    au TermClose * exe "bd! " . expand('<abuf>')
endif
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd CompleteDone * silent! pclose!
autocmd FileType json syntax match Comment +\/\/.\+$+
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" plugin confs
let g:netrw_browse_split = 2
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:tagbar_width = 20
let g:limelight_conceal_ctermfg = 243
let mapleader = " "
" let g:coquille_auto_move='true'
let g:neosolarized_contrast = "normal"
let g:neosolarized_italic=1
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italic=1
let g:coc_snippet_next = '<tab>'
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#option('default', 'prompt', '>')
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('grep', 'converters', ['converter_abbr_word'])

" colorscheme stuff
filetype plugin indent on
syntax enable
set t_Co=256
" set termguicolors
color gruvbox
" call TabFix()
" call NoColorFix()
" hi CheckedByCoq ctermbg=24 
" hi SentToCoq ctermbg=24 
" hi TabLine gui=none
" hi TabLineSel guibg=240
" hi TabLineFill gui=none

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
map      <F12> :make<CR>

" movement binds
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
nnoremap H 0
nnoremap L $

" leader binds
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>rr :checktime<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>g :Denite grep<CR>
nnoremap <Leader>m :Denite mark<CR>
nnoremap <Leader>] :Denite contextMenu<CR>
nnoremap <Leader>h :Denite help<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <Leader>o :Denite file/rec<CR>
nnoremap <Leader>O :tabnew<CR>:Denite file/rec<CR>

" coc binds
nnoremap <Leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"<Paste>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)<Paste>
nnoremap <silent> K :call <SID>show_documentation()<CR>

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
