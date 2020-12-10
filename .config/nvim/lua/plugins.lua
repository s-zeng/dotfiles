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
    -- haskell highlighting
    'neovimhaskell/haskell-vim'
  },
  {
    -- gives colours to hex codes like #abcdef
    'norcalli/nvim-colorizer.lua',
    config='require [[colorizer]].setup()',
  },
  {
    -- treesitter in neovim. replaces polyglot + adds cool ast-based manipulations/text objects
    'nvim-treesitter/nvim-treesitter',
    commit = "a47c83d12d9ba835c7ec59b2d498078850e4703f",
    config = 'require [[plugin/treesitter]]',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
      'romgrk/nvim-treesitter-context'
    },
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
    -- end helper 
    'tpope/vim-endwise'
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
  },
  {
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
  {
    'vmchale/dhall-vim'
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
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
}

local minimal = {
  {
    -- package manager
    'wbthomason/packer.nvim',
    opt = true
  },
}

return plugins
-- return light
-- return minimal
