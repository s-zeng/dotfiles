vim.cmd('packadd packer.nvim')

local packer = require('packer')
local plugins = require('plugins')

packer.startup(function()
  for _, value in pairs(plugins) do
    packer.use(value)
  end
end)

vim.cmd("PackerSync")
