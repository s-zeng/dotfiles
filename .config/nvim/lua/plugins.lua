local plugins = {
  {
    'nvim-lua/telescope.nvim',
    config = 'require [[plugin/telescope]]',
    requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
  },
  {
    -- lisp auto-brackets; write lisp like python!
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
    ft = {'clojure', 'scheme', 'racket', 'lisp'},
  },
  {
    'glepnir/dashboard-nvim',
    config = 'require [[plugin/dashboard]]',
  },
  {
    -- magit git client for vim
    'jreybert/vimagit',
    cmd = {'Magit'}
  },
  {
    -- sab == /ab<CR>
    'justinmk/vim-sneak'
  },
  {
    -- netrw/nerd-tree replacement
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    -- cmd = {'LuaTreeToggle'}
  },
  {
    -- latex plugin
    'lervag/vimtex',
    ft={'tex'}
  },
  {
    -- colorscheme
    'lifepillar/gruvbox8',
    config = 'vim.cmd [[colorscheme gruvbox8]]'
  },
  {
    -- tagbar w/ lsp support
    'liuchengxu/vista.vim',
    cmd = {'Vista'}
  },
  {
    -- emacs guide key/which key functionality. as seen in spacemacs, spacevim
    'liuchengxu/vim-which-key',
    config = 'require [[plugin/whichkey]]'
  },
  {
    -- nvim built-in lsp + lua plugins built off it
    'neovim/nvim-lspconfig',
    config = 'require [[plugin/lsp]]',
    requires = {
      'nvim-lua/completion-nvim',
      'nvim-lua/lsp-status.nvim',
      'nvim-lua/lsp_extensions.nvim',
    },
  },
  {
    -- gives colours to hex codes like #abcdef
    'norcalli/nvim-colorizer.lua',
    config='require [[colorizer]].setup()',
  },
  {
    -- treesitter in neovim. replaces polyglot + adds cool ast-based manipulations/text objects
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = 'require [[plugin/treesitter]]',
    requires = {'nvim-treesitter/nvim-treesitter'}
  },
  {
    -- rainbow parentheses w/ treesitter
    'p00f/nvim-ts-rainbow',
    requires = {'nvim-treesitter/nvim-treesitter'}
  },
  {
    -- context.vim w/ treesitter
    'romgrk/nvim-treesitter-context',
    requires = {'nvim-treesitter/nvim-treesitter'},
  },
  {
    -- autopairs
    'tmsvg/pear-tree',
    event='InsertEnter *'
  },
  {
    -- comment shortcut
    'tpope/vim-commentary'
  },
  {
    -- repeatable plugin maps
    'tpope/vim-repeat'
  },
  {
    -- s-expression manipulations
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = {'clojure', 'scheme', 'racket', 'lisp'},
    requires = {
      {
        'guns/vim-sexp',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
      }
    },
  },
  {
    -- delimiters helper
    'tpope/vim-surround',
    event = 'InsertEnter *'
  },
  {
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
}

local light = {
  {
    -- here cause it's a pain to recompile
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
    ft = {'clojure', 'scheme', 'racket', 'lisp'},
  },
  {
    -- colorscheme
    'lifepillar/vim-gruvbox8',
    config = 'vim.cmd [[colorscheme gruvbox8]]'
  },
  {
    -- also a pain to reinstall
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = 'require [[plugin/treesitter]]',
    requires = {'nvim-treesitter/nvim-treesitter'}
  },
  {
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
}

local minimal = {
  {
    -- colorscheme
    'lifepillar/vim-gruvbox8',
    config = 'vim.cmd [[colorscheme gruvbox8]]'
  },
  {
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
}

return plugins
-- return light
-- return minimal
