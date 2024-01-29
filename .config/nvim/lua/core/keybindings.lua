vim.g.mapleader = " "
local wk = require("which-key")
local telescope = require("telescope.builtin")
local map = vim.keymap.set

-- about diagnostic
-- Global mappings.
-- See `:help vim.diagnostic.*`
-- for documentation on any of the below functions
wk.register(
  {
    d = {
      name = "about diagnostic",
      o = { vim.diagnostic.open_float , "open float window of this diagnostic" },
      l = { "<cmd>Telescope diagnostics<CR>", "list all diagnostics in telescope" },
      n = { vim.diagnostic.goto_next, "go to next diagnostic" },
      p = { vim.diagnostic.goto_prev, "go to previous diagnostic" },
      s = { vim.diagnostic.show, "show all the diagnostics in the buffer" },
      h = { vim.diagnostic.hide, "hide all the diagnostics in the buffer" },
    }
  },
  { prefix = "<leader>" }
)

-- about lsp
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    wk.register(
      {
        l = {
          name = "about lsp",
          h = { vim.lsp.buf.hover, "hover" },
          f = { function() vim.lsp.buf.format { async = true } end, "format" },
          r = { telescope.lsp_references, "references" },
          n = { vim.lsp.buf.rename, "rename" },
          d = { telescope.lsp_definitions, "definitions" },
          D = { vim.lsp.buf.declaration, "declaration" },
          s = { telescope.lsp_document_symbols, "symbols of the ducument" },
          i = { telescope.lsp_implementations, "implementations" },
          m = { telescope.lsp_incoming_calls, "incoming calls" },
          g = { telescope.lsp_outgoing_calls, "outgoing calls" },
          t = { telescope.lsp_type_definitions, "type definitions" },
          w = { telescope.lsp_workspace_symbols, "workspace symbols" },
          p = { telescope.lsp_dynamic_workspace_symbols, "dynamic workspace symbols" },
          c = { vim.lsp.buf.code_action, "code action" },
          e = { vim.lsp.buf.signature_help, "signature help" },
          a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
          x = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
          l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "list workspace folders" },
        }
      },
      { prefix = "<leader>", buffer = ev.buf }
    )
  end,
})

-- about neotree
wk.register(
  {
    n = {
      name = "about neo-tree",
      f = { "<cmd>Neotree source=filesystem<CR>", "filesystem in neo-tree" },
      b = { "<cmd>Neotree source=buffers<CR>", "buffers in neo-tree" },
      g = { "<cmd>Neotree source=git_status<CR>", "git in neo-tree" },
      s = { "<cmd>Neotree source=document_symbols<CR>", "symbols in neo-tree" },
      c = { "<cmd>Neotree close<CR>", "close neo-tree" },
    }
  },
  { prefix = "<leader>" }
)

-- about neovim itself
map("i", "jj", "<esc>")
map("n", "qa", function () vim.cmd("wqa") end)
map("n", "<C-j>", "4j")
map("n", "<C-k>", "4k")

-- about buffer
wk.register(
  {
    name = "about buffer",
    j = {"<cmd>BufferLineCyclePrev<CR>", "go to previous buffer"},
    k = {"<cmd>BufferLineCycleNext<CR>", "go to next buffer"},
    p = {"<cmd>BufferLinePick<CR>", "pick buffer"},
    c = {"<cmd>BufferLinePickClose<CR>", "close specific buffer"},
    o = {"<cmd>BufferLineCloseOthers<CR>", "close other buffer"},
    r = {"<cmd>BufferLineCloseRight<CR>", "close right buffer"},
    l = {"<cmd>BufferLineCloseLeft<CR>", "close left buffer"},
  },
  { prefix = "<leader>b" }
)

-- about telescope
wk.register(
  {
    t = {
      name = "about telescope",
      a = {"<cmd>Telescope autocommand<CR>", "autocommand"},
      b = {"<cmd>Telescope buffers<CR>", "buffers"},

      c = { name = "command" },
      ch = {"<cmd>Telescope command_history<CR>", "command_history"},
      cm = {"<cmd>Telescope commands<CR>", "commands"},

      f = { name = "find"},
      ff = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "current_buffer_fuzzy_find"},
      fd = {"<cmd>Telescope fd<CR>", "fd"},
      fs = {"<cmd>Telescope grep_string<CR>", "grep_string"},
      fh = {"<cmd>Telescope help_tags<CR>", "help_tags"},
      fk = {"<cmd>Telescope highlights<CR>", "highlights"},
      fl = {"<cmd>Telescope live_grep<CR>", "live_grep"},
      fm = {"<cmd>Telescope man_pages<CR>", "man_pages"},
      fo = {"<cmd>Telescope oldfiles<CR>", "oldfiles"},


      g = { name = "git" },
      gt = {"<cmd>Telescope git_bcommits<CR>", "git_bcommits"},
      gb = {"<cmd>Telescope git_branches<CR>", "git_branches"},
      gc = {"<cmd>Telescope git_commits<CR>", "git_commits"},
      gf = {"<cmd>Telescope git_files<CR>", "git_files"},
      gh = {"<cmd>Telescope git_stash<CR>", "git_stash"},
      gs = {"<cmd>Telescope git_status<CR>", "git_status"},

      l = { name = "lsp" },
      ld = {"<cmd>Telescope lsp_definitions<CR>", "lsp_definitions"},
      ls = {"<cmd>Telescope lsp_document_symbols<CR>", "lsp_document_symbols"},
      lm = {"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "lsp_dynamic_workspace_symbols"},
      li = {"<cmd>Telescope lsp_implementations<CR>", "lsp_implementations"},
      ln = {"<cmd>Telescope lsp_incoming_calls<CR>", "lsp_incoming_calls"},
      lo = {"<cmd>Telescope lsp_outgoing_calls<CR>", "lsp_outgoing_calls"},
      lr = {"<cmd>Telescope lsp_references<CR>", "lsp_references"},
      lt = {"<cmd>Telescope lsp_type_definitions<CR>", "lsp_type_definitions"},
      lw = {"<cmd>Telescope lsp_workspace_symbols<CR>", "lsp_workspace_symbols"},

      j = {"<cmd>Telescope jumplist<CR>", "jumplist"},
      d = {"<cmd>Telescope diagnostics<CR>", "diagnostics"},
      k = {"<cmd>Telescope keymaps<CR>", "keymaps"},
      p = {"<cmd>Telescope pickers<CR>", "pickers"},
      r = {"<cmd>Telescope registers<CR>", "registers"},
      h = {"<cmd>Telescope search_history<CR>", "search_history"},
      v = {"<cmd>Telescope vim_options<CR>", "vim_options"},
    }
  },
  { prefix = "<leader>"}
)

