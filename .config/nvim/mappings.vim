" fat finger forgiveness
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa

" navigate windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" little jumps
:nnoremap _ 10k
:nnoremap + 10j

" big jumps
noremap <Space> <PageDown>
noremap - <PageUp>
" Format current file
nnoremap <silent> <leader>. :Format<CR>

" Nerdtree shorcuts
" Toggle NERDTree
nmap <leader>n :NERDTreeToggle<CR>
" Open current location in NERDTree
nmap <leader>f :NERDTreeFind<CR>


" find and replace
map <leader>h :%s///<left><left>
" clear highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" Motion
map <leader>w :HopWord<CR>
hi! HopNextKey guifg=yellow
hi! HopNextKey1 guifg=yellow
hi! HopNextKey2 guifg=yellow

" Paste over something without copying it to the default buffer
vnoremap p "_dp

" Re-select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual/select mode
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv

" Drag current line/s vertically and auto-indent
nnoremap <Leader>k :m-2<CR>
nnoremap <Leader>j :m+<CR>
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv

" Telescope
nnoremap <silent> <leader>t :Telescope find_files<cr>
nnoremap <silent> <leader>g :Telescope live_grep<cr>
nnoremap <silent> ; :Telescope buffers<cr>

noremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
noremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
noremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


