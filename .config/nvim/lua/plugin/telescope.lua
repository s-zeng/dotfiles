require('telescope').setup{
  defaults = {
    use_less = false,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  }
}

require("telescope").load_extension("ui-select")


local opts = { noremap=true }
vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd>Telescope builtin<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
-- vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>G', "<cmd>Telescope grep_string<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>Telescope help_tags<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>o', "<cmd>Telescope fd<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>O', ":tabnew<CR><cmd>Telescope fd<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>v', ":vsp<CR><cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader><Up>', "<cmd>Telescope command_history<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>Q', "<cmd>Telescope commands<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>q', "<cmd>Telescope quickfix<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>m', "<cmd>Telescope marks<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>i', "<cmd>Telescope symbols<CR>", opts)
