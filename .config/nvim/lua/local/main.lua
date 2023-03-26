_, Set = unpack(require "local.util")

vim.g.mapleader = ","

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.api.nvim_command("packadd", "packer.nvim")
end

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
-- don't show the mode (handled by statusline)
vim.opt.showmode = false
-- don't wrap text by default
vim.opt.wrap = false
-- take out unhelpful completion messages
vim.opt.shortmess:append "c"
-- ignore case when searching
vim.opt.ignorecase = true
-- if the search string has an upper case letter in it, the search will be case sensitive
vim.opt.smartcase = true
-- Automatically re-read file if a change was detected outside of vi m
vim.opt.autoread = true
-- Enable line numbers
vim.opt.number = true

-- Tabs
-- 2 space soft tabs by default
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- open splits to the right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.mouse = "a"

-- Don't put backups in current dir
vim.opt.backupdir = vim.fn.stdpath("data") .. "/share/nvim/backup"
vim.opt.backup = true
vim.opt.swapfile = false

-- autocomplete/cmp
-- vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.undoreload = 10000

vim.opt.termguicolors = true
vim.cmd([[let &t_8f = "\e[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\e[48;2;%lu;%lu;%lum"]])
