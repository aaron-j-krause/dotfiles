require "nvim-tree".setup(
  {
    actions = {open_file = {quit_on_open = true}}
  }
)
local Util = require "local.util"
local nmap = Util.genKeyMapper("n")

nmap "<Leader>n" ":NvimTreeToggle<CR>" {silent = true}
nmap "<Leader>n" ":NvimTreeToggle<CR>" {silent = true}
nmap "<Leader>f" ":NvimTreeFindFile<CR>" {silent = true}
