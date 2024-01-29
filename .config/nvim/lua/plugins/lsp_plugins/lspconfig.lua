local lsp_config = function()
  local lspconfig = require("lspconfig")
  lspconfig.clangd.setup{}
  lspconfig.lua_ls.setup{}
  lspconfig.cmake.setup{}
  lspconfig.pyright.setup{}
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  lazy = false,
  config = lsp_config
}
