vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'christoomey/vim-tmux-navigator'
  use "mbbill/undotree"
  use "mattn/emmet-vim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'nvim-telescope/telescope.nvim', tag = '0.1.5',
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
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
  	"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use 'ThePrimeagen/git-worktree.nvim'

  -- For vsnip users.
  use "L3MON4D3/LuaSnip"
  use("saadparwaiz1/cmp_luasnip")
  use "rafamadriz/friendly-snippets"

  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'ap/vim-css-color' 

  use {
      "tpope/vim-dadbod",
      requires = { 
       "kristijanhusak/vim-dadbod-ui",  
       "kristijanhusak/vim-dadbod-completion" 
      },
      config = function()
        require("config.dadbod").setup()
      end,
  }
  -- use { 'tpope/vim-dadbod', lazy = true }
  -- use { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }
  -- use {
  --     'kristijanhusak/vim-dadbod-ui',
  --     cmd = {
  --       'DBUI',
  --       'DBUIToggle',
  --       'DBUIAddConnection',
  --       'DBUIFindBuffer',
  --     },
  --     init = function()
  --       -- Your DBUI configuration
  --       vim.g.db_ui_use_nerd_fonts = 1
  --     end,
  -- }
end)
