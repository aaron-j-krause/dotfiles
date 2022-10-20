scriptencoding utf-8

let p = expand($DOT_PATH)

lua << EOF
  require'local/plugins'
EOF


 exec 'source' p . '/nvim/main.vim'
 exec 'source' p . '/nvim/mappings.vim'

exec 'source' p . '/nvim/coc-mappings.vim'
