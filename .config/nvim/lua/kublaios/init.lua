require("kublaios.set")
require("kublaios.packer")
require("kublaios.remap")
require("kublaios.telescope")

vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.cmd([[

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

]])
