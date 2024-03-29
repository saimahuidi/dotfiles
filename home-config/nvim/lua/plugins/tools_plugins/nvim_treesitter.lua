return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "nu", "regex", "bash", "markdown", "markdown_inline"},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  dependencies = {
    { "nushell/tree-sitter-nu" },
  },
}
