vim.cmd [[ colorscheme torte ]]

vim.cmd [[ hi LineNr ctermfg=darkgray ctermbg=NONE ]]
vim.cmd [[ hi DiffAdd ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffChange ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffDelete ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffText ctermfg=NONE ctermbg=NONE ]]

vim.cmd [[ set cursorline ]]
vim.cmd [[ set cursorcolumn ]]

-- Remove all background colors to make it transparent
vim.cmd [[ highlight Normal guibg=none ]]
vim.cmd [[ highlight NonText guibg=none ]]
vim.cmd [[ highlight Normal ctermbg=none ]]
vim.cmd [[ highlight NonText ctermbg=none ]]
