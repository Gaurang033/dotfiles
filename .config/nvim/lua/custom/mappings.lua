local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end
    }
  }
}

M.dap_ui = {
  plugin=true,
  n={
    ["<leader>dt"] = {
      function ()
        require("dapui").toggle()
      end
    }
  }
}

M.gitsings = {
  n = {
    ["<leader>gp"] = {"<cmd> Gitsigns preview_hunk <CR>"}
  }
}

M.neogit = {
  n = {
    ["<leader>gn"] = {
      function ()
        require("neogit").open({kind="split"})
      end
    }
  }
}

return M
