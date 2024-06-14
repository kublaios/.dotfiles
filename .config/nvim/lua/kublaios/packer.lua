-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use 'github/copilot.vim'
  use 'folke/twilight.nvim'
  use 'folke/which-key.nvim'
  use 'folke/flash.nvim'
  use {'kdheepak/lazygit.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig['sourcekit'].setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Actions',
        callback = function(args)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
        end,
      })
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter" },
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" },
      { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
      { 'hrsh7th/cmp-path', after = "nvim-cmp" },
    },
    config = function()
      local cmp = require('cmp')
      local opts = {
        -- Where to get completion results from
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        -- Make 'enter' key select the completion
        mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<tab>"] = cmp.mapping(function(original)
                if cmp.visible() then
                    cmp.select_next_item() -- run completion selection if completing
                else
                    original()      -- run the original behavior if not completing
                end
            end, {"i", "s"}),
        }),
      }
      cmp.setup(opts)
    end,
  }
end)
