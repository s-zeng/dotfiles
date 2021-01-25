local maps = {
  n =    {
    ["<F10>"] = ":10sp term://fish<CR>i",
    ["<F12>"] = ":make<CR>",
    ["<F1>"] = "<nop>",
    ["<F8>"] = ":NvimTreeToggle<CR>",
    ["<F9>"] = ":Vista!!<CR>",
    ["<c-h>"] = "<c-w>h",
    ["<c-i>"] = [[:exec "normal a".nr2char(getchar())."\e"<CR>]],
    ["<c-j>"] = "<c-w>j",
    ["<c-k>"] = "<c-w>k",
    ["<c-l>"] = "<c-w>l",
    ["<leader>c"] = ":noh<CR>hl",
    ["<leader>d"] = ":lcd %:p:h<CR>",
    ["<leader>r"] = ":checktime<CR>",
    ["<leader>t0"] = ":tablast<cr>",
    ["<leader>t1"] = "1gt",
    ["<leader>t2"] = "2gt",
    ["<leader>t3"] = "3gt",
    ["<leader>t4"] = "4gt",
    ["<leader>t5"] = "5gt",
    ["<leader>t6"] = "6gt",
    ["<leader>t7"] = "7gt",
    ["<leader>t8"] = "8gt",
    ["<leader>t9"] = "9gt",
    ["<leader>t<Tab>"] = {map=':exe "tabn ".g:lasttab<cr>', opts={noremap=true, silent=true}},
    ["H"] = "0",
    ["L"] = "$",
    ["Q"] = "<nop>",
    ["`"] = "<cmd>lua require'lib/float'()<CR>",
    ["gj"] = "j",
    ["gk"] = "k",
    ["j"] = "gj",
    ["k"] = "gk",
  },
  i = {
    ["<S-Tab>"] = {map=[[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], opts={noremap=true, expr=true}},
    ["<Tab>"] = {map=[[pumvisible() ? "\<C-n>" : "\<Tab>"]], opts={noremap=true, expr=true}},
    ["<c-c>"] = "<ESC>",
    ["<cr>"] = {map=[[pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"]], opts={noremap=true, expr=true}},
    ["jjfa"] = '∀',
    ["jjla"] = 'λ',
    ["jjra"] = '→',
    ["kj"] = '<ESC>',
  },
  t = {
    ["<Esc>"] = [[<C-\><C-n>]],
  },
  c = {
    ["w!!"] = {map="w !sudo sponge %", opts={}}
  }
}

for mode, mappings in pairs(maps) do
  for keys, mapping in pairs(mappings) do
    if (type(mapping) == "table") then
      vim.api.nvim_set_keymap(mode, keys, mapping.map, mapping.opts)
    else
      vim.api.nvim_set_keymap(mode, keys, mapping, {noremap=true})
    end
  end
end
