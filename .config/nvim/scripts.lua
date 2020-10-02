local lsp_status = require('lsp-status')
local nvim_lsp = require('nvim_lsp')

lsp_status.register_progress()

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",     -- one of "all", "language", or a list of languages
    refactor = {
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["]m"] = "@class.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
                ["]M"] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[m"] = "@class.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
                ["[M"] = "@class.outer",
            },
        },
    },
}

local attach_hook = function(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
    require'lsp-status'.on_attach(client)

    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workplace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', ':PrevDiagnosticCycle<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', ':NextDiagnosticCycle<CR>', opts)
end

-- add pyright support
-- at least until https://github.com/neovim/nvim-lspconfig/pull/303 is merged
local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

local server_name = "pyright"

local installer = util.npm_installer {
    server_name = server_name;
    packages = {server_name};
    binaries = {server_name};
}

configs[server_name] = {
    default_config = {
        cmd = {"pyright-langserver", "--stdio"};
        filetypes = {"python"};
        root_dir = util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
        settings = {
            analysis = { autoSearchPaths= true; };
            pyright = { useLibraryCodeForTypes = true; };
        };
        -- The following before_init function can be removed once https://github.com/neovim/neovim/pull/12638 is merged
        before_init = function(initialize_params)
            initialize_params['workspaceFolders'] = {{
                name = 'workspace',
                uri = initialize_params['rootUri']
            }}
        end
    };
    docs = {
        description = [[
        https://github.com/microsoft/pyright
        `pyright`, a static type checker and language server for python
        ]];
    };
}

configs[server_name].install = installer.install
configs[server_name].install_info = installer.info
-- end pr 303 block

local default_config_servers = {
    'clangd',
    'clojure_lsp',
    'cmake',
    'cssls',
    'hls',
    'html',
    'jdtls',
    'jsonls',
    'metals',
    'pyright',
    'sumneko_lua',
    'texlab',
    'tsserver',
    'vimls',
    'yamlls',
}

for _, lsp in ipairs(default_config_servers) do
    nvim_lsp[lsp].setup {
        on_attach = attach_hook,
        capabilities=lsp_status.capabilities,
    }
end
