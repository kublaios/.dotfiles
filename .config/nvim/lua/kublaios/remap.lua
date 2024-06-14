local nnoremap = require("kublaios.keymap").nnoremap
local xnoremap = require("kublaios.keymap").xnoremap
nnoremap("<leader>q", "<cmd>Ex<CR>")

vim.cmd([[
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>rp :resize 100<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>tb :split term://zsh<CR>
nnoremap <leader>tv :vsplit term://zsh<CR>
tmap <leader>QQ <cmd>exit<CR>

nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>Q :q!<CR>

vnoremap <leader>y "*y<CR>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fG :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fF :execute 'Telescope find_files default_text=' . expand('<cword>')<cr>

nnoremap <silent> <leader>gg :LazyGit<CR>

inoremap <C-c> <ESC>
]])
