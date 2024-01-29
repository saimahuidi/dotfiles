local ensure_installed = { "lua_ls", "clangd", "pyright"}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup{ensure_installed = ensure_installed}
  end,
}
