" neovim config
" might work with regular vim, but probably not.

" speed set
set guioptions=M

call plug#begin(stdpath('data') . '/plugged')

" general
Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'honza/vim-snippets'              " snippets pack
Plug 'jreybert/vimagit', {'on': 'Magit'} " git client
Plug 'Konfekt/FastFold'                  " speeds up insert mode
Plug 'liuchengxu/vim-clap', {'on': 'Clap'}             " fzf replacement
Plug 'liuchengxu/vista.vim', {'on': 'Vista'} " tagbar + language server integration
Plug 'ludovicchabant/vim-gutentags'    " generates ctags for you
Plug 'nvim-treesitter/nvim-treesitter' " treesitter = nvim 0.5+ good syntax highlighting
Plug 'neovim/nvim-lspconfig'           " nvim lsp
Plug 'nvim-lua/completion-nvim'        " better lsp completions
Plug 'nvim-lua/diagnostic-nvim'        " better lsp diagnostics
Plug 'nvim-lua/lsp-status.nvim'        " lsp statusline
Plug 'nvim-lua/popup.nvim'             " lua popup library
Plug 'nvim-lua/plenary.nvim'           " lua helper functions
Plug 'nvim-lua/telescope.nvim'         " lua fzf
Plug 'rstacruz/vim-closer'             " auto pairs only on enter
Plug 'tpope/vim-commentary'            " commenter
Plug 'tpope/vim-surround'              " bracket and quotes utils

" colorschemes
Plug 'lifepillar/vim-gruvbox8'

" haskell (until treesitter supports it)
Plug 'neovimhaskell/haskell-vim'

" latex
Plug 'lervag/vimtex'

" all lisp languages
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release', 'for': ['clojure', 'scheme', 'racket', 'lisp']}
Plug 'guns/vim-sexp', {'for': ['clojure', 'scheme', 'racket', 'lisp']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'scheme', 'racket', 'lisp']}
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()

" source lua
luafile ~/.config/nvim/scripts.lua


