local plugins = {
  {
    "BurntSushi/ripgrep",
  },
  { "nvim-neotest/nvim-nio", },
  {
  "catppuccin/nvim",
  lazy=false,
  name="catppuccine",
  priority = 1000,
  config = function ()
    vim.cmd.colorscheme  "catppuccin"
  end
}
}

return plugins

