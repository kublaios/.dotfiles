require("kublaios.set")
require("kublaios.packer")
require("kublaios.remap")
require("kublaios.coc")

vim.wo.relativenumber = true

vim.cmd([[
" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" swift.vim
" swiftpm is disabled because it slows things down tremendously
" let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:syntastic_swift_checkers = ['swiftlint']
]])
