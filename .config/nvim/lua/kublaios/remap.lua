local nnoremap = require("kublaios.keymap").nnoremap
local xnoremap = require("kublaios.keymap").xnoremap

vim.cmd([[
nnoremap = :Oil<CR>
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

nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>q <cmd>Ex<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq!<CR>

vnoremap <leader>y "*y<CR>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fG :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fF :execute 'Telescope find_files default_text=' . expand('<cword>')<cr>

nnoremap <silent> <leader>gg :LazyGit<CR>

" Prompt for a command to run map
map <leader>vc :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane map
map <leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <leader>vk :VimuxClearTerminalScreen<CR>
map <leader>vq :VimuxCloseRunner<CR>
" Vimux Swift commands
map <leader>sb :VimuxPromptCommand("swift build")<CR>
map <leader>sr :VimuxPromptCommand("swift run")<CR>
map <leader>st :VimuxPromptCommand("swift test")<CR>
map <leader>sc :VimuxPromptCommand("swift package clean")<CR>
map <leader>sct :VimuxPromptCommand("swift package clean && swift test")<CR>

inoremap <C-c> <ESC>
]])
