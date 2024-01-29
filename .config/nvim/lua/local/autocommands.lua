-- use :make to run tsc and put errors in quickfix list
-- TODO: lua
vim.cmd [[
    autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=npx\ tsc
]]

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.lua",
    callback = function()
      vim.cmd ":FormatWrite"
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    -- is this redundant?
    pattern = "*",
    callback = function()
      vim.cmd('if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')
    end
  }
)

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern = "*.md",
    callback = function()
      vim.api.nvim_buf_set_option(0, "filetype", "markdown")
      vim.cmd('setlocal textwidth=80')
    end
  }
)

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern = ".{eslint,prettier}rc",
    callback = function()
      vim.api.nvim_buf_set_option(0, "filetype", "json")
    end
  }
)

