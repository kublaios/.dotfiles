vim.g.mapleader = " "

-- Temporarily silence noisy plugin deprecation warnings until upstream fixes land.
if vim.fn.has("nvim-0.11") == 1 then
    vim.deprecate = function() end
end

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- always show the sign column to avoid screen flickering for lsp errors
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
-- vim.opt.termguicolors = true
-- vim.opt.guicursor = ""

vim.opt.wrap = false

vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.mouse = ''
