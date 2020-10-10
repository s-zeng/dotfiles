" neovim config
" uses a ton of neovim only stuff so incompatible with normal vim

" mapleader
let mapleader = " "

" source lua
lua require('init')

" sets
set autoindent
set backspace=2
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
" set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set foldmethod=indent
set hidden
set hlsearch
set inccommand=split
set lazyredraw
set mouse=a
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=999999
set shada='20,<50,s10
set shiftwidth=4
set shortmess+=c
set shortmess+=c
set showmatch
set sidescrolloff=5
set smartcase
set splitbelow
set splitright
set tabstop=4
set termguicolors
set timeout
set timeoutlen=300
set updatetime=300

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
set statusline+=\ %3l:%-2c\               " line + column
set statusline+=%#Function#                 " colour
set statusline+=\ %3p%%\                  " percentage

" lets
let g:netrw_banner              = 0
let g:netrw_browse_split        = 2
let g:netrw_browse_split        = 4
let g:netrw_liststyle           = 3
let g:netrw_winsize             = 15
let g:pear_tree_ft_disabled     = ['TelescopePrompt']
let g:pear_tree_smart_backspace = 1
let g:pear_tree_smart_closers   = 1
let g:pear_tree_smart_openers   = 1
let g:tex_flavor                = "latex"
let g:vista_default_executive   = 'nvim_lsp'
let g:vista_executive_for = {
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
\ }

let loaded_2html_plugin      = 0
let loaded_pkgbuild_plugin   = 0
let loaded_tutor_mode_plugin = 0

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
autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()
autocmd CursorHoldI <buffer> lua vim.lsp.util.show_line_diagnostics()
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType lisp,clojure,scheme,racket set lisp
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank{timeout=300}
augroup END

" keymaps
inoremap kj <ESC>
nnoremap <F8> :Lex<CR>
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
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <Leader>rr :checktime<CR>
nnoremap <Leader>T <cmd>lua require'lsp_extensions'.inlay_hints()<CR>
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
inoremap <c-c> <ESC>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
command! CodeAction lua vim.lsp.buf.code_action()
command! Json execute '%!python -m json.tool --sort-keys'
command! Vimrc vsp ~/.config/nvim/init.vim

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
