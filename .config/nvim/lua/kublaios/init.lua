require("kublaios.set")
require("kublaios.packer")
require("kublaios.remap")

vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.cmd([[

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

]])
