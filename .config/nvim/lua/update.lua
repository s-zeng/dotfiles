local api = vim.api
local fn = vim.fn
local luv = vim.loop

api.nvim_command('packadd packer.nvim')

local packer = require('packer')
local plugins = require('plugins')

packer.startup(function()
  for _, value in pairs(plugins) do
    packer.use(value)
  end
end)

vim.cmd [[PackerCompile]]
vim.cmd [[PackerSync]]
