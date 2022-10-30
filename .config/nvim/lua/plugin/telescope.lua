require('telescope').setup{
  defaults = {
    use_less = false,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  }
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzy_native")


local opts = { noremap=true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.resume, opts)
vim.keymap.set('n', '<leader><CR>', builtin.builtin, opts)
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, opts)
-- vkeymap.setmap('n', '<leader>b', "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set('n', '<leader>g', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>G', builtin.grep_string, opts)
vim.keymap.set('n', '<leader>h', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>o', builtin.fd, opts)
vim.keymap.set('n', '<leader><Up>', builtin.command_history, opts)
vim.keymap.set('n', '<leader>Q', builtin.commands, opts)
vim.keymap.set('n', '<leader>q', builtin.quickfix, opts)
vim.keymap.set('n', '<leader>m', builtin.marks, opts)
vim.keymap.set('n', '<leader>i', builtin.symbols, opts)
