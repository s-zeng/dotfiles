local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  -- command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
  command = '/usr/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python3'
    end;
  },
}

local maps = {
  n =    {
    ["<leader>bc"] = ":lua require'dap'.continue()<CR>",
    ["<leader>bs"] = ":lua require'dap'.step_over()<CR>",
    ["<leader>bSi"] = ":lua require'dap'.step_into()<CR>",
    ["<leader>bSo"] = ":lua require'dap'.step_out()<CR>",
    ["<leader>bb"] = ":lua require'dap'.toggle_breakpoint()<CR>",
    ["<leader>br"] = ":lua require'dap'.repl.open()<CR>",
    ["<leader>bR"] = ":lua require'dap'.run()<CR>",
    ["<leader>bl"] = ":lua require'dap'.run_last()<CR>",
  },
}

for mode, mappings in pairs(maps) do
  for keys, mapping in pairs(mappings) do
    if (type(mapping) == "table") then
      vim.api.nvim_set_keymap(mode, keys, mapping.map, mapping.opts)
    else
      vim.api.nvim_set_keymap(mode, keys, mapping, {noremap=true, silent=true})
    end
  end
end
