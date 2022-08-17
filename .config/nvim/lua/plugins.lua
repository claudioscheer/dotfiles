return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {
    'nvim-telescope/telescope.nvim', tag='0.1.0', 
    requires={
      {'nvim-lua/plenary.nvim'}
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter', run=':TSUpdate'
  }
  use 'sainnhe/gruvbox-material'
  use 'tpope/vim-fugitive'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'sbdchd/neoformat'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'lambdalisue/fern.vim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'yuki-yano/fern-preview.vim'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
end)
