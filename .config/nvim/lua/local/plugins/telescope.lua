local Util = require "local.util"
local telescope = require "telescope"

local nmap = Util.genKeyMapper("n")

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
      "--trim" -- add this value
    }
  }
}

vim.cmd [[
nnoremap <silent> <leader>t :Telescope find_files<cr>
nnoremap <silent> <leader>g :Telescope live_grep<cr>
nnoremap <silent> ; :Telescope buffers<cr>
]]
