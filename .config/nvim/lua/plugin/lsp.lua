local lsp_status = require('lsp-status')
local nvim_lsp = require('lspconfig')

lsp_status.register_progress()

local attach_hook = function(status_callback)
  return function(client, bufnr)
    vim.g["coq_settings"] = { auto_start = 'shut-up' }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    status_callback(client)

    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>la', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.lsp.buf.help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lF', '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workplace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>E', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lt', "<cmd>lua require'lsp_extensions'.inlay_hints()<CR>", opts)
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, { pattern="<buffer>", callback = vim.diagnostic.open_float})
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

-- add pylance support
-- technically against pylance license lol
-- based off of https://github.com/neovim/nvim-lspconfig/pull/303
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local default_config_servers = {
  'bashls',
  'clojure_lsp',
  'cmake',
  'cssls',
  'dhall_lsp_server',
  'dockerls',
  'hls',
  'html',
  'jsonls',
  'metals',
  'ocamllsp',
  'pyright',
  'rust_analyzer',
  'texlab',
  'tsserver',
  'vimls',
}

for _, lsp in ipairs(default_config_servers) do
  nvim_lsp[lsp].setup {
    on_attach = attach_hook(lsp_status.on_attach),
    capabilities=lsp_status.capabilities,
    flags = {
      debounce_text_changes = 500,
    }
  }
end
nvim_lsp['sumneko_lua'].setup {
  cmd = {"lua-language-server"},
  on_attach = attach_hook(lsp_status.on_attach),
  capabilities=lsp_status.capabilities,
  root_dir = util.path.dirname;
    flags = {
      debounce_text_changes = 500,
    }
}
nvim_lsp['clangd'].setup {
  on_attach = attach_hook(lsp_status.extensions.clangd.setup),
  capabilities=lsp_status.capabilities,
    flags = {
      debounce_text_changes = 500,
    }
}
nvim_lsp['yamlls'].setup {
  on_attach = attach_hook(lsp_status.on_attach),
  capabilities=lsp_status.capabilities,
  -- TODO: wait on https://github.com/neovim/neovim/issues/13448
  -- and https://github.com/redhat-developer/yaml-language-server/issues/370
  handlers = {
    ['client/registerCapability'] = function(_, _, _, _)
      return {
        result = nil;
        error = nil;
      }
    end
  },
    flags = {
      debounce_text_changes = 500,
    }
}

require('lspkind').init()
