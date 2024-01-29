-- TODO: check in on yaml indentation
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1377
require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "bash",
    "lua",
    "python",
    "json",
    "yaml",
    "regex",
    "vue",
    "markdown",
    "vimdoc"
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      }
    }
  }
}
