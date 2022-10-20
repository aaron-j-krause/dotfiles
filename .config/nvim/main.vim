scriptencoding utf-8

let path = expand($DOT_PATH)

" Editor
let g:mapleader=','

lua << EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
EOF

" use system clipboard
set clipboard^=unnamed,unnamedplus
" one line command line
set cmdheight=1
" hide buffers instead of closing
set hidden
" don't highlight current cursor line
set nocursorline
" don't show line and colum in status
set noruler
" disable line numbers
set nonumber
" don't show last command
set noshowcmd
" don't show the mode (handled by lualine)
set noshowmode
" don't wrap text by default
set nowrap
" take out unhelpful completeion messages
set shortmess+=c

" Tabs
" 2 space soft tabs by default
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2

" open splits to the right and bottom
set splitbelow
set splitright

" list highligts for themeing
command ListHighlights :so $VIMRUNTIME/syntax/hitest.vim

let g:jsx_ext_required = 0
let g:coc_node_path = $HOME."/.nvm/versions/node/v15.3.0/bin/node"

" Run Format on save
let g:prettier#autoformat = 0
autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql :FormatWrite
autocmd BufNewFile,BufRead *.tsx set ft=typescript.tsx

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.tsx,*.lua FormatWrite
augroup END
:set mouse=a

let g:mkdp_path_to_chrome = "/Applications/Google\\ Chro?me.app/Contents/MacOS/Google\\ Chrome"
let g:NERDTreeMinimalUI = 1

" NERDTree
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" treesitter folding
" TODO: don't love the UI, investigate
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" set foldnestmax=1

" lua << EOF
" vim.o.termguicolors = true
" vim.g.neon_style = "dark"
" vim.g.neon_italic_keyword = true
" vim.g.neon_italic_function = true
" vim.g.sonokai_enable_italic = true
" EOF
" let g:sonokai_better_performance = 1

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vi m
set autoread

" Enable line numbers
set number

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" autocomplete/cmp
set completeopt=menu,menuone,noselect

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .{eslint,prettier}rc set filetype=json
