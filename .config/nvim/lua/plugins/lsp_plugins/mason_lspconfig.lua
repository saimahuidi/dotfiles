local ensure_installed = { "lua_ls", "pyright" }
local config = function()
  require("mason-lspconfig").setup { ensure_installed = ensure_installed }
  local lspconfig = require("lspconfig")
  lspconfig.clangd.setup {
    cmd = {
      "clangd",
      "--background-index",
      "--background-index-priority=normal",
      "--clang-tidy",
      "--completion-style=detailed",
      "--debug-origin",
      "--fallback-style=google",
      "--function-arg-placeholders",
      "--header-insertion=iwyu",
      "--header-insertion-decorators",
      "--pretty",
    }
  }
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
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = config,
}
