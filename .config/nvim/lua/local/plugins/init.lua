vim.cmd [[packadd packer.nvim]]
-- vim.cmd([[autocmd BufWritePost */plugins/*.lua luafile %]])
vim.cmd([[autocmd BufWritePost */plugins/*.lua source <afile> | PackerCompile]])

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use {
      "neoclide/coc.nvim",
      branch = "release"
    }
    use "tpope/vim-fugitive"
    use "tpope/vim-commentary"
    use "folke/lua-dev.nvim"

    use {
      "phaazon/hop.nvim",
      config = function()
        require "hop".setup()
      end
    }

    -- expects a global install of an npm package
    -- the package is called lua-fmt, the executable is luafmt
    -- npm i -g luafmt
    -- TODO: post install verify and or install of npm package
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("local.plugins.formatter")
      end
    }
    -- use {"neovim/nvim-lspconfig"}

    use "tpope/vim-surround"
    use "lukas-reineke/indent-blankline.nvim"

    -- Autocomplete
    -- use {"hrsh7th/nvim-cmp"}
    -- use {"hrsh7th/cmp-nvim-lsp"}
    -- use {"hrsh7th/cmp-buffer"}

    -- Icons for Autocomplete
    -- use "onsails/lspkind-nvim"

    -- Snippet Engine
    -- use "L3MON4D3/LuaSnip"
    use {
      "ellisonleao/gruvbox.nvim",
      config = function()
        vim.cmd [[
          set termguicolors
          let background="dark" 
          colorscheme gruvbox
        ]]
      end
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "local.plugins.treesitter"
      end
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"

    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "local.plugins.telescope"
      end,
      requires = {"nvim-lua/plenary.nvim"}
    }

    use {
      "nvim-telescope/telescope-fzy-native.nvim",
      after = "telescope.nvim",
      config = function()
        require "telescope".load_extension "fzy_native"
      end
    }

    use {
      "nvim-telescope/telescope-frecency.nvim",
      after = "telescope.nvim",
      config = function()
        require "telescope".load_extension "frecency"
      end,
      requires = {"tami5/sqlite.lua"}
    }
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function()
        require "local.plugins.statusline"
      end
    }
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require "local.plugins.nvim-tree"
      end
    }
  end
)
