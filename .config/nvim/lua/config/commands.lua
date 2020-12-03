local commands = {
  Reverse = {opts = "-bar -range=%", cmd = "<line1>,<line2>g/^/m<line1>-1|nohl"},
  Json = {opts = "", cmd = "execute '%!python -m json.tool --sort-keys'"},
  PackUp = {opts = "-nargs=0", cmd = "lua require('update')"},
}

-- TODO: wait on https://github.com/neovim/neovim/pull/11613
for name, cmd in pairs(commands) do
  vim.cmd("command! " .. cmd.opts .. " " .. name .. " " .. cmd.cmd)
end
