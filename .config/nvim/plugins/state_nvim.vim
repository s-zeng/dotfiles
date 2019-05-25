if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/kronicmage/.config/nvim,/etc/xdg/nvim,/home/kronicmage/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/kronicmage/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/kronicmage/.config/nvim/after,/home/kronicmage/.config/nvim/plugins/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/kronicmage/repos/dotfiles/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/kronicmage/.config/nvim/plugins'
let g:dein#_runtime_path = '/home/kronicmage/.config/nvim/plugins/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/kronicmage/.config/nvim/plugins/.cache/init.vim'
let &runtimepath = '/home/kronicmage/.config/nvim,/etc/xdg/nvim,/home/kronicmage/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/kronicmage/.config/nvim/plugins/repos/github.com/Shougo/dein.vim,/home/kronicmage/.config/nvim/plugins/repos/github.com/neoclide/coc.nvim,/home/kronicmage/.config/nvim/plugins/repos/github.com/eraserhd/parinfer-rust,/home/kronicmage/.config/nvim/plugins/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/kronicmage/.config/nvim/plugins/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/kronicmage/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/kronicmage/.config/nvim/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['lexima.vim'])
