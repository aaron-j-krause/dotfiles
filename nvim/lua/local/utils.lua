local M = {}

function M.config(name)
  return function ()
      print("NAME", name)
      require(string.format("local.plugins.%s", name))
    end
end

return M
