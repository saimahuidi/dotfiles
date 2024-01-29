local config = function ()
  local dapui = require("dapui")
  dapui.setup();
end
return {
  "rcarriga/nvim-dap-ui",
  config = config
}
