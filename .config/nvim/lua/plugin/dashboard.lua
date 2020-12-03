vim.g.dashboard_default_executive = 'telescope'

vim.api.nvim_set_keymap('n', '<leader>ss', ":<C-u>SessionSave<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>sl', ":<C-u>SessionLoad<CR>", {})

local opts = {noremap=true, silent=true}

vim.api.nvim_set_keymap('n', "<Leader>fh", ":DashboardFindHistory<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>tc", ":DashboardChangeColorscheme<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fb", ":DashboardJumpMark<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>cn", ":DashboardNewFile<CR>", opts)

vim.g.dashboard_custom_shortcut = {
  last_session = "SPC s l",
  find_history = "SPC f h",
  find_file = "SPC o  ",
  new_file = "SPC c n",
  change_colorscheme = "SPC t c",
  find_word = "SPC g  ",
  book_marks = "SPC f b"
}


vim.cmd("autocmd WinLeave <buffer> set number relativenumber")
