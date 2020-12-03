local plugins = {
    {
        'nvim-lua/telescope.nvim',
        config = 'require [[config/telescope]]',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
    },
    {
        -- lisp auto-brackets; write lisp like python!
        'eraserhd/parinfer-rust',
        run = 'cargo build --release',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
    },
    -- {
    --     -- indent guides
    --     'glepnir/indent-guides.nvim',
    --     config = [[require('indent_guides').options = {
    --         indent_levels = 30;
    --         indent_guide_size = 1;
    --         indent_start_level = 1;
    --         indent_space_guides = true;
    --         indent_tab_guides = true;
    --         indent_pretty_guides = false;
    --         indent_soft_pattern = '\\s';
    --         exclude_filetypes = {'help','dashboard','terminal'};
    --         even_colors = { fg = "NONE" , bg = "#4c4846" };
    --         odd_colors = { fg = "NONE" , bg = "#3c3836" };
    --     };]]
    -- },
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
        -- sab == /ab<CR>
        'justinmk/vim-sneak'
    },
    {
        -- netrw/nerd-tree replacement
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        opt = true
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
        -- emacs guide key/which key functionality. as seen in spacemacs, spacevim
        'liuchengxu/vim-which-key',
        config = 'require [[config/whichkey]]'
    },
    {
        -- nvim built-in lsp + lua plugins built off it
        'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]',
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
        config = 'require [[config/treesitter]]',
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
        -- language pack
        'sheerun/vim-polyglot'
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
        config = 'require [[config/treesitter]]',
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
