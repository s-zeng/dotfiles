if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/kronicmage/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/home/kronicmage/.vim/after,/home/kronicmage/.vim/bundle/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/kronicmage/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/kronicmage/.vim/bundle'
let g:dein#_runtime_path = '/home/kronicmage/.vim/bundle/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/kronicmage/.vim/bundle/.cache/.vimrc'
let &runtimepath = '/home/kronicmage/.vim,/usr/share/vim/vimfiles,/home/kronicmage/.vim/bundle/repos/github.com/Shougo/dein.vim,/home/kronicmage/.vim/bundle/.cache/.vimrc/.dein,/usr/share/vim/vim80,/home/kronicmage/.vim/bundle/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/kronicmage/.vim/after'
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Goyo call dein#autoload#_on_cmd('Goyo', 'limelight.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Goyo call dein#autoload#_on_cmd('Goyo', 'goyo.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* TagbarToggle call dein#autoload#_on_cmd('TagbarToggle', 'tagbar', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['lexima.vim'])
