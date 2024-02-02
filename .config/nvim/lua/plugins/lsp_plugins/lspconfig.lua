local lsp_config = function()
  local lspconfig = require("lspconfig")
  lspconfig.clangd.setup {}
  lspconfig.lua_ls.setup {}
  lspconfig.cmake.setup {}
  lspconfig.pyright.setup {}
  lspconfig.nushell.setup {}
  lspconfig.rust_analyzer.setup {
    settings = {
      checkOnSave = {
        allFeatures = true,
        command = "clippy-driver",
        extraArgs = { "--no-deps" },
      },

      ['rust-analyzer'] = {
        cargo = {
          extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
          extraArgs = { "--profile", "rust-analyzer", },
        },
      },
    },
  }
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
