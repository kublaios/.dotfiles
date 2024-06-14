-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use 'github/copilot.vim'
  use 'folke/twilight.nvim'
  use {'kdheepak/lazygit.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {'neoclide/coc.nvim', branch = 'release'}
end)
