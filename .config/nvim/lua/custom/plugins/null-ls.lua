return {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "terraform", "tf", "terraform-vars"},
    opts = function ()
      return require "custom.configs.null-ls"
    end
  }


