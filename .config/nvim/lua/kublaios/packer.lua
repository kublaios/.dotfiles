-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = {{'nvim-lua/plenary.nvim'}}}
  use 'github/copilot.vim'
  use 'folke/tokyonight.nvim'
end)
