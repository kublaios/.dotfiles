-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use 'stevearc/oil.nvim'
  use 'github/copilot.vim'
  use 'folke/twilight.nvim'
  use 'folke/which-key.nvim'
  use 'echasnovski/mini.icons' -- which-key dependency
  use 'nvim-tree/nvim-web-devicons' -- which-key dependency
  use 'folke/flash.nvim'
  use {
    "wojciech-kulik/xcodebuild.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup()

      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild actions" })
      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild logs" })
      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build project" })
      vim.keymap.set("n", "<leader>R", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & run project" })
      vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildCancel<cr>", { desc = "Cancel running action" })
      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run tests" })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run this test class" })
      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select device" })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select test plan" })
      vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle code coverage" })
      vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show code coverage report" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show quickFix list" })
    end,
  }
end)
