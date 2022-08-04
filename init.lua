require('plugins')
require("nvim-tree").setup()
require('lualine').setup()

vim.cmd("colorscheme terafox")
vim.opt.number = true

-- enable mouse for window navigation and opening up visual mode on text
vim.opt.mouse = "n"

-- default tab options
local indentlen = 2
vim.opt.expandtab = true
vim.opt.tabstop = indentlen
vim.opt.softtabstop = indentlen
vim.opt.shiftwidth = indentlen

-- Add aliases to external command shell
-- vim.env.BASH_ENV = "/home/abanman/.bash_aliases" -- not working

-- NVim-Tree --
vim.api.nvim_set_keymap('n', 'tt', ':lua require"nvim-tree".toggle(false, true)<CR>', {})
vim.cmd([[
  function! NvimTreeIfNotGit()
    if &ft !~ 'git.*'
      lua require"nvim-tree".toggle(false, true)
    end
  endfunction
  augroup ag_nvim_tree
    autocmd!
    autocmd VimEnter * call NvimTreeIfNotGit()
    autocmd BufWritePost * NvimTreeRefresh
  augroup end
]])

-- Highlight trailing whitespace
vim.cmd([[
  highlight RedundantSpaces ctermbg=red guibg=red
  match RedundantSpaces /\s\+$/
]])
