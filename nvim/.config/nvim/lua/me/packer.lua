vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/vscode.nvim'
  use {
      "catppuccin/nvim"
      -- as = "catppuccin",
      -- config = function()
      --     require("catppuccin").setup {
      --         flavour = "macchiato" -- mocha, macchiato, frappe, latte
      --     }
          -- vim.api.nvim_command "colorscheme catppuccin"
      -- end
  }
  use "lunarvim/colorschemes"
  use 'christoomey/vim-tmux-navigator'
  use "mbbill/undotree"
  use "mattn/emmet-vim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'numToStr/Comment.nvim'                                                          -- "gc" to comment visual regions/lines
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use {
  	"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  use 'ThePrimeagen/harpoon'

  -- For vsnip users.
  use "L3MON4D3/LuaSnip"
  use("saadparwaiz1/cmp_luasnip")
  use "rafamadriz/friendly-snippets"

  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'ap/vim-css-color' 
end)
