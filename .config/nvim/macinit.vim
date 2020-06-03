
" might work with regular vim, but probably not.

" speed set
set guioptions=M

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim'))

" language agnostic
call dein#add('cohama/lexima.vim', {'lazy': 1, 'on_i': 1})                                                       " auto close brackets and quotes
call dein#add('gruvbox-community/gruvbox')                                                                       " colorscheme
call dein#add('sainnhe/gruvbox-material')
call dein#add('honza/vim-snippets')                                                                              " snippets pack
call dein#add('jreybert/vimagit')                                                                                " git client
call dein#add('Konfekt/FastFold')                                                                                " speeds up insert mode
call dein#add('liuchengxu/vista.vim')                                                                            " tagbar + language server integration
" call dein#add('ludovicchabant/vim-gutentags')                                                                    " generates ctags for you
call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})                                 " language server engine, plus helm style lists. look at the coc documentation, this is a big one!
call dein#add('tpope/vim-commentary')                                                                            " commenter
call dein#add('tpope/vim-surround')                                                                              " bracket and quotes utils
call dein#add('sheerun/vim-polyglot')                                                                            " syntax highlighting pack
call dein#add('Shougo/dein.vim')                                                                                 " plugin manager

" language specific

" latex
call dein#add('lervag/vimtex')                                                                                   " grab bag latex plugin
" all lisp languages
call dein#add('eraserhd/parinfer-rust', {'build': 'cargo build --release', 'lazy': 1, 'on_ft': ['lisp', 'clojure', 'scheme', 'racket']}) " really good smart parentheses for lisp languages like racket or clojure
call dein#add('guns/vim-sexp')                                                                                   " movements and objects to navigate sexp/lisp language structures
call dein#add('junegunn/rainbow_parentheses.vim', {'lazy': 1, 'on_ft': ['lisp', 'clojure', 'scheme', 'racket']}) " rainbow parentheses for sexp/lisp langs
call dein#add('tpope/vim-sexp-mappings-for-regular-people')                                                      " actually good keybinds for vim-sexp
" clojure
call dein#add('tpope/vim-fireplace')                                                                             " navigation and repl plugin for clojure. not a huge fan, but there's no good language server w/ coc for clojure yet.
" haskell
call dein#add('Twinside/vim-haskellFold')
" java soy
call dein#add('duganchen/vim-soy')

call dein#end()
call dein#save_state()

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
set scrolloff=999999
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
" set statusline+=\ %t\                     " short file name
set statusline+=\ %f\                     " file path 
set statusline+=%=                        " right align
set statusline+=%#CursorLine#             " colour
set statusline+=%{coc#status()}
set statusline+=\ %y\                     " file type
set statusline+=%#CursorIM#               " colour
set statusline+=\ %{NearestMethodOrFunction()}
set statusline+=\ %3l:%-2c\               " line + column
set statusline+=%#Function#                 " colour
set statusline+=\ %3p%%\                  " percentage

" lets
let g:coc_snippet_next                = '<tab>'
" let g:coc_node_args                   = ['--experimental-worker'] " for pyright
let g:fastfold_savehook               = 1
let g:fastfold_fold_command_suffixes  = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:gruvbox_italic                  = 1
let g:gruvbox_bold                    = 1
let g:gruvbox_contrast_dark           = "medium"
let g:gruvbox_material_background     = 'medium'
let g:gruvbox_material_enable_italic  = 1
let g:gruvbox_material_enable_bold    = 1
let g:gruvbox_material_palette        = 'original'
let g:netrw_browse_split              = 2
let g:netrw_winsize                   = 15
let g:netrw_banner                    = 0
let g:netrw_browse_split              = 4
let g:netrw_liststyle                 = 3
let g:polyglot_disabled               = ['python-indent', 'python-compiler']
let g:python_host_skip_check          = 1
let g:python3_host_skip_check         = 1
" let g:python_host_prog  = '/usr/bin/python2'
" let g:python3_host_prog = '/usr/local/opt/python@3.8/bin/python3.8'
let g:tex_flavor                      = "latex"
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c -R',
      \ }
let loaded_2html_plugin               = 0
let loaded_man                        = 0
let loaded_tutor_mode_plugin          = 0
let mapleader                         = " "
"
" color
filetype plugin on
syntax enable
color gruvbox
" color gruvbox-material
" highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" aus
au Filetype tex set tw=80 formatoptions+=wn2 spell
au Filetype markdown set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2
au Filetype ruby set shiftwidth=2 tabstop=2
au Filetype scheme set lispwords+=match lispwords-=if
au Filetype haskell set formatprg=stylish-haskell shiftwidth=2 tabstop=2
" au Filetype python set formatprg="python3.8 -m black -t py38 -"
au BufNewFile,BufRead *.ghci set filetype=haskell
au TermOpen * setlocal nonumber norelativenumber nospell
au TermEnter * setlocal scrolloff=0
au TermClose * setlocal number relativenumber
au TermClose * exe "bd! " . expand('<abuf>')
au TermLeave * setlocal scrolloff=999999
au TabLeave * let g:lasttab = tabpagenr()
autocmd CompleteDone * silent! pclose!
autocmd FileType json syntax match Comment +\/\/.\+$+
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme,racket RainbowParentheses set lisp
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
nnoremap <F9> :Vista!!<CR>
nnoremap <F10> :25sp term://fish<CR>i
nnoremap <F12> :make<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
tnoremap <C-h> <c-w>h
tnoremap <C-j> <c-w>j
tnoremap <C-k> <c-w>k
tnoremap <C-l> <c-w>l
nnoremap ` :call Float()<CR>
nnoremap H 0
nnoremap L $
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
            " \ pumvisible() ? coc#_select_confirm() : 
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" leader maps
nnoremap <Leader><Leader> :CocListResume<CR>
nnoremap <Leader>a <Plug>(coc-codeaction-selected)
xnoremap <Leader>a <Plug>(coc-codeaction-selected)
nnoremap <Leader>ac <Plug>(coc-codeaction)
nnoremap <Leader>b :CocList buffers<CR>
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <Leader>f <Plug>(coc-format-selected)
xnoremap <Leader>f <Plug>(coc-format-selected)
nnoremap <Leader>= <Plug>(coc-format)
nnoremap <Leader>g :CocList grep<CR>
nnoremap <Leader>h :CocList helptags<CR>
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
nnoremap <Leader>l <Plug>(coc-openlink)
nnoremap <Leader>m :CocList marks<CR>
nnoremap <Leader>o :CocList files<CR>
nnoremap <Leader>O :tabnew<CR>:CocList files<CR>
nnoremap <Leader>qf <Plug>(coc-fix-current)
nnoremap <Leader>rr :checktime<CR>
nnoremap <Leader>rn <Plug>(coc-rename)
nnoremap <Leader>t :CocList windows<CR>
nnoremap <Leader>v :vsp<CR>:CocList files<CR>
nnoremap <Leader>/ :CocList lists<CR>
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

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
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
