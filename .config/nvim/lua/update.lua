local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local plugins = require('plugins')

packer.startup({plugins, config={display={open_fn=require('packer.util').float}}})

vim.cmd("PackerSync")
-- vim.cmd("TSUpdate")
