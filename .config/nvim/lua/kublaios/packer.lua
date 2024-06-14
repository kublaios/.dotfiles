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
--            ["<tab>"] = cmp.mapping(function(original)
--                if cmp.visible() then
--                    cmp.select_next_item() -- run completion selection if completing
--                else
--                    original()      -- run the original behavior if not completing
--                end
--            end, {"i", "s"}),
        }),
      }
      cmp.setup(opts)
    end,
  }
  use {
    "wojciech-kulik/xcodebuild.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup()

      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
      vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
      vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
    end,
  }
end)
