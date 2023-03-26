local cmp = require "cmp"
local lspkind = require 'lspkind';


cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', maxwidth = 50, ellipsis_char = '...',
    })
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end,
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  ['<Esc>'] = function(fallback)
    if cmp.visible() then
      cmp.close(function()
        vim.cmd('stopinsert')
      end)
    else
      fallback()
    end
  end
}

-- dont remember what this is for
vim.cmd [[
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
