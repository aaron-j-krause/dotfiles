-- globals
vim.g["prettier#autoformat"] = 0
-- turning off netrw recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use bash instead of zsh for vim stuff
vim.opt.shell = "/bin/bash"

-- use system clipboard
vim.opt.clipboard:prepend "unnamed,unnamedplus"
-- one line command line
vim.opt.cmdheight = 1
-- hide buffers instead of closing
vim.opt.hidden = true
-- don't highlight current cursor line
vim.opt.cursorline = false
-- don't show line and colum in status
vim.opt.ruler = false
-- disable line numbers
vim.opt.number = false
-- don't show last command
vim.opt.showcmd = false
-- don't show the mode (handled by lualine)
vim.opt.showmode = false
-- don't wrap text by default
vim.opt.wrap = false
-- take out unhelpful completeion messages
vim.opt.shortmess:append "c"

vim.opt.mouse = "a"

-- Tabs
-- 2 space soft tabs by default
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- open splits to the right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true
