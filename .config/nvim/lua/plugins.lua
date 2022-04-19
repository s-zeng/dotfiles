local plugins = {
  {
    -- automatically resizes splits to be smaller when unfocused and bigger when focused
    "beauwilliams/focus.nvim",
    config = function() require("focus").setup() end
  },
  {
    -- lisp auto-brackets; write lisp like python!
    's-zeng/parinfer-rust',
    run = 'cargo build --release',
    ft = {'clojure', 'scheme', 'racket', 'lisp', 'dune'},
  },
  {
    -- emacs style which-key
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  },
  {
    -- modern vim-sneak with a bit of easy-motion
    'ggandor/lightspeed.nvim',
    keys = {'s', 'S'}
  },
  {
    -- openai codex completion
    'jameshiew/nvim-magic',
   	config = function()
	  	require('nvim-magic').setup()
	  end,
	  requires = {
	  	'nvim-lua/plenary.nvim',
	  	'MunifTanjim/nui.nvim'
	  }
  },
  {
    -- magit git client for vim
    'jreybert/vimagit',
    cmd = {'Magit'}
  },
  -- {
  --   -- keeps ratios of splits when resizing terminal
  --   'kwkarlwang/bufresize.nvim',
  --   config = function () require("bufresize").setup() end
  -- },
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
    -- indentation guides
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    -- debug client
    'mfussenegger/nvim-dap',
    config = 'require [[plugin/dap]]'
  },
  {
    -- colorscheme
    "npxbr/gruvbox.nvim",
    requires={"rktjmp/lush.nvim"},
    config = 'vim.cmd [[colorscheme gruvbox]]'
  },
  {
    -- nvim lua fzf type thing
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
    config = 'require [[plugin/treesitter]]',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
      'romgrk/nvim-treesitter-context'
    },
  },
  {
    -- koka highlighting
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
    -- dhall highlighting
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
