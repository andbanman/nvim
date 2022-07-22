require('plugins')
require("nvim-tree").setup()
vim.cmd("colorscheme nightfox")

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
