require("kublaios.set")
require("kublaios.packer")
require("kublaios.remap")
require("kublaios.telescope")

require("oil").setup({
    columns = { "icon" },
    default_file_explorer = false,
    view_options = {
        show_hidden = true
    }
})

local wk = require("which-key")
wk.setup {
    plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true,    -- adds help for operators like d, y, ...
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
}
wk.add({
    { "<leader>f", group = "flash" },
    { "<leader>fr", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>fR", function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
    { "<leader>s", function() require("flash").jump() end, desc = "Flash Jump" },
    { "<leader>S", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "_", function() require("oil").open_float() end, desc = "Open Oil in floating window" }
})

require("flash").setup({})
require("twilight").setup({
  dimming = {
    alpha = 0.65,
  },
})

vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.cmd([[
" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
]])
