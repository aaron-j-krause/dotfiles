local prettier = {
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
      stdin = true
    }
  end
}

local clang = {
  function()
    return {
      exe = "clang-format",
      args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
      stdin = true,
      cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
    }
  end
}

local format = require("formatter")

format.setup(
  {
    logging = false,
    filetype = {
      javascript = prettier,
      typescript = prettier,
      ["typescript.tsx"] = prettier,
      ["javascript.jsx"] = prettier,
      json = prettier,
      yaml = prettier,
      markdown = prettier,
      html = prettier,
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      cpp = clang,
      c = clang
    }
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.lua",
    callback = function()
      vim.cmd ":FormatWrite"
    end
  }
)
