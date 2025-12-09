-- require('/~/.config/omarchy/current/theme/neovim')
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


local themePacker = require('neovim')

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
	    "ThePrimeagen/harpoon",
	    branch = "harpoon2",
	    requires = { {"nvim-lua/plenary.nvim"} }
	}

	use 'nvim-treesitter/nvim-treesitter'

	use 'norcalli/nvim-colorizer.lua'

  use {
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-mini/mini.nvim', opt = true },            -- if you use the mini.nvim suite
    -- requires = { 'nvim-mini/mini.icons', opt = true },        -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup({})
    end,
  }

  use {
    'Thiago4532/mdmath.nvim',
    config = function()
      require('mdmath').config({})
    end,
    opts = {
      dynamic = false;
    },
  }

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  use {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "magick" }
    }
  }

  use {
    "3rd/image.nvim",
    requires = { "vhyrro/luarocks.nvim" }
  }

  themePacker(use)
end)

require('mdmath').build()

require('colorizer').setup()

require('nvim-treesitter.configs').setup({

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

require("image").setup({})
