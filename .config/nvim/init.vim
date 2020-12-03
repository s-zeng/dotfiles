" neovim config
"
"
" has some neovim-only stuff so probably won't work with vim
" run my `:PackUp` command to grab and update plugins with packer.nvim

" sets
set autoindent
set backspace=2
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set foldlevel=99
set foldmethod=indent
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h13
set hidden
set hlsearch
set inccommand=split
set lazyredraw
set linebreak
set mouse=nvi
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=999999
set shada='20,<50,s10
set shiftwidth=4
set shortmess+=c
set showmatch
set sidescrolloff=5
set signcolumn=number
set smartcase
set splitbelow
set splitright
set tabstop=4
set termguicolors
set timeout
set timeoutlen=300
set updatetime=300
set virtualedit=block

" statusline
set statusline=
set statusline+=%#DiffAdd#%{(mode()[0]=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()[0]=='c')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffText#%{(mode()[0]=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffText#%{(mode()[0]=='t')?'\ \ \ TERM\ \ ':''}
set statusline+=%#DiffDelete#%{(mode()[0]=='R')?'\ \ RPLACE\ ':''}
set statusline+=%#Search#%{(mode()[0]=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Search#%{(mode()[0]=='V')?'\ \ V-LINE\ ':''}
set statusline+=%#Search#%{(mode()==\"\\\<C-V>\")?'\ \ VBLOCK\ ':''}
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
set statusline+=\ %3l:%-2c\               " line + column
set statusline+=%#Function#                 " colour
set statusline+=\ %3p%%\                  " percentage

" lets
let g:gruvbox_filetype_hi_groups  = 0
let g:gruvbox_material_palette    = "original"
let g:loaded_2html_plugin         = 0
let g:loaded_pkgbuild_plugin      = 0
let g:loaded_tutor_mode_plugin    = 0
let g:mapleader                   = " "
let g:maplocalleader              = ","
let g:pear_tree_ft_disabled       = ['TelescopePrompt']
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1
let g:pear_tree_repeatable_expand = 0
let g:tex_flavor                  = "latex"
let g:vista_default_executive     = 'nvim_lsp'
let g:vista_executive_for         = { 'vimwiki': 'markdown', 'pandoc': 'markdown', 'markdown': 'toc' }

" aus
au BufNewFile,BufRead *.ghci set filetype=haskell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
au Filetype ruby set shiftwidth=2 tabstop=2
au Filetype scheme set lispwords+=match lispwords-=if
au Filetype tex set tw=80 formatoptions+=wn2 spell
au TabLeave * let g:lasttab = tabpagenr()
au TermClose * exe "bd! " . expand('<abuf>')
au TermClose * setlocal number relativenumber
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=999999
au TermOpen * setlocal nonumber norelativenumber nospell
autocmd CompleteDone * silent! pclose!
autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHoldI <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType lisp,clojure,scheme,racket set lisp
" autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank{timeout=300}
augroup END

" keymaps
inoremap <C-h> <c-w>h
inoremap <C-j> <c-w>j
inoremap <C-k> <c-w>k
inoremap <C-l> <c-w>l
inoremap <c-c> <ESC>
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"
inoremap kj <ESC>
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <F10> :10sp term://fish<CR>i
nnoremap <F12> :make<CR>
nnoremap <F8> :LuaTreeToggle<CR>
nnoremap <F9> :Vista!!<CR>
nnoremap H 0
nnoremap L $
nnoremap ` :call Float()<CR>
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
nnoremap <F1> <nop>
nnoremap Q <nop>
" append one character
nnoremap <c-i> :exec "normal a".nr2char(getchar())."\e"<CR>
tnoremap <C-h> <c-w>h
tnoremap <C-j> <c-w>j
tnoremap <C-k> <c-w>k
tnoremap <C-l> <c-w>l
tnoremap <Esc> <C-\><C-n>

" leader maps
nnoremap <Leader>c :noh<CR>hl
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <Leader>r :checktime<CR>
nnoremap <silent> <Leader>t<Tab> :exe "tabn ".g:lasttab<cr>
nnoremap <leader>t0 :tablast<cr>
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
nnoremap <leader>t6 6gt
nnoremap <leader>t7 7gt
nnoremap <leader>t8 8gt
nnoremap <leader>t9 9gt

" symbols
inoremap jjla λ
inoremap jjfa ∀
inoremap jjra →

command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
command! Json execute '%!python -m json.tool --sort-keys'
command! -nargs=0 PackUp lua require('update')
command! -nargs=0 LuaTreeToggle call s:load_luatree()

" functions
function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

function! s:load_luatree() abort
  packadd nvim-tree.lua
  lua require"tree".on_enter()
  LuaTreeToggle
endfunction

function! Float(...)
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
