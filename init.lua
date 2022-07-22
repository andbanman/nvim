require('plugins')
require("nvim-tree").setup()
vim.cmd("colorscheme nightfox")

-- Bash --
vim.cmd("set shellcmdflag=-ic")

-- NVim-Tree --
vim.api.nvim_set_keymap('n', 'tt', ':NvimTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', 'tr', ':NvimTreeRefresh<CR>', {})

-- Git --
vim.cmd([[
  function! TreeIfGitRepo()
    if isdirectory('.git')
      if expand('%:h') != '.git'
        NvimTreeOpen
      end
    end
  endfunction
  augroup git_repository
    autocmd!
    autocmd VimEnter * call TreeIfGitRepo()
  augroup end
]])
