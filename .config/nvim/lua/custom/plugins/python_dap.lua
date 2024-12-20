return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function(_, _)
    vim.api.nvim_set_hl(0, "DapStopped", { bg = "#666666", bold = true })
    -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    local path = require("mason-registry").get_package("debugpy"):get_install_path()
    -- require("dap-python").setup(path .. "/venv/bin/python")
    require("dap-python").setup "/Users/fki/brew/bin/python3"
    require("dap-python").test_runner = "pytest"
    require("core.utils").load_mappings "dap_python"
    vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapStopped",
      { text = "⭐️", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
    )
  end,
}
