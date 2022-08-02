vim.cmd [[packadd packer.nvim]]

-- automatically update plugins when after editing this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'rstacruz/vim-closer'
  use 'andymass/vim-matchup'
  use 'EdenEast/nightfox.nvim'
  use 'airblade/vim-gitgutter'
  use 'preservim/tagbar'
  use 'wincent/command-t'
  use 'nvim-lualine/lualine.nvim'

  -- Code completion
  use {'neoclide/coc.nvim', branch = 'release'} -- reqs: node, yarn

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
       -- Needs a font with icons, e.g. NerdFonts.com
       --   brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-nerd-font
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
