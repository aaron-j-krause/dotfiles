require("lualine").setup(
  {
    extensions = {"nerdtree"},
    options = {theme = "codedark"},
    sections = {
      lualine_b = {},
      lualine_x = {"filetype"},
      lualine_y = {"diff"},
      lualine_z = {"branch"}
    }
  }
)
