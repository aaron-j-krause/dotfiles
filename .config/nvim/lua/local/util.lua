local Util = {}

Util.genKeyMapper = function(mode)
  return function(ls)
    return function(rs)
      return function(opts)
        opts = opts or {}

        vim.api.nvim_set_keymap(mode, ls, rs, opts)
      end
    end
  end
end

function Util:config(name)
  return function()
    print("NAME", name)
    require(string.format("local.plugins.%s", name))
  end
end

return Util
