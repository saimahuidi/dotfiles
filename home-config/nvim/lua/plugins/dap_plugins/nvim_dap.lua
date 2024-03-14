local config = function()
  local dap = require("dap")
  -- config gdb
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
  }

  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "${workspaceFolder}",
    },
  }
  dap.configurations.cpp = dap.configurations.c
end
return {
  "mfussenegger/nvim-dap",
  config = config,
}
