local plugins = {
  {
    "williamboman/mason.nvim",
    opts={
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "terraform-ls"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
      },
    },
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "terraform", "tf", "terraform-vars"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function (_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require('dap-python').test_runner = 'pytest'
      require("core.utils").load_mappings("dap_python")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function ()
      require("core.utils").load_mappings("dap_ui")
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function ()
        -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function ()
        -- dapui.close()
      -- end
    end
  },
  {
    "BurntSushi/ripgrep",
  },
  { "nvim-neotest/nvim-nio", },

  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("core.utils").load_mappings("gitsigns")
      require("gitsigns").setup()
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
  {
  "catppuccin/nvim",
  lazy=false,
  name="catppuccine",
  priority = 1000,
  config = function ()
    vim.cmd.colorscheme  "catppuccin"
  end
},
  {
   "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    end
  }
}
return plugins

