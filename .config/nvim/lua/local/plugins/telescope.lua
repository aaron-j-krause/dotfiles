local telescope = require "telescope"

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-f>"] = require('telescope.actions').add_selected_to_qflist
      },
    }

  },
}

vim.cmd [[
  nnoremap <silent> <leader>t :Telescope find_files<cr>
  nnoremap <silent> <leader>g :Telescope live_grep<cr>
  nnoremap <silent> ; :Telescope buffers<cr>
]]
