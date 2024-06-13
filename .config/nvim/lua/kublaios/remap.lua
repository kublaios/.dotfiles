local nnoremap = require("kublaios.keymap").nnoremap
local xnoremap = require("kublaios.keymap").xnoremap
nnoremap("<leader>q", "<cmd>Ex<CR>")
xnoremap("<leader>p", "\"_dP")

vim.cmd([[
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>rp :resize 100<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>Q :q!<CR>

vnoremap <leader>y "*y<CR>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>

nnoremap <silent> <leader>gg :LazyGit<CR>
]])