" sets
set autoindent
set backspace=2
set cursorline
set expandtab
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set foldmethod=indent
" set formatoptions+=t
" set guifont=JetBrains\ Mono:h14
set hidden
set hlsearch
set inccommand=split
set mouse=a
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=999999
set shiftwidth=4
set shortmess+=c
set showmatch
set sidescrolloff=5
set splitbelow
set splitright
set shada='20,<50,s10
set tabstop=4
set timeout
set timeoutlen=300
set updatetime=300
set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" statusline
set statusline=
set statusline+=%#DiffAdd#%{(mode()[0]=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()[0]=='c')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffText#%{(mode()[0]=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffText#%{(mode()[0]=='t')?'\ \ \ TERM\ \ ':''}
set statusline+=%#DiffDelete#%{(mode()[0]=='R')?'\ \ RPLACE\ ':''}
set statusline+=%#Search#%{(mode()[0]=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Search#%{(mode()[0]=='V')?'\ \ V-LINE\ ':''}
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
set statusline+=%{LspStatus()}
set statusline+=\ %y\                     " file type
set statusline+=%#CursorIM#               " colour
set statusline+=\ %{nvim_treesitter#statusline(30)}
" set statusline+=\ %{NearestMethodOrFunction()}
set statusline+=\ %3l:%-2c\               " line + column
set statusline+=%#Function#                 " colour
set statusline+=\ %3p%%\                  " percentage

" lets
let g:clap_layout                     = { 'relative': 'editor' }
let g:clap_disable_run_rooter         = v:true
let g:clap_project_root_markers       = []
let g:completion_enable_snippet       = 'vim-vsnip'
let g:fastfold_savehook               = 1
let g:fastfold_fold_command_suffixes  = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:netrw_browse_split              = 2
let g:netrw_winsize                   = 15
let g:netrw_banner                    = 0
let g:netrw_browse_split              = 4
let g:netrw_liststyle                 = 3
let g:tex_flavor                      = "latex"
let loaded_2html_plugin               = 0
let loaded_man                        = 0
let loaded_tutor_mode_plugin          = 0
let mapleader                         = " "
"
" color
" filetype plugin on
" syntax enable
set termguicolors
color gruvbox8

" aus
" au BufReadPost *.purs set syntax=haskell
au Filetype tex set tw=80 formatoptions+=wn2 spell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
au Filetype ruby set shiftwidth=2 tabstop=2
autocmd FileType lisp,clojure,scheme,racket set lisp
au Filetype scheme set lispwords+=match lispwords-=if
au BufNewFile,BufRead *.ghci set filetype=haskell
au TermOpen * setlocal nonumber norelativenumber nospell
au TermEnter * setlocal scrolloff=0
au TermClose * setlocal number relativenumber
au TermClose * exe "bd! " . expand('<abuf>')
au TermLeave * setlocal scrolloff=999999
au TabLeave * let g:lasttab = tabpagenr()
autocmd CompleteDone * silent! pclose!
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd VimEnter * RainbowParentheses

" keymaps
inoremap kj <ESC>
nnoremap <F8> :Lex<CR>
" nnoremap <F8> :CocCommand explorer<CR>
nnoremap <F9> :Vista!!<CR>
nnoremap <F10> :10sp term://fish<CR>i
nnoremap <F12> :make<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
inoremap <C-h> <c-w>h
inoremap <C-j> <c-w>j
inoremap <C-k> <c-w>k
inoremap <C-l> <c-w>l
tnoremap <C-h> <c-w>h
tnoremap <C-j> <c-w>j
tnoremap <C-k> <c-w>k
tnoremap <C-l> <c-w>l
nnoremap ` :call Float()<CR>
nnoremap H 0
nnoremap L $

" leader maps
nnoremap <Leader><Leader> :Clap quickfix<CR>
" nnoremap <Leader>a <Plug>(coc-codeaction-selected)
" xnoremap <Leader>a <Plug>(coc-codeaction-selected)
" nnoremap <Leader>ac <Plug>(coc-codeaction)
nnoremap <Leader>b :Clap buffers<CR>
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
" nnoremap <Leader>f <Plug>(coc-format-selected)
" xnoremap <Leader>f <Plug>(coc-format-selected)
" nnoremap <Leader>= <Plug>(coc-format)
nnoremap <Leader>g :Clap grep<CR>
nnoremap <Leader>h :Clap help_tags<CR>
" nnoremap <Leader>l <Plug>(coc-openlink)
nnoremap <Leader>m :Clap marks<CR>
nnoremap <Leader>o :Clap files<CR>
nnoremap <Leader>O :tabnew<CR>:Clap files<CR>
" nnoremap <Leader>qf <Plug>(coc-fix-current)
nnoremap <Leader>rr :checktime<CR>
" nnoremap grn <Plug>(coc-rename)
nnoremap <Leader>t :Clap windows<CR>
nnoremap <Leader>v :vsp<CR>:Clap files<CR>
nnoremap <Leader>/ :Clap providers<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <silent> <Leader><Tab> :exe "tabn ".g:lasttab<cr>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
command! CodeAction lua vim.lsp.buf.code_action()

" functions
function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

function! Float()
    " Configuration
    let height = float2nr((&lines - 2) * 0.6)
    let row = float2nr((&lines - height) / 2)
    let width = float2nr(&columns * 0.6)
    let col = float2nr((&columns - width) / 2)
    " Border Window
    let border_opts = {
                \ 'relative': 'editor',
                \ 'row': row - 1,
                \ 'col': col - 2,
                \ 'width': width + 4,
                \ 'height': height + 2,
                \ 'style': 'minimal'
                \ }
    " Terminal Window
    let opts = {
                \ 'relative': 'editor',
                \ 'row': row,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }
    let top = "╭" . repeat("─", width + 2) . "╮"
    let mid = "│" . repeat(" ", width + 2) . "│"
    let bot = "╰" . repeat("─", width + 2) . "╯"
    let lines = [top] + repeat([mid], height) + [bot]
    let bbuf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
    let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
    let buf = nvim_create_buf(v:false, v:true)
    let s:float_term_win = nvim_open_win(buf, v:true, opts)
    " Styling
    call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
    call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')

    if a:0 == 0
        terminal
    else
        call termopen(a:1)
    endif

    startinsert
    " Close border window when terminal window close
    " autocmd BufLeave * ++once :call nvim_win_close(s:float_term_border_win, v:true)
    autocmd TermClose * ++once :call nvim_win_close(s:float_term_border_win, v:true)
endfunction
