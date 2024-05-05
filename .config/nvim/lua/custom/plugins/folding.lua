local plugins = {
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  },
  {
    'anuvyklack/fold-preview.nvim',
    event = "VeryLazy",
    dependencies = { 'anuvyklack/keymap-amend.nvim' },
    config = function()
      require('fold-preview').setup({
        -- Your configuration goes here.
      })
    end
  }
}

return plugins
