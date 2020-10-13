require('telescope').setup{
  defaults = {
      use_less = true
  }
}


local opts = { noremap=true }
-- vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd>lua require('telescope.builtin').quickfix{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').telescopes{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>?', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('telescope.builtin').live_grep{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>G', "<cmd>lua require('telescope.builtin').grep_string{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('telescope.builtin').help_tags{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>o', "<cmd>lua require('telescope.builtin').find_files{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>O', ":tabnew<CR><cmd>lua require('telescope.builtin').find_files{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>v', ":vsp<CR><cmd>lua require('telescope.builtin').find_files{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader><Up>', "<cmd>lua require('telescope.builtin').command_history{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>Q', "<cmd>lua require('telescope.builtin').commands{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>q', "<cmd>lua require('telescope.builtin').quickfix{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>a', "<cmd>lua require('telescope.builtin').lsp_code_actions{}<CR>", opts)
-- nnoremap <Leader>m :Clap marks<CR>
