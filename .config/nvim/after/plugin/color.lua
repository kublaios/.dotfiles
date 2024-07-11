vim.cmd [[ set background=light ]]
vim.cmd [[ colorscheme slate ]]

-- set statusline color to red
vim.cmd [[ hi StatusLine ctermfg=15 ctermbg=0 ]]
-- set gutter color to black
vim.cmd [[ hi SignColumn ctermbg=233 ]]

vim.cmd [[ hi LineNr ctermfg=darkgray ctermbg=NONE ]]
vim.cmd [[ hi DiffAdd ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffChange ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffDelete ctermfg=NONE ctermbg=NONE ]]
vim.cmd [[ hi DiffText ctermfg=NONE ctermbg=NONE ]]

vim.cmd [[ hi Twilight ctermfg=8 ]]

vim.cmd [[ set cursorline ]]
vim.cmd [[ hi CursorLine ctermfg=White ctermbg=131 cterm=bold guifg=white guibg=yellow gui=bold ]]
vim.cmd [[ set cursorcolumn ]]
vim.cmd [[ hi CursorColumn ctermfg=White ctermbg=131 cterm=bold guifg=white guibg=yellow gui=bold ]]
