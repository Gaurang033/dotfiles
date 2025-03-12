local plugins = {
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      -- require("core.utils").load_mappings "dap_go"
      require("core.utils").load_mappings "dap_ui"
      require "custom.config.js_dap"
    end,
  },
}

return plugins
