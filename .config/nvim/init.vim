" speed set
set guioptions=M

set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/plugins'))
    call dein#begin(expand('~/.config/nvim/plugins'))
    " language agnostic
    call dein#add('cohama/lexima.vim', {'lazy': 1, 'on_i': 1})
    call dein#add('honza/vim-snippets') " snippets pack
    call dein#add('kshenoy/vim-signature') " navigate marks
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('majutsushi/tagbar') " ctags gui
    call dein#add('morhetz/gruvbox') " colorscheme
    call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'}) " lsp engine
    call dein#add('tpope/vim-commentary') " commenter
    call dein#add('tpope/vim-surround') " bracket and quotes utils
    call dein#add('sheerun/vim-polyglot') " syntax highlighting packs
    call dein#add('Shougo/dein.vim') " plugin manager
    " language specific
    call dein#add('eraserhd/parinfer-rust', {'build': 'cargo build --release'}) " smart parentheses for sexp langs
    call dein#add('junegunn/rainbow_parentheses.vim') " rainbow parentheses for sexp langs
    call dein#end()
    call dein#save_state()
endif

" sets
set autoindent
set backspace=2
set cursorline
set expandtab
set foldlevel=99
set foldmethod=indent
set formatoptions+=t
set hidden
set hlsearch
set inccommand=split
set mouse=a
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=10
set shiftwidth=4
set shortmess+=c
set showmatch
set sidescrolloff=5
set splitbelow
set splitright
set tabstop=4
set termguicolors
set timeout
set timeoutlen=300
set updatetime=300

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

" lets
let g:coc_snippet_next       = '<tab>'
let g:gruvbox_italic         = 1
let g:netrw_browse_split     = 2
let g:netrw_winsize          = 15
let g:netrw_banner           = 0
let g:netrw_browse_split     = 4
let g:netrw_liststyle        = 3
let g:tagbar_width           = 20
let loaded_2html_plugin      = 0
let loaded_man               = 0
let loaded_tutor_mode_plugin = 0
let mapleader                = " "
"
" color
syntax enable
color gruvbox

" aus
au Filetype tex set tw=80 formatoptions+=wn2 spell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
au Filetype ruby set shiftwidth=2 tabstop=2
au TermOpen * set nonumber norelativenumber nospell
au TermClose * exe "bd! " . expand('<abuf>')
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

" keymaps
inoremap kj <ESC>
nnoremap <F8> :Lex<CR>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <F10> :10sp term://zsh<CR>i
nnoremap <F12> :make<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap H 0
nnoremap L $
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() : 
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" leader maps
nnoremap <Leader>? :CocList lists<CR>
xnoremap <Leader>a <Plug>(coc-codeaction-selected)
nnoremap <Leader>a <Plug>(coc-codeaction-selected)
nnoremap <Leader>ac <Plug>(coc-codeaction)
nnoremap <Leader>b :CocList buffers<CR>
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
xnoremap <Leader>f <Plug>(coc-format-selected)
nnoremap <Leader>f <Plug>(coc-format-selected)
nnoremap <Leader>g :CocList grep<CR>
nnoremap <Leader>h :CocList helptags<CR>
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
nnoremap <leader>l <Plug>(coc-openlink)
nnoremap <Leader>m :CocList marks<CR>
nnoremap <Leader>o :CocList files<CR>
nnoremap <Leader>O :tabnew<CR>:CocList files<CR>
nnoremap <Leader>qf <Plug>(coc-fix-current)
nnoremap <Leader>rr :checktime<CR>
nnoremap <Leader>rn <Plug>(coc-rename)
nnoremap <Leader>v :vsp<CR>:CocList files<CR>

" misc
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" functions
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
