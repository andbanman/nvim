require('plugins')
require("nvim-tree").setup()
vim.cmd("colorscheme nightfox")

-- Git --
vim.cmd([[
  function! TreeIfGitRepo()
    if isdirectory('./.git')
      NvimTreeOpen
    end
  endfunction
  augroup git_repository
    autocmd!
    autocmd BufEnter * call TreeIfGitRepo()
  augroup end
]])
