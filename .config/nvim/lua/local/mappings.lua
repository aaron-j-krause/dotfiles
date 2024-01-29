Util = require "local.util"

local nmap = Util.genKeyMapper("n")
local vmap = Util.genKeyMapper("v")
local xmap = Util.genKeyMapper("x")
local omap = Util.genKeyMapper("o")

-- fat finger forgiveness
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wqa wqa")

vim.cmd("cnoreabbrev Vsp vsp")
vim.cmd("cnoreabbrev Sp sp")

-- navigate windows
nmap "<C-j>" "<C-w>j" { noremap = true }
nmap "<C-k>" "<C-w>k" { noremap = true }
nmap "<C-h>" "<C-w>h" { noremap = true }
nmap "<C-l>" "<C-w>l" { noremap = true }

-- clear highlights
nmap "<leader>/" ":nohlsearch<CR>" { silent = true }

-- close quickfix list
nmap "<leader>c" ":ccl<CR>" { silent = true }

-- Paste over something without copying it to the default buffer
vmap "p" '"_dp' { noremap = true }

-- format current file
nmap "<leader>." ":Format<CR>" { noremap = true, silent = true }

-- motion
nmap "<leader>w" ":HopWord<CR>" {}

xmap "<" "<gv" { noremap = true }
xmap ">" ">gv|" { noremap = true }


-- Use tab for indenting in visual/select mode
xmap "<Tab>" ">gv|" { noremap = true }
xmap "<S-Tab>" "<gv" { noremap = true }

-- Drag current line/s vertically and auto-indent
nmap "<Leader>k" ":m-2<CR>" { noremap = true }
nmap "<Leader>j" ":m+<CR>" { noremap = true }
vmap "<Leader>k" ":m'<-2<CR>gv=gv" { noremap = true }
vmap "<Leader>j" ":m'>+<CR>gv=gv" { noremap = true }

xmap "il" "g_o^" { noremap = true }
omap "il" ":normal vil<CR>"{ noremap = true }
xmap "al" "$iw^" { noremap = true }
omap "al" ":normal val<CR>"{ noremap = true }

nmap "<Leader>qn" ":cn<CR>" { noremap = true }


-- paste formatted
nmap "<Leader>p" ":put =@<CR>" {noremap = true}


-- maps "dd" while in the quickfix list to removing a quickfix item
-- from https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
-- quickfix list delete keymap
-- function Remove_qf_item()
--   local curqfidx = vim.fn.line('.')
--   local qfall = vim.fn.getqflist()

--   -- Return if there are no items to remove
--   if #qfall == 0 then return end

--   -- Remove the item from the quickfix list
--   table.remove(qfall, curqfidx)
--   vim.fn.setqflist(qfall, 'r')

--   -- Reopen quickfix window to refresh the list
--   vim.cmd('copen')

--   -- If not at the end of the list, stay at the same index, otherwise, go one up.
--   local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

--   -- Set the cursor position directly in the quickfix window
--   local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
--   vim.api.nvim_win_set_cursor(winid, {new_idx, 0})
-- end

-- vim.cmd("command! RemoveQFItem lua Remove_qf_item()")
-- vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>")

