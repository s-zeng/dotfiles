local plugins = {
    {
        -- pure lua fzf-style lists/finders
        -- using s-zeng/telescope.nvim until my pr is merged
        '~/repos/telescope.nvim',
        config = 'require [[config/telescope]]',
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
        -- prose writing focus mode
        'junegunn/goyo.vim',
        cmd = {'Goyo'},
        requires = {'junegunn/limelight.vim'}
    },
    {
        -- rainbow brackets
        'junegunn/rainbow_parentheses.vim',
    },
    {
        -- latex plugin
        'lervag/vimtex',
        ft={'tex'}
    },
    {
        -- colorscheme
        'lifepillar/vim-gruvbox8',
        config = 'vim.cmd [[colorscheme gruvbox8]]'
    },
    {
        -- tagbar w/ lsp support
        'liuchengxu/vista.vim',
        cmd = {'Vista'}
    },
    {
        -- nvim built-in lsp + lua plugins built off it
        'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]',
        requires = {
            'nvim-lua/completion-nvim',
            'nvim-lua/diagnostic-nvim',
            'nvim-lua/lsp-status.nvim',
            'nvim-lua/lsp_extensions.nvim',
        },
    },
    {
        -- haskell highlights
        'neovimhaskell/haskell-vim',
        ft={'haskell'}
    },
    {
        -- gives colours to hex codes like #abcdef
        'norcalli/nvim-colorizer.lua',
        config='require [[colorizer]].setup()',
    },
    {
        -- treesitter in neovim. replaces polyglot + adds cool ast-based manipulations/text objects
        'nvim-treesitter/nvim-treesitter',
        config = 'require [[config/treesitter]]',
        requires = {'nvim-treesitter/nvim-treesitter-textobjects'}
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

return plugins
