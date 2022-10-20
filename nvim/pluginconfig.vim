" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" Grepping Config
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
" use ripgrep
call denite#custom#var('grep', 'command', ['rg'])
" ripgrep options
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Denite List Config
" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
" open splits from denite list
call denite#custom#map('insert,normal', "<C_v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C_h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'htmlTagName',
\ 'highlight_filter_background': 'Directory',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'floating_preview': 1,
\ 'floating_border': 'rounded',
\
\ 'preview_width': 100,
\
\ 'wincol': 18,
\ 'winwidth': float2nr(round(&columns * 0.8))
\ }}

autocmd User denite-preview call s:denite_preview()
function! s:denite_preview() abort
  setlocal number
endfunction

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

