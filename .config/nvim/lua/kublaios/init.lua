require("kublaios.set")
require("kublaios.packer")
require("kublaios.remap")

vim.wo.relativenumber = true

vim.cmd([[

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

]])
