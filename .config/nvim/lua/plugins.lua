local plugins = {
  { "beauwilliams/focus.nvim", config = function() require("focus").setup() end },
  {
    -- lisp auto-brackets; write lisp like python!
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
    ft = {'clojure', 'scheme', 'racket', 'lisp'},
  },
  {
    'folke/which-key.nvim',
    -- config = 'require [[plugin/whichkey]]',
  },
  {
    'ggandor/lightspeed.nvim',
    keys = {'s', 'S'}
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
    -- using my fork until my pr is merged
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
  },
  {
    -- latex plugin
    'lervag/vimtex',
    ft={'tex'}
  },
  {
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    'mfussenegger/nvim-dap',
    config = 'require [[plugin/dap]]'
  },
  {
    -- colorscheme
    -- 'lifepillar/gruvbox8',
    -- config = 'vim.cmd [[colorscheme gruvbox8]]'
    "npxbr/gruvbox.nvim",
    requires={"rktjmp/lush.nvim"},
    config = 'vim.cmd [[colorscheme gruvbox]]'
  },
  {
    'nvim-telescope/telescope.nvim',
    config = 'require [[plugin/telescope]]',
    requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-symbols.nvim', 'kyazdani42/nvim-web-devicons'}
  },
  {
    -- tagbar w/ lsp support
    'liuchengxu/vista.vim',
    cmd = {'Vista'}
  },
  {
    -- nvim built-in lsp + lua plugins built off it
    'neovim/nvim-lspconfig',
    config = 'require [[plugin/lsp]]',
    requires = {
      {'ms-jpq/coq_nvim', branch = 'coq'},
      {'ms-jpq/coq.artifacts', branch = 'artifacts'},
      'nvim-lua/lsp-status.nvim',
      'nvim-lua/lsp_extensions.nvim',
      'onsails/lspkind-nvim',
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
    branch = [[0.5-compat]],
    config = 'require [[plugin/treesitter]]',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
      'romgrk/nvim-treesitter-context'
    },
  },
  {
    'Nymphium/vim-koka',
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
