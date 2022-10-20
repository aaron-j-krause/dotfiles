Util = require "local.util"

local nmap = Util.genKeyMapper("n")
local vmap = Util.genKeyMapper("v")
local xmap = Util.genKeyMapper("x")

-- fat finger forgiveness
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall qall")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wqa wqa")

-- navigate windows
nmap "<C-j>" "<C-w>j" {noremap = true}
nmap "<C-k>" "<C-w>k" {noremap = true}
nmap "<C-h>" "<C-w>h" {noremap = true}
nmap "<C-l>" "<C-w>l" {noremap = true}

-- clear highlights
nmap "<leader>/" ":nohlsearch<CR>" {silent = true}

-- format current file
nmap "<Leader>." ":Format<CR>" {noremap = true, silent = true}

-- this doesn't seem to work
-- Paste over something without copying it to the default buffer
vmap "p" '"_dp' {noremap = true}

-- format current file
nmap "<leader>." ":Format<CR>" {noremap = true, silent = true}

-- motion
nmap "<leader>w" ":HopWord<CR>" {}

xmap "<" "<gv" {noremap = true}
xmap ">" ">gv|" {noremap = true}

-- Use tab for indenting in visual/select mode
xmap "<Tab>" ">gv|" {noremap = true}
xmap "<S-Tab>" "<gv" {noremap = true}

-- Drag current line/s vertically and auto-indent
nmap "<Leader>k" ":m-2<CR>" {noremap = true}
nmap "<Leader>j" ":m+<CR>" {noremap = true}
vmap "<Leader>k" ":m'<-2<CR>gv=gv" {noremap = true}
vmap "<Leader>j" ":m'>+<CR>gv=gv" {noremap = true}
