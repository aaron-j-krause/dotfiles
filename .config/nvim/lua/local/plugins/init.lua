local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]
-- vim.cmd([[autocmd BufWritePost */plugins/*.lua luafile %]])
-- vim.cmd([[autocmd BufWritePost */plugins/*.lua source <afile> | PackerCompile]])

return require('packer').startup(
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'folke/lua-dev.nvim'
    use { 'mhartington/formatter.nvim',
      config = function()
        require 'local.plugins.formatter'
      end
    }

    use 'tpope/vim-characterize'

    use {
      'lukas-reineke/headlines.nvim',
      config = function()
        require('headlines').setup()
      end,
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua', config = function ()
    --  require 'sg'.setup()
    -- end }

    use { 'NvChad/nvim-colorizer.lua', config = function()
      require 'colorizer'.setup()
    end
    }
    use {
      'phaazon/hop.nvim',
      config = function()
        require 'hop'.setup()
      end
    }
    use {
      'shumphrey/fugitive-gitlab.vim',
      config = function()
        vim.cmd [[
          let g:fugitive_gitlab_domains = ['https://my.gitlab.com']
        ]]
      end
    }
    use { 'tpope/vim-abolish' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    --
    -- expects a global install of an npm package
    -- the package is called lua-fmt, the executable is luafmt
    -- npm i -g luafmt
    -- TODO: post install verify and or install of npm package
    use { 'neovim/nvim-lspconfig',

      config = function()
        require('local.plugins.lsp')
      end
    }


    use 'b0o/schemastore.nvim'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp',
      wants = { 'LuaSnip' },
      config = function()
        require 'local.plugins.cmp'
      end,
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        {
          'L3MON4D3/LuaSnip',
          wants = 'friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        'rafamadriz/friendly-snippets',
      }
    }
    -- Icons for Autocomplete
    use { 'onsails/lspkind-nvim',
      config = function()
        require 'lspkind'.init({
          preset = 'codicons'
        })
    end

    }
    use 'L3MON4D3/LuaSnip'
    use {
      'ellisonleao/gruvbox.nvim',
      config = function()
        vim.cmd [[
          set termguicolors
          let background='dark' 
          colorscheme gruvbox
        ]]
      end
    }
    -- use {
    --   'tanvirtin/monokai.nvim',
    --     config = function()
    --       require('monokai').setup { palette = require('monokai').pro }
    --   end
    -- }

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require 'local.plugins.treesitter'
      end
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require 'local.plugins.telescope'
      end,
      requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
      'nvim-telescope/telescope-fzy-native.nvim',
      after = 'telescope.nvim',
      config = function()
        require 'telescope'.load_extension 'fzy_native'
      end
    }

    use {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      config = function()
        require 'telescope'.load_extension 'frecency'
      end,
    }
    use {
        'kyazdani42/nvim-web-devicons',
        config= function ()
          require 'nvim-web-devicons'.setup()
        end
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require 'local.plugins.statusline'
      end
    }
    use {
      'jackMort/ChatGPT.nvim',
      config = function()
        require 'chatgpt'.setup()
      end,
      requires = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
      }
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function()
        require 'local.plugins.nvim-tree'
      end
    }

    use {
      'antosha417/nvim-lsp-file-operations',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-tree.lua',
      }
    }
    if packer_bootstrap then
      require('packer').sync()
    end
  end

)
